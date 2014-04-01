# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $('#subelement_is_finished').change ->
    (if @checked then $('.subelement_finished_hidden').show() else $('.subelement_finished_hidden').hide())
    return

  $('.add_subelement').click ->
    $('#subelement_dialog').show()

  $('#new_project_subelement').submit (e)->
    e.preventDefault();
    postData = $('#new_project_subelement').serializeArray()
    postData.push({name: 'project_subelement[project_element_id]', value: window.element_id})
    url = '/project_subelements.ajax'
    obj = $.ajax url: url, type: "POST", data: postData
    obj.done (data, status, jqXHR) ->
      if data == "success"
        $('#subelement_dialog').hide()
        $.ajax('/project_elements/'+ window.element_id + '/subelements.ajax').done (data, status, jqXHR) ->
          $('.subelement_list').html(data)
      else
        $('#subelement_dialog').html(data)      
    false