def vote_count(post)
  post.votes.reduce(0) do |total_count, vote|
    total_count += vote.vote_direction
  end
end