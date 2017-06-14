(function() {
        var stateKey = 'spotify_auth_state';
        /**
         * Obtains parameters from the hash of the URL
         * @return Object
         */
        function getHashParams() {
          var hashParams = {};
          var e, r = /([^&;=]+)=?([^&;]*)/g,
              q = window.location.hash.substring(1);
          while ( e = r.exec(q)) {
             hashParams[e[1]] = decodeURIComponent(e[2]);
          }
          return hashParams;
        }
        /**
         * Generates a random string containing numbers and letters
         * @param  {number} length The length of the string
         * @return {string} The generated string
         */
        function generateRandomString(length) {
          var text = '';
          var possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
          for (var i = 0; i < length; i++) {
            text += possible.charAt(Math.floor(Math.random() * possible.length));
          }
          return text;
        };
        var userProfileSource = document.getElementById('user-profile-template').innerHTML,
            userProfileTemplate = Handlebars.compile(userProfileSource),
            userProfilePlaceholder = document.getElementById('user-profile');
            oauthSource = document.getElementById('oauth-template').innerHTML,
            oauthTemplate = Handlebars.compile(oauthSource),
            oauthPlaceholder = document.getElementById('oauth');
        var params = getHashParams();
        var access_token = params.access_token,
            state = params.state,
            storedState = localStorage.getItem(stateKey);
        if (access_token && (state == null || state !== storedState)) {
          alert('There was an error during the authentication');
        } else {
          localStorage.removeItem(stateKey);
          if (access_token) {
            $.ajax({
                url: 'https://api.spotify.com/v1/me',
                headers: {
                  'Authorization': 'Bearer ' + access_token
                },
                success: function(response) {
                  userProfilePlaceholder.innerHTML = userProfileTemplate(response);
                  $('#login').hide();
                  $('#loggedin').show();
                }
            });
          } else {
              $('#login').show();
              $('#loggedin').hide();
          }
          document.getElementById('login-button').addEventListener('click', function() {
            var client_id = '333027f450f149f8bc9e812d06976db3'; // Your client id
            var redirect_uri = 'http://localhost:8080/event/show/431'; // Your redirect uri
            var state = generateRandomString(16);
            localStorage.setItem(stateKey, state);
            var scope = 'user-read-private user-read-email';
            var url = 'https://accounts.spotify.com/authorize';
            url += '?response_type=token';
            url += '&client_id=' + encodeURIComponent(client_id);
            url += '&scope=' + encodeURIComponent(scope);
            url += '&redirect_uri=' + encodeURIComponent(redirect_uri);
            url += '&state=' + encodeURIComponent(state);
            window.location = url;
          }, false);
        }

        // ***** ORIGINAL FYP CODE ******
        var templateSource = document.getElementById('results-template').innerHTML,
            template = Handlebars.compile(templateSource),
            resultsPlaceholder = document.getElementById('results'),
            playingCssClass = 'playing',
            audioObject = null;

        var fetchTracks = function (albumId, callback) {
            var params = getHashParams();
            var accessToken = params.access_token
            $.ajax({
                url: 'https://api.spotify.com/v1/albums/' + albumId,
                headers: {
                    'Authorization': 'Bearer ' + accessToken
                },
                success: function (response) {
                    callback(response);
                }
            });
        };

        var searchAlbums = function (query) {
            var params = getHashParams();
            var accessToken = params.access_token
            $.ajax({
                url: 'https://api.spotify.com/v1/search',
                data: {
                    q: query,
                    type: 'album',
                    limit: '6'
                },
                headers: {
                    'Authorization': 'Bearer ' + accessToken
                 },
                success: function (response) {
                    resultsPlaceholder.innerHTML = template(response);
                    var numItems = $('.cover').length;

                    if (numItems == 1){
                        $("#results").css('column-count','1');
                        $('.cover').css('float','right');
                    }

                    if (numItems == 3){
                        $("#results").css('column-count','1');
                        $('.cover').css('float','right');
                    }
                }
            });
        };

        results.addEventListener('click', function (e) {
            var target = e.target;
            if (target !== null && target.classList.contains('cover')) {
                if (target.classList.contains(playingCssClass)) {
                    audioObject.pause();
                } else {
                    if (audioObject) {
                        audioObject.pause();
                    }
                    fetchTracks(target.getAttribute('data-album-id'), function (data) {
                        audioObject = new Audio(data.tracks.items[0].preview_url);
                        audioObject.play();
                        target.classList.add(playingCssClass);
                        audioObject.addEventListener('ended', function () {
                            target.classList.remove(playingCssClass);
                        });
                        audioObject.addEventListener('pause', function () {
                            target.classList.remove(playingCssClass);
                        });
                    });
                }
            }
        });

        window.onload = function(){
            searchAlbums(document.getElementById('artistName').innerHTML);

            var artistLoad = document.getElementById('artistName').innerHTML;
            console.log(artistLoad);
            
        };

})();

