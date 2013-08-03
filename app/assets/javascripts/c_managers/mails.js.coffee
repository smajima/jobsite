# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#mail_check").on 'click', ->
    title = $('input#mail_title').val()
    text = $('textarea#mail_text').val()
    data = {title:title, text:text}
    $.ajax
      url:"/c_managers/mails/check"
      data: data

  $("#c_manager_mail_cancel").on 'click', ->
    apply_id = $('input#apply_id').val()
    window.location = "/c_managers/mails/lists?apply_id=" + apply_id

  $("#user_mail_cancel").on 'click', ->
    window.location = "/mails/" 