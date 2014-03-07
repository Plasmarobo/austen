# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $('#subelement_is_finished').change ->
    (if @checked then $('.subelement_finished_hidden').show() else $('.subelement_finished_hidden').hide())
    return

  $('.add_subelement').click ->

  $('.subelement.listitem').click ->

  $('.edit_subelement').click ->

  $('.remove_subelement').click ->