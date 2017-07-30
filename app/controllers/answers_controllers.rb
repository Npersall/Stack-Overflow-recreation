post '/questions/:question_id/answers' do
  @new_answer = Answer.new(commenter_id: current_user.id, question_id: params[:question_id], body: params[:new_answer])
  if @new_answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @new_answer.errors.full_messages
    erb :'/questions/show'
  end
end


get '/questions/:question_id/answers/:answer_id/best' do
  @this_answer = Answer.find(params[:answer_id])
  @question = @this_answer.question
  @answers = @question.answers

  remove_best_answer(@answers)

  @this_answer.update(best_answer: true)

  redirect "/questions/#{ @question.id }"
end