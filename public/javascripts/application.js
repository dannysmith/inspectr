// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	//Tablesorter code
	$(".tablesorter").tablesorter();
	
	//Round the corners of the container
	$('#container').corner({
				  tl: { radius: 10 },
				  tr: { radius: 10 },
				  bl: { radius: 10 },
				  br: { radius: 10 }});
				

	//JQuery UI Tabs code.
	$("#tabs_container").tabs();
	
	//Code to handle refocusing and checking boxes when a cadet is clicked.
	//Subs Table
	$('#subs_table tr').click(function(){
		
		if ($(this).find(':checkbox').length > 0) {
			$box = $(this).find(':checkbox');
			if ($box.is(':checked')) {
				$box.attr('checked', false);
			}
			else {
				$box.attr('checked', true);
			}
		} 
		else {
			$(this).find('.other_amount').focus();
		}
	});
	
	//Code to handle refocusing and checking boxes when a cadet is clicked.
	//Inspection Table
	$('#inspection_table tr').click(function(){
		$(this).find('[id^=cadet_score]').select();
	});
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

// Pops up the box.
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