# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

new_element = (project_id) ->
    return 0
  
destroy_element = (element_id) ->
  return 0

edit_element = (element_id) ->
  return 0

select_element = (element_id) ->
  return 0

new_subelement = (element_id) ->
  return 0

destroy_subelement = (subelement_id) ->
  return 0

edit_subelement = (subelement_id) ->
  return 0

$ -> 
  $("#project_is_finished").change ->
    (if @checked then $(".project_finished_hidden").show() else $(".project_finished_hidden").hide())
    return

  $('#element_is_finished').change ->
    (if @checked then $('.element_finished_hidden').show() else $('.element_finished_hidden').hide())
    return


  $('#subelement_is_finished').change ->
    (if @checked then $('.subelement_finished_hidden').show() else $('.subelement_finished_hidden').hide())
    return