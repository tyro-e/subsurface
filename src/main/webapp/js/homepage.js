// Calendar Modal
$(document).ready(function() {
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		defaultDate: '2016-12-12',
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'All Day Event',
				start: '2016-12-01'
			},
			{
				title: 'Long Event',
				start: '2016-12-07',
				end: '2016-12-10'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-12-09T16:00:00'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-12-16T16:00:00'
			},
			{
				title: 'Conference',
				start: '2016-12-11',
				end: '2016-12-13'
			},
			{
				title: 'Meeting',
				start: '2016-12-12T10:30:00',
				end: '2016-12-12T12:30:00'
			},
			{
				title: 'Lunch',
				start: '2016-12-12T12:00:00'
			},
			{
				title: 'Meeting',
				start: '2016-12-12T14:30:00'
			},
			{
				title: 'Happy Hour',
				start: '2016-12-12T17:30:00'
			},
			{
				title: 'Dinner',
				start: '2016-12-12T20:00:00'
			},
			{
				title: 'Birthday Party',
				start: '2016-12-13T07:00:00'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2016-12-28'
			}
		]
	});
});

$(document).ready(function() 
{
	//changeDate();
});




/* Replace all SVG images with inline SVG */
jQuery('img.svg').each(function(){
    var $img = jQuery(this);
    var imgID = $img.attr('id');
    var imgClass = $img.attr('class');
    var imgURL = $img.attr('src');

    jQuery.get(imgURL, function(data) {
        // Get the SVG tag, ignore the rest
        var $svg = jQuery(data).find('svg');

        // Add replaced image's ID to the new SVG
        if(typeof imgID !== 'undefined') {
            $svg = $svg.attr('id', imgID);
        }
        // Add replaced image's classes to the new SVG
        if(typeof imgClass !== 'undefined') {
            $svg = $svg.attr('class', imgClass+' replaced-svg');
        }

        // Remove any invalid XML tags as per http://validator.w3.org
        $svg = $svg.removeAttr('xmlns:a');

        // Check if the viewport is set, if the viewport is not set the SVG wont't scale.
        if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
            $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
        }

        // Replace image with new SVG
        $img.replaceWith($svg);

    }, 'xml');

});