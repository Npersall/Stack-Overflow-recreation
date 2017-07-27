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
    body: Faker::Hacker.adjective,
    title: Faker::Pokemon.move
  })
end

answers = count.times.map do
  Answer.create!({
    commenter_id: users.sample.id,
    question_id: questions.sample.id,
    body: Faker::Hacker.say_something_smart
  })
end

comment_vote_type = ["anwer", "question"]
vote_direction = [1, -1]

votes = count.times.map do
  Vote.create!({
    votable_id: [1,2,3,4,5].sample,
    votable_type: comment_vote_type.sample,
    voter_id: users.sample.id,
    vote_direction: vote_direction.sample
  })
end

comments = count.times.map do
  Comment.create!({
    commentable_id: [1,2,3,4,5].sample,
    commentable_type: comment_vote_type.sample,
    commenter_id: users.sample.id,
    body: Faker::Pokemon.move
  })
end