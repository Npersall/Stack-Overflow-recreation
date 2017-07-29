$(document).ready(function() {
  postQuestionListener();
  newQuestionSubmitListener();
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
       $('.question_form').removeClass('question_form')
       $('#new_question_form').show();
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
      $('#new_question_form_container').addClass('question_form');
      $('#post_question').show();
      $('#new_question_form').trigger('reset')
      $('.questions_posted_list').append(response)

    })
  })
}
