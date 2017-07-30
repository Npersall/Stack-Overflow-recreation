post '/questions/:question_id/votes' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.new(voter_id: current_user.id, vote_direction: params[:vote_type].to_i)


  if @question.votes.where('voter_id = ?', current_user.id).length != 0
    @question.votes.where('voter_id = ?', current_user.id).each { |vote| vote.destroy! }
  end

  if request.xhr?
    @vote.save!
    vote_count(@question).to_s
  else
    if @vote.save
      redirect "/questions/#{params[:question_id]}"
    else
      @question_vote_errors = @vote.errors.full_messages
      erb :'/questions/show', locals: {question: @question}
    end
  end

end

post '/questions/:question_id/answers/:answer_id/votes' do
  @question = Question.find(params[:question_id])
  @this_answer = @question.answers.find(params[:answer_id])

  if @this_answer.votes.where('voter_id = ?', current_user.id).length != 0
    @this_answer.votes.where('voter_id = ?', current_user.id).each { |vote| vote.destroy! }
  end
  @vote = @this_answer.votes.new(voter_id: current_user.id, vote_direction: params[:vote_type].to_i)

  if request.xhr?
    @vote.save!
    content_type :json
    {answer_id: @this_answer.id, vote_count: vote_count(@this_answer).to_s}.to_json
  else
    if @vote.save
      redirect "/questions/#{params[:question_id]}"
    else
      erb :'/questions/show', locals: {question: @question, this_answer: @this_answer}
    end
  end
end