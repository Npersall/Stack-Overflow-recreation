post '/questions/:question_id/votes' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.new(voter_id: current_user.id, vote_direction: params[:vote_type].to_i)

  if @vote.save
    redirect "/questions/#{params[:question_id]}"
  else
    @question_vote_errors = @vote.errors.full_messages
    erb :'/questions/show', locals: {question: @question}
  end
end

post '/questions/:question_id/answers/:answer_id/votes' do
  @question = Question.find(params[:question_id])
  @this_answer = @question.answers.find(params[:answer_id])
  @vote = @this_answer.votes.new(voter_id: current_user.id, vote_direction: params[:vote_type].to_i)

  if @vote.save
    redirect "/questions/#{params[:question_id]}"
  else
    @answer_vote_errors = @vote.errors.full_messages
    erb :'/questions/show', locals: {question: @question, this_answer: @this_answer}
  end
end