def remove_best_answer(answers)
  answers.each do |answer|
    answer.update(best_answer: false)
  end
end