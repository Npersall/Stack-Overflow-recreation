 # Stack Overflow Recreation

 * Team name: KEHN
 * Team members: Kevin Cai, Elsha Kwee, Hannie Dong, Nate Persall
 * User stories:

### MVP:
- Users can post questions.  
- Other users can answer them.
- Users can comment on both questions and answers. Comments should just be displayed in a flat list.
- The user who posted a question can declare one of the user-submitted answers to be the best answer.
- Users can upvote and downvote questions, answers, and comments—only one vote per user for each question, answer, and comment.
- Users cannot add a question, answer, or comment or vote unless they're logged in, but they can view all of the above when logged out.


Models: 
- Users
- Questions
- Answers
- Comments/Commentable, polymorphic (users can comment on questions and answers)
- Votes/Voteable, polymorphic (users can vote on questions and answers)
