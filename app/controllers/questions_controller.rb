get '/questions/:id' do
  @question = Question.find(params[:id])

  erb :'/questions/show', locals: {question: @question}
end

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @new_comment = true

  erb :'/questions/show', locals: {question: @question}
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @question.comments.create!({
    commenter_id: current_user.id,
    body: params[:new_comment]
  })

  redirect "/questions/#{ @question.id }"
end