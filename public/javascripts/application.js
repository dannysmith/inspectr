// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	//Adds a stylesheet for the tablesorter (but only if javascript is enabled.)
	$('head').append('<link rel="stylesheet" href="/stylesheets/tablesorter-blue/style.css" type="text/css" />');
	
	$(".tablesorter").tablesorter();
	$('#container').corner({
				  tl: { radius: 10 },
				  tr: { radius: 10 },
				  bl: { radius: 10 },
				  br: { radius: 10 }});
});

  // rails auth token enabled in jquery
  $(document).ajaxSend(function(event, request, settings) {
  	if (typeof(AUTH_TOKEN) == "undefined") return;
  	settings.data = settings.data || "";
  	settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

  // add javascript request type
  jQuery.ajaxSetup({
    		'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")},
  });

var parent_div_of_item;

// Pops up tthe box.
$(".popup").livequery('click',function(){
        parent_div_of_item = $(this).parent();
        $.get($(this).attr('href'),function(data){
			  // displays centered popup
            $.blockUI({message: $("#modal_window").html(data), css: {width:"600px",
                margin:"-200px 0 0 -300px", left:"50%", textAlign: "left"}});
        });
        return false;
    });

// closes popul when a link with class ".close" is clicked.
    $("#modal_window .close").livequery('click',function(){
        $.unblockUI();
		return false;
    });