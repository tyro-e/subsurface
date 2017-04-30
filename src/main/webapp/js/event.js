$(document).ready(function() {
  eventDate();
  buildMap();
  overallRating();
});

(function($) {
    $.fn.clickToggle = function(func1, func2) {
        var funcs = [func1, func2];
        this.data('toggleclicked', 0);
        this.click(function() {
            var data = $(this).data();
            var tc = data.toggleclicked;
            $.proxy(funcs[tc], this)();
            data.toggleclicked = (tc + 1) % 2;
        });
        return this;
    };
}(jQuery));

$(document).ready(function(){
   $('.slider-for').slick(   {
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      speed: 250,
      asNavFor: '.slider-nav'
  });

  $('.slider-nav').slick({
      slidesToShow: 8,
      slidesToScroll: 1,
      asNavFor: '.slider-for',
      dots: true,
      centerMode: true,
      centerPadding: '40px',
      speed: 250,
      focusOnSelect: true
  });



  $('#upload-button').clickToggle(function(){
    $('#upload-button').css({'background-color':'white',
                              'border':'1px solid white',
                              'color':'black'});
    $('#upload-chooser').css('display','block');
  },

  function(){
    $('#upload-button').css({'background-color':'black',
                              'border':'1px solid white',
                              'color':'white'});
    $('#upload-chooser').css('display','none');
  });
});

$(document).ready(function() {
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

$(document).ready(function() {
    var ticketUrl = $('.ticketUrl').html();
    var link = $('#ticket_url_append');
    link.attr('href', ticketUrl);

    $(".commentable").insertAfter(".addComment");

    $('.slick-track').css('transform','translate3d(0, 0, 0)');
    $('.slick-list').css('padding','0');
});



function overallRating(){
    var items = document.getElementsByClassName("ratingz");
    $('.ratingz').css('display','none');
    var itemCount = items.length;
    var sum = 0;

    for(var i = 0; i < itemCount; i++)
    {
        sum += parseInt(items[i].textContent);
    }

    var average = sum / itemCount;
    var averageDecimals = average.toFixed(1);

    if (String(averageDecimals) === 'NaN'){
      averageDecimals = 0;
    }    

    console.log(averageDecimals);
    $('.overall-rating').append(averageDecimals);
}

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

    var eJ = eventDateJSON.substring(10,0);
    var cJ = currentDateJSON.substring(10,0);

    if (eJ > cJ)
    {
      console.log("event has not happened yet")

      // hide livestream
      $('.livestream-button').css('display','none');

      // show ticket links
      $('.ticketStatusDiv').css('display','block');
      $('.ticketLinkDiv').css('display','block');

      // show spotify
      $('.spotify-section').css('display','block');

      // hide setlist
      $('.setlist-section').css('display','none');

      // hide ratings
      $('.rating-text').css('display','none');
      $('.rating-field').css('display','none');
      $('.overall-rating-div').css('display','none');

      //hide upload
      $('#upload-button').css('display','none');

    }

    if (eJ < cJ)
    {
      console.log("event has happened")

      $('.livestream-button').css('display','none');
    }

    if (eJ == cJ)
    {
      console.log("event is today")

      $('.livestream-button').css('display','block');
      $('.spotify-section').css('display','block');
      $('.setlist-section').css('display','none');

      // hide ratings
      $('.rating-text').css('display','none');
      $('.rating-field').css('display','none');
      $('.overall-rating-div').css('display','none');

      // show ticket links
      $('.ticketStatusDiv').css('display','block');
      $('.ticketLinkDiv').css('display','block');

      //hide upload
      $('#upload-button').css('display','none');
    }
}

function checkInput(ob) {
  var invalidChars = /[^0-9]/gi
  if(invalidChars.test(ob.value)) {
            ob.value = ob.value.replace(invalidChars,"");
      }
}

$(document).ready( function() {

  var eventID = document.getElementById('eventId').innerText;

  $( ".add-track-button" ).click( function (){
      $.ajax( {
          url: setlistAddAction,
          type: "POST",
          data: { position: $('.song-position').val(), track: $('.song-title').val(), event:eventID  },
          
          success: function() {
            $(".setlist").load(location.href+" .setlist>*","");
            $('.song-position').val("");
            $('.song-title').val("");
          },
          error: function() {
              alert("Something went wrong there!");
          }
      });
  });
});

$(document).ready( function() {

  var eventID = document.getElementById('eventId').innerText;

  $(".comment-ajax").click( function (){
      $.ajax( {
          url: reviewCommentAction,
          type: "POST",
          data: { comment: $('.review-textarea').val(), rating: $('input[name=rating]:checked').val(), event:eventID  },
          
          success: function() {
              alert("success");
          },
          error: function() {
              alert("fail");
          }
      });
  });
});

/*
$( document ).ready( function() {

  var eventID = document.getElementById('eventId').innerText;

  $( ".delete-setlist-btn" ).click( function (){

      $.ajax( {
          url: setlistDeleteAction,
          type: "DELETE",
          data: {id:id },
          
          success: function() {
            $(".setlist").load(location.href+" .setlist>*","");
          },
          error: function() {
              alert("Something went wrong there!");
          }
      } );
  });
});
*/



/*
$( document ).ready( function() {
  $( "#deleteComment" ).click( function (){
      $.ajax( {
          url: reviewDeleteAction,
          type: "DELETE",
          data: {author:session.user.id},
          

          success: function() {
              alert("success");
          },
          error: function(xhr) {
              alert("fail");
          }
      } );
  });
});
*/


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