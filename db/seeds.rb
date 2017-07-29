require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

count = 5 

users = count.times.map do
  User.create!({
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    hashed_password: 'password'
  })
end

questions = count.times.map do
  Question.create!({
    author_id: users.sample.id,
    body: Faker::Lorem.paragraph,
    title: Faker::Lorem.sentence
  })
end

answers = count.times.map do
  Answer.create!({
    commenter_id: users.sample.id,
    question_id: questions.sample.id,
    body: Faker::Lorem.paragraph
  })
end

vote_direction = [1, -1]

votes_answers = answers.each do |answer|
    answer.votes.create!({
    voter_id: users.sample.id,
    vote_direction: vote_direction.sample
  })
end

votes_questions = questions.each do |question|
    question.votes.create!({
    voter_id: users.sample.id,
    vote_direction: vote_direction.sample
  })
end

comments_answers = answers.each do |answer|
    answer.comments.create!({
    commenter_id: users.sample.id,
    body: Faker::Lorem.sentence
  })
end

comments_questions = questions.each do |question|
    question.comments.create!({
    commenter_id: users.sample.id,
    body: Faker::Lorem.sentence
  })
end
