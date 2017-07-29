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
p 'here'
  if request.xhr?
    p 'xhr'
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

# get '/questions/:id/comments' do
#   @question = Question.find(params[:id])

#   erb :'/questions/show', locals: {question: @question}
# end
