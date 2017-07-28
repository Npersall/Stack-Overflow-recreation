post '/comments/new' do
  @question = Question.find(params)
    
  redirect "/questions/#{ @question.id }"
end