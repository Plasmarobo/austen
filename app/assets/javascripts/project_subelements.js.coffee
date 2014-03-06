# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


new_subelement = (element_id) ->
  return 0

destroy_subelement = (subelement_id) ->
  return 0

edit_subelement = (subelement_id) ->
  return 0


$ ->
  $('#subelement_is_finished').change ->
    (if @checked then $('.subelement_finished_hidden').show() else $('.subelement_finished_hidden').hide())
    return