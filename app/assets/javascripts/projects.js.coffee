# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ -> 
  $("#project_is_finished").change ->
    (if @checked then $(".project_finished_hidden").show() else $(".project_finished_hidden").hide())
    return

  
