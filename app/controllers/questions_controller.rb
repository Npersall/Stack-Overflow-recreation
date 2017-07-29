before do
  current_user && logged_in?
end

get '/questions/new' do
  if request.xhr?
    erb :'questions/_new_question_form', layout: false
  else
   erb :'questions/new'
  end
end

post '/questions' do
@question= Question.new(params[:question])
  if request.xhr?
    if @question.save
      erb :'questions/_question_display', layout: false, locals: { question: @question}
    else
      status 500
    end
  else
    if @question.save
      redirect "users/#{@question.author.id}"
    else
      @errors = @question.errors.full_messages
      erb :'questions/new'
    end
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show', locals: {question: @question}
end

get '/questions/:id/question/comments' do
  @question = Question.find(params[:id])
  @question_new_comment = true

  erb :'/questions/show', locals: {question: @question}
end

post '/questions/:id' do
  @question = Question.find(params[:id])

  if params[:answer_id]
    @answer = @question.answers.find(params[:answer_id])
    @answer.comments.create!({
    commenter_id: current_user.id,
    body: params[:new_comment]
  })
  else
    @question.comments.create!({
      commenter_id: current_user.id,
      body: params[:new_comment]
    })
  end
  redirect "/questions/#{ @question.id }"
end

get '/questions/:question_id/answers/:answer_id/comments' do
  @question = Question.find(params[:question_id])
  @answer_new_comment = true
  @this_answer = @question.answers.find(params[:answer_id])

  erb :'/questions/show', locals: {question: @question, this_answer: @this_answer}
end
