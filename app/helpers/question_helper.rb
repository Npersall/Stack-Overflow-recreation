def question_poster(question)
  if current_user.id == question.author.id
    return true
  end
  false
end