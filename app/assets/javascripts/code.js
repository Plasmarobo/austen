//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/
var code_id = -1;
var codejs = {
buildModal: function(){
    var div = $('<div>');
    return div;
  },
  populateModal: function(id, url, callback){
    //var div = .buildModal();
    $("#" + id).html("");
    codejs.requestBody(url,{}, id, callback);
    $("#" + id + "modal").modal("show");
  },
  
  setModal: function(id, data){
    //var div = codejs.buildModal();
    $("#" + id).html(data);
    //codejs.wrap(data, id);
    $("#" + id + "modal").modal("show");
  },
  
  cleanModals: function(include_error){
    var modal_set = $('.modal');
    if (include_error == true)
    {
      modal_set.remove()
    }
    else
    {
      modal_set.not('#error-window').remove();
    }
    $('body').removeClass("modal-open");
  },
  
  openModal: function(id){
    codejs.cleanModals();
    var div = $('<div id=\"' + id + '\" class=\"modal fade\" role=\"dialog\" aria-labelledby=\"ModalLabel\" aria-hidden=\"true\" >');
    var outer_center = $("<div class='mwin_outer_center'>");
    var inner_center = $("<div class='mwin_inner_center mwin' id='" + id + "'>");
    outer_center.append(inner_center);
    div.append(outer_center);
    $('body').append(div);
  },
  
  cardModal: function(url){
    codejs.openModal("cardModal");
    $("#cardModal").html("<h1>Loading</h1>");
    codejs.populateModal("cardModal", url, null);
  },

  errorModal: function(jqXHR, status){
    $('#error-window').remove();
    codejs.openModal("error-window");
    var content = $("<div>");
    content.append("<h1>Error</h1>")
    content.append($("<div class='vh_region_title'>").html(status));
    content.append($("<div>").html(jqXHR.responseText));
    codejs.wrap(content, "error-window",$('<div>', {class: 'container mwin'}));
    $("#error-window").modal("show");
  },
  
  confirmDialog: function(message, yes_callback, no_callback){
    codejs.openModal("confirm");
    $("#confirm").modal('show');
    $("#confirm").append("<div class='container mwin'><h1>Are you sure?</h1><p>"+message+"</p><button id='yes_btn' class='btn btn-default'>Yes</button><button id='cancel_btn' class='btn btn-default'>Cancel</button></div>");
    $("#yes_btn").click(function(){
      codejs.cleanModals(false);
      yes_callback();
    });
    $("#cancel_btn").click(function(){
      codejs.cleanModals(false);
      if (typeof(no_callback)!=='undefined')
      {
        no_callback();
      }
    });
    return false;
  },
  wrap: function(data, target, wrapper)
  {
    var content = null;
     if (typeof(wrapper)!=='undefined')
    {
      wrapper.append(data);
      $("#" + target).append(wrapper);
    }
    else
    {
      $("#" + target).append(data);
    }
  },
  replace: function(data, target, wrapper)
  {
    var content = null;
     if (typeof(wrapper)!=='undefined')
    {
      wrapper.append(data);
      $("#" + target).html(wrapper);
    }
    else
    {
      $("#" + target).html(data);
    }
  },
  hoverHideInterval : null,
  openHoverWindow: function(event, url, attachment_point)
  {
    // TODO introduce a small delay to not load more than necessary
    if (codejs.hoverHideInterval != null)
    {
      clearTimeout(codejs.hoverHideInterval);
      codejs.hoverHideInterval = null;
      var div = $("#hover-window");
      div.html("");
    }
    else
    {
      var div = $("<div id='hover-window' class='vh_hover_window'>");
      $('#' + attachment_point).append(div);
    }
    
    var x = event.clientX+128;
    var y = event.clientY-20;
    
    var w = window.innerWidth;
    var h = window.innerHeight;
    
    var aproximateHeight = 600;
    var aproximateWidth = 400;
    
    if (y > (h-aproximateHeight))
    {
      y = h-aproximateHeight;
    }
    if (x > (w-aproximateWidth))
    {
      x = w-aproximateWidth;
    }
    
    div.css({'top':y,'left':x, 'display':'none'}).fadeIn('fast');
    codejs.replaceBody(url,{}, "hover-window");
  },
  closeHoverWindow: function()
  {
    if (codejs.hoverHideInterval == null)
    {
      codejs.hoverHideInterval = setTimeout(function(){
        codejs.hoverHideInterval = null;
        $("#hover-window").fadeOut("slow", 
        function() {
          $("#hover-windw").remove();
        });
      },2000);
    }  
  },
  
  //Send a POST request to URL, expect data as JSON
  getJson: function(url, payload, success_callback){
    $.ajax(url, {
      type: 'POST',
      dataType: 'json',
      data: payload,
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      success: success_callback,
      error: codejs.errorModal(jqXHR, status)
    });
  },
  
  //Send a POST request to a URL, expect data as HTML
  getHtml: function(url, payload, success_callback){
    $.ajax(url,{
      type: 'POST',
      dataType: 'html',
      data: payload,
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      success: success_callback,
      error: codejs.errorModal
    });
  },
  
  //Send a POST request, expect text if anything
  sendPOST: function(url, payload, success_callback){
    $.ajax(url,{
      type: 'POST',
      dataType: 'text',
      data: payload,
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      success: success_callback,
      error: codejs.errorModal
    });
  },
  
  // Use a POST request to pull data into a target div
  // Optional wrapper element may be specified
  requestBody: function(url, params, target, onload, wrapper){
    $.ajax(url,{
      type: 'POST',
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      data: params,
      dataType: 'html',
      success: function(data){
        codejs.wrap(data, target, wrapper);
        if ((typeof(onload)!== "undefined") && (onload !== null))
        {
          onload();
        }
      },
      error: codejs.errorModal,
    });
  },

  replaceBody: function(url, params, target, onload, wrapper){
    $.ajax(url,{
      type: 'POST',
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      data: params,
      dataType: 'html',
      success: function(data){
        codejs.replace(data, target, wrapper);
        if (typeof(onload) !== "undefined")
        {
          if (onload !== null)
          {
            onload();
          }
        }
      },
      error: codejs.errorModal,
    });
  },
  
  //Use a GET request to pull data into a target div
  //params encoded in URL
  getBody: function(url, target, onload, wrapper){
    $.ajax(url,{
      type: 'GET',
      beforeSend: function(xhr)
      {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      dataType: 'html',
      success: function(data){
        codejs.wrap(data, target, wrapper);
        if (typeof(onload)!== "undefined")
        {
          onload();
        }
      },
      error: codejs.errorModal,
    });
  },
  // Not a general pluralizer, super narrow case
  getPlural: function(word)
  {
    switch(word.slice(-1))
    {
      case "y":
        word = word.slice(0, word.length-1) + "ies";
        break;
      case "r":
        break;
      default:
        word = word + "s";
        break;
    }
    return word;
  },
}

function hookTagRows()
{
  $(".tagrow").each(function(index, row){
    row = $(row);
    row.on("click", function(event){
      row = $(this);
      if (row.hasClass("selected"))
      {
        row.removeClass("selected");
        row.addClass("unselected");
      }
      else if (row.hasClass("unselected"))
      {
        row.removeClass("unselected");
        row.addClass("selected");
      }
    });
    if (row.attr("tag_id") == code_id)
    {
      row.addClass("selected");
    }
    else
    {
      row.addClass("unselected");
    }
  });  
};


function newtag(){
  codejs.requestBody("/code/new_tag", {}, "newtag", function(){
    $("#newtag").slideDown(500);
    //Replace submit function
    $("#new_code_tag").submit(function(e){
      e.preventDefault();
      var data = {};
      $("#new_code_tag").serializeArray().map(function(x){data[x.name] = x.value;}); 
      codejs.sendPOST("/code/create_tag.json", data,function(result)
      {
        codejs.replaceBody('/code/tag_index',{}, "tags", function(){hookTagRows();});
      });
      return false;
    });
  });
};

function linkTags(event){
  var data = {};
  data.links = [];
  $(".selected").each(function(index, item)
  {
    data.links.push($(item).attr("tag_id"));
  });
  data.code = {};
  $("#new_code").serializeArray().map(function(x){data[x.name] = x.value;}); 
  codejs.sendPOST("/code/create", data, function(result){
    location.href = "/code/index";
  });
  event.preventDefault();
  return false;
};


$(document).ready(function(){
  codejs.replaceBody('/code/tag_index',{}, "tags", function(){hookTagRows();});
});