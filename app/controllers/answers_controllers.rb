post '/questions/:question_id/answers' do
  @new_answer = Answer.new(commenter_id: current_user.id, question_id: params[:question_id], body: params[:new_answer])
  if @new_answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @new_answer.errors.full_messages
    erb :'/questions/show'
  end
end