$(document).ready(function() {
  postQuestionListener();
  newQuestionSubmitListener();
  questionUpvoteListener();
  questionDownvoteListener();
  answerUpvoteListener();
  answerDownvoteListener();
});

var postQuestionListener = function() {
  $('#post_question').on('submit', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var method = $(this).attr('method');

    $.ajax({
      url: url,
      method: method
    })
    .done(function(response){
       $('#post_question').hide();
       $('#new_question_form_container').show();
       // $('#new_question_form').show();
   })
    .fail(function(){
      console.log("Failed to load question form.")
    })
  });
};

var newQuestionSubmitListener = function() {
  $('#new_question_form').on('submit', function(event){
    event.preventDefault();
      debugger

    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serialize()
    console.log(method)
    console.log(data)
    console.log(url)

    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done(function(response) {
      $('#new_question_form_container').hide();
      $('#post_question').show();
      $('#new_question_form').trigger('reset')
      $('.questions_posted_list').append(response)
    })
  })
}


var questionUpvoteListener = function() {
  $('#question-upvote').on('click', '#question-upvote-button', function(e){
    e.preventDefault();

    var form = $(this).closest('#question-upvote');

    questionVoteListener(form);
  });
};


var questionDownvoteListener = function() {
  $('#question-downvote').on('click', '#question-downvote-button', function(e){
    e.preventDefault();

    var form = $(this).closest('#question-downvote');

    questionVoteListener(form);
  });
};

var answerUpvoteListener = function() {
  $('.answers-container').on('click', '#answer-upvote-button', function(e){
    e.preventDefault();

    var form = $(this).closest('#answer-upvote');

    answerVoteListener(form)
  });
};

var answerDownvoteListener = function() {
  $('.answers-container').on('click', '#answer-downvote-button', function(e){
    e.preventDefault();

    var form = $(this).closest('#answer-downvote');

    answerVoteListener(form);
  });
};

function questionVoteListener(form) {
  var request = $.ajax({
    url: form.attr('action'),
    method: form.attr('method'),
    data: form.serialize()
  })

  request.done(function(response) {
    $('#question-vote-count').html(response);
  });

  request.fail(function() {
    alert("Failed to vote");
  });
};

function answerVoteListener(form) {
  var request = $.ajax({
    url: form.attr('action'),
    method: form.attr('method'),
    data: form.serialize()
  })

  request.done(function(response) {
    var answer_id = response['answer_id']
    $('#' + answer_id + ' .answer-vote-count').html(response['vote_count']);
  });

  request.fail(function() {
    alert("Failed to vote");
  });
};