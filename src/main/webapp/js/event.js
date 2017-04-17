$(document).ready(function() 
{
  eventDate();
  buildMap();
});

$(document).ready(function() 
{
    var ticketStatus = $('#ticketStatus').html();
    var length = ticketStatus.length;

    if (length <= 30){
    	$('#ticketStatus').addClass('ticketsAvail');
      $('.ticketStatusDiv').css('display','none');
    }
    else{
    	$('#ticketStatus').addClass('ticketsUnavail');
      $('.ticketLinkDiv').css('display','none');
    }
});

$(document).ready(function() 
{
    var ticketUrl = $('.ticketUrl').html();
    var link = $('#ticket_url_append');
    link.attr('href', ticketUrl);

    $(".commentable").insertAfter(".addComment");
});


function eventDate(){
    var eventDateJSON = document.getElementById('eventTime').innerText;
    var newDate = new Date(eventDateJSON);
    var eventDateNormal = newDate.toDateString();
    
    document.getElementById("eventTimeCorrect").append(eventDateNormal); 

    var currentDate = new Date();
    var currentDateJSON = currentDate.toJSON();

    console.log("event date json: " + eventDateJSON);
    console.log("current date json: " + currentDateJSON);
    console.log("event date normal: " + eventDateNormal);
    console.log("current date normal: " + currentDate);



    if (eventDateJSON > currentDateJSON)
    {
      console.log("event happens after today")

      $('#rating_rating').css('display', 'none');
      $('#rating_form').css('display', 'none');
      $('#rating_notifytext').css('display','none');
      $('.livestream-button').css('display','none');
    }

    if (eventDateJSON < currentDateJSON)
    {
      console.log("event has happened")
      $('.livestream-button').css('display','none');
    }

    if (eventDateJSON = currentDateJSON)
    {
      console.log("event is today")
      $('.livestream-button').css('display','block');
    }
}

 function buildMap()
 {
    var longitude  = parseFloat(document.getElementById("longitude").innerHTML);
    var latitude = parseFloat(document.getElementById("latitude").innerHTML);
    var venue = document.getElementById('venueName').innerText;
    var myLatLng = {lat: latitude, lng: longitude};
    var map;
      
    // centering & zoom level of map
    map = new google.maps.Map(document.getElementById('map'), 
    {     
      center: myLatLng,
      zoom: 15,
      scrollwheel: false,
      disableDefaultUI: true
    });  
    
    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: venue
    });
    
    marker.addListener('click', function(){
      infowindow.open(map, marker);
    });
    
    marker.setMap(map);
}