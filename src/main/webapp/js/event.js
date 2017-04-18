$(document).ready(function() 
{
  eventDate();
  buildMap();
});

$(document).ready(function() 
{
    var ticketStatus = $('#ticketStatus').html();
    var length = ticketStatus.length;

    console.log(length)

    if (length <= 34){
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

      $('.ticketStatusDiv').css('display','block');
      $('.ticketLinkDiv').css('display','block');


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

 function buildMap(){
    var longitude  = parseFloat(document.getElementById("longitude").innerHTML);
    var latitude = parseFloat(document.getElementById("latitude").innerHTML);
    var venue = document.getElementById('venueName').innerText;
    var myLatLng = {lat: latitude, lng: longitude};
    var map;
      
    // centering & zoom level of map
    map = new google.maps.Map(document.getElementById('map'), 
    {     
      center: myLatLng,
      zoom: 13,
      scrollwheel: false,
      styles: [
                {
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#212121"
                    }
                  ]
                },
                {
                  "elementType": "labels.icon",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#757575"
                    }
                  ]
                },
                {
                  "elementType": "labels.text.stroke",
                  "stylers": [
                    {
                      "color": "#212121"
                    }
                  ]
                },
                {
                  "featureType": "administrative",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#757575"
                    }
                  ]
                },
                {
                  "featureType": "administrative.country",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#9e9e9e"
                    }
                  ]
                },
                {
                  "featureType": "administrative.land_parcel",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "administrative.locality",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#bdbdbd"
                    }
                  ]
                },
                {
                  "featureType": "administrative.neighborhood",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "poi",
                  "elementType": "labels.text",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "poi",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#757575"
                    }
                  ]
                },
                {
                  "featureType": "poi.park",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#181818"
                    }
                  ]
                },
                {
                  "featureType": "poi.park",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#616161"
                    }
                  ]
                },
                {
                  "featureType": "poi.park",
                  "elementType": "labels.text.stroke",
                  "stylers": [
                    {
                      "color": "#1b1b1b"
                    }
                  ]
                },
                {
                  "featureType": "road",
                  "elementType": "geometry.fill",
                  "stylers": [
                    {
                      "color": "#2c2c2c"
                    }
                  ]
                },
                {
                  "featureType": "road",
                  "elementType": "labels",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "road",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#8a8a8a"
                    }
                  ]
                },
                {
                  "featureType": "road.arterial",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#373737"
                    }
                  ]
                },
                {
                  "featureType": "road.arterial",
                  "elementType": "labels",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "road.highway",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#3c3c3c"
                    }
                  ]
                },
                {
                  "featureType": "road.highway",
                  "elementType": "labels",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "road.highway.controlled_access",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#4e4e4e"
                    }
                  ]
                },
                {
                  "featureType": "road.local",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "road.local",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#616161"
                    }
                  ]
                },
                {
                  "featureType": "transit",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#757575"
                    }
                  ]
                },
                {
                  "featureType": "water",
                  "elementType": "geometry",
                  "stylers": [
                    {
                      "color": "#000000"
                    }
                  ]
                },
                {
                  "featureType": "water",
                  "elementType": "labels.text",
                  "stylers": [
                    {
                      "visibility": "off"
                    }
                  ]
                },
                {
                  "featureType": "water",
                  "elementType": "labels.text.fill",
                  "stylers": [
                    {
                      "color": "#3d3d3d"
                    }
                  ]
                }
              ]
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