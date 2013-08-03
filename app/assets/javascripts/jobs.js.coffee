# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  @deleteJob=(number) -> 
    if number != 1
      $("#reg#{number}").remove()

  @addJob=(number) ->
    next_number = parseInt(number) + 1
    $('#max_num').val(next_number)
    $.ajax 
      url: "/resume/job_frame/?number=#{next_number}"
      type: 'get'
   
  $("input#apply-submit").on "click", ->
    if $("input#user_id").val() == ""
      alert('You have to login to apply')
      false
    else
      true
