get '/questions/:id' do
  @question = Question.find(params[:id])

  erb :'/questions/show', locals: {question: @question}
end

# get '/questions/:id/comments' do
#   @question = Question.find(params[:id])

#   erb :'/questions/show', locals: {question: @question}
# end