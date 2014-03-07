# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  window.element_id = $('.elements').children('.listitem').first().attr('element_id')
  $('#element_is_finished').change ->
    (if @checked then $('.element_finished_hidden').show() else $('.element_finished_hidden').hide())
    return

  $('.elements').children('.listitem').click ->
      $('.elements').children('.listitem').removeClass('selected')
      $(this).addClass('selected')
      window.element_id = $(this).attr("element_id")
      $('.subelement_lust').html("Loading...")
      $.ajax('/project_elements/' + window.element_id + '/subelements', dataType: 'html').done (data, status, jqXHR) ->
        $('.subelement_list').html(data)

  $('.add_element').click ->
    $('#element_dialog').show()

  $('#new_project_element').submit (e)->
    e.preventDefault();
    postData = $('#new_project_element').serializeArray()
    postData.push({name: 'project_element[project_id]', value:  $('#project_id').val()})
    url = '/project_elements.ajax'
    obj = $.ajax url: url, type: "POST", data: postData
    obj.done (data, status, jqXHR) ->
      if data == "success"
        $('#element_dialog').hide()
        $.ajax('/projects/'+ $("#project_id").val() + '/elements.ajax').done (data, status, jqXHR) ->
          $('.element_container').html(data)
      else
        $('#element_dialog').html(data)      
    false