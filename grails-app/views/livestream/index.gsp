<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <link rel="stylesheet" href="${resource(dir:'css',file:'livestream.css')}" />
</head>

<body>
  <div class="content">
    <div class="event-title">
      <div class="event-artist">EXAMPLE ARTIST</div>
      <div class="event-venue">LIVE<div style="color: red;display: inline-block;">AT</div>EXAMPLE VENUE</div>
    </div>


    <input type="text" id="room-id" value="abcdef">
    <button id="open-room">Start</button>
    <button id="join-room">Join</button>
    <button id="open-or-join-room">Auto Start or Join</button>

    
    <!-- LIVESTREAM WINDOW -->
    <div id="videos-container"></div>

    <!-- ROOM URL -->
    <div id="room-urls" style="display: none;"></div>
  </div>

    
    <script src="${resource(dir:'js/livestream', file:'RTCMultiConnection.js')}" type="text/javascript"></script>
    <script src="${resource(dir:'js/livestream', file:'socket.io.js')}" type="text/javascript"></script>

    <script>
      // UI Code
      document.getElementById('open-room').onclick = function()
      {
        disableInputButtons();
        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: false, OfferToReceiveVideo: false
        };
        connection.open(document.getElementById('room-id').value, function() {
            showRoomURL(connection.sessionid);
        });
      };

      document.getElementById('join-room').onclick = function() 
      {
        disableInputButtons();
        connection.sdpConstraints.mandatory = {
            OfferToReceiveAudio: true, OfferToReceiveVideo: true
        };
        connection.join(document.getElementById('room-id').value);
      };

      document.getElementById('open-or-join-room').onclick = function() 
      {
        disableInputButtons();
        connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExists, roomid) {
          if(!isRoomExists) 
          {
              showRoomURL(roomid);
          }
        });
      };

      // RTCMultiConnection Code
      var connection = new RTCMultiConnection();

      // socket.io server is assumed to be deployed on own URL
      connection.socketURL = '/';
      // comment-out below line if no socket.io server
      connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
      connection.socketMessageEvent = 'video-broadcast-demo';
      connection.session = 
      {
        audio: true,
        video: true,
        oneway: true
      };

      connection.videosContainer = document.getElementById('videos-container');

      connection.onstream = function(event) 
      {
        connection.videosContainer.appendChild(event.mediaElement);
        event.mediaElement.play();
        setTimeout(function() 
        {
          event.mediaElement.play();
        }, 5000);
      };

      function disableInputButtons()
      {
        document.getElementById('open-or-join-room').disabled = true;
        document.getElementById('open-room').disabled = true;
        document.getElementById('join-room').disabled = true;
        document.getElementById('room-id').disabled = true;
      }

      // Handling Room-ID
      function showRoomURL(roomid) {
        var roomHashURL = '#' + roomid;
        var roomQueryStringURL = '?roomid=' + roomid;
        var html = ' ';
        html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
        html += '<br>';
        html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';
        var roomURLsDiv = document.getElementById('room-urls');
        roomURLsDiv.innerHTML = html;
        roomURLsDiv.style.display = 'block';
      }

      (function() 
      {
        var params = {}, r = /([^&=]+)=?([^&]*)/g;

        function d(s) {
          return decodeURIComponent(s.replace(/\+/g, ' '));
        }

        var match, search = window.location.search;

        while (match = r.exec(search.substring(1)))
            params[d(match[1])] = d(match[2]);

        window.params = params;
      })();

      var roomid = '';

      if (localStorage.getItem(connection.socketMessageEvent)) {
        roomid = localStorage.getItem(connection.socketMessageEvent);
      } 

      else {
        roomid = connection.token();
      }

      document.getElementById('room-id').value = roomid;
      document.getElementById('room-id').onkeyup = function() {
        localStorage.setItem(connection.socketMessageEvent, this.value);
      };

      var hashString = location.hash.replace('#', '');

      if(hashString.length && hashString.indexOf('comment-') == 0) {
        hashString = '';
      }

      var roomid = params.roomid;

      if(!roomid && hashString.length) {
        roomid = hashString;
      }

      if(roomid && roomid.length) 
      {
        document.getElementById('room-id').value = roomid;
        localStorage.setItem(connection.socketMessageEvent, roomid);
        // auto-join-room
        (function reCheckRoomPresence() {
          connection.checkPresence(roomid, function(isRoomExists) {
            if(isRoomExists) {
              connection.join(roomid);
              return;
            }
            setTimeout(reCheckRoomPresence, 5000);
          });
        })();

        disableInputButtons();
      }
    </script>
</body>
</html>