# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



  check_to_hide_or_show_add_link = ->
    if $('.sub_question .mc_sub_question').length ==1
      $('#sub_question_button a').hide()
    else
      $('#sub_question_button a').show()
    return

  $('.sub_question').on 'cocoon:after-insert', ->
    check_to_hide_or_show_add_link()
    return
  $('.sub_question').on 'cocoon:after-remove', ->
    check_to_hide_or_show_add_link()
    return
  check_to_hide_or_show_add_link()
  return