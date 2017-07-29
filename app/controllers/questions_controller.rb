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
  @answer = @question.answers.find(params[:answer_id])

  if @answer
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