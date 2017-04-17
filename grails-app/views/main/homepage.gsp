<%@ page import="fyp.Event" %>
<html ng-app="myApp" ng-controller="BandsInTownController">
<head>
  <title>SUBSURFACE</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">

  <!-- STYLESHEETS -->
  <link rel="stylesheet" href="${resource(dir:'css',file:'homepage-main.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css/plugins',file:'bootstrap-datetimepicker.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css/plugins',file:'fullcalendar.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css/plugins',file:'fullcalendar.print.css')}" />
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${resource(dir:'css',file:'responsiveness.css')}" />

  <!-- ANGULAR JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
  <script src="https://code.angularjs.org/1.4.5/angular-route.js"></script> 

</head>

<body>
  <div class="content">
    <div class="intro-body">
      <div class="container homepage-section1">

        <!-- BACKGROUND VIDEO -->
        <video muted="true" loop autoplay playsinline class="fullscreen-bg_video">
          <source src="https://s3-eu-west-1.amazonaws.com/fyp-subsurface/homepage/homepage-video.mp4" type="video/mp4">
        </video>

        <!-- ROOM URL -->
        <div id="room-id"></div>
        <button id="open-room"></button>
        <button id="join-room">Join</button>
        <button id="open-or-join-room">Auto Start or Join</button>
        <div id="room-urls" style="display: none;"></div>

        <!-- CALENDAR MODAL BUTTON -->
        <a href="#calendarModal" role="button" data-toggle="modal">
          <img class = "svg" id="calendarModalBtn" src="${resource(dir:'images/homepage', file: 'calendarIconSVG.svg')}">
        </a>

        <div class="homepage-top-main-container">
          <div class="row" style="margin-bottom: 15px;">
            <div class = "col-md-12">
              <div class="brand-heading" style="color: white;">SUBSURFACE</div>
              <p class="intro-text">ELECTRONIC MUSIC EVENTS <span style="color: red"> // </span> DUBLIN</p>
            </div>
          </div>
        </div>

        <div class = "scroll-button-div">
          <a href="#scroll" style="color:transparent">
            <img id="scroll-to-arrow" src="https://www.viddyad.com/wp-content/uploads/2016/10/down-arrow.png" style="width: 50px;">
          </a>
        </div>
        
        <!-- REGISTER IF NOT LOGGED IN -->
        <sec:ifNotLoggedIn>
          <div class = "register-text" style="text-align: center;">New to the site? 
            <u style="cursor: pointer;color: rgba(255,255,255,0.4);">Register</u>
          </div>
        </sec:ifNotLoggedIn>
      </div>

      <!-- BEGIN PAGE CONTENT -->
      <div class="homepage-section2" id ="#scroll">
        <div class = "container row" style="width: 100%;margin-right: 0;margin-left: 0;padding-right: 0;padding-left: 0;">
          <div class="pure-g">

            <!-- LEFT -->
            <div id = "left-panel" class="col-md-3" style="overflow: hidden;">
              <div class="event-details-section">
                <div class = "eventSectionTitle">UPCOMING</div>
                <input type="text" ng-model="search" ng-change="change()" onclick="select()" class="artist-search-field" placeholder="Search artist"/>
                
                  <div class="form-group"> 
                    <div id="datetimepicker3"></div>
                  </div>

                  <script type="text/javascript">
                      $(function () {
                          $('#datetimepicker3').datetimepicker(
                          {
                              inline: true,
                              format: "dd/M",
                              minView: 'days',
                              minViewMode: 'months',
                              minView: 2,
                              stepMonths: 0,
                          });
                      });
                  </script>
              </div>
            </div>

            <!-- CENTER -->
            <div id="shows" class="col-md-6">
              <div class="child" style="overflow-x: hidden;">
                <div id="related_results">
                  <!-- SHOW CONCERTS REMOVED FROM TEMPLATE -->
                  <g:render template="partials/shows" />

                </div>
              </div>  
            </div>

            <!-- RIGHT -->
            <div id="main-info" class = "col-md-3" >
              <g:render template = "partials/main-info" />
            </div>

            <!-- MAPS AS BACKGROUND -->
            <div id="maps">  
              <g:render template = "partials/maps" />
            </div>

          </div>
        </div>

      </div>
    

       
     
    </div>
  </div>
</div>  

<!-- CALENDAR MODAL -->
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="padding: 12px">
      <div id='calendar'></div>
    </div>
  </div>
</div>

<!-- JS FILES -->
<script src="${resource(dir:'js/plugins', file:'bootstrap-datetimepicker.js')}" type="text/javascript"></script>
<script src="${resource(dir:'js/plugins', file:'moment.min.js')}" type="text/javascript"></script>
<script src="${resource(dir:'js/plugins', file:'fullcalendar.js')}" type="text/javascript"></script>
<script src="${resource(dir:'js', file:'app.js')}" type="text/javascript"></script>
<script src="${resource(dir:'js', file:'homepage.js')}" type="text/javascript"></script>

<!-- GOOGLE MAPS API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPPFxf8JyiTirmJeZvOWSW4z6NePOuEaU"></script>
</body>
</html>