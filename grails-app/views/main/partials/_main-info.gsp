<div ng-if="!details || details == null">
  Loading results...
</div>

<div ng-if="details != 'empty' && details[0] != undefined" class="event-main-info">

  <!-- IMAGE -->
  <img ng-src="{{ details[0].artists[0].thumb_url }}" class="artist-poster">
  <!-- VENUE -->
  <span ng-if="details[0].title">
    <span class="venue_name">{{ details[0].venue.name }}</span><br>
  </span>
  <!-- DATE TIME -->
  <span ng-if="details[0].formatted_datetime">
    <span class="date_time">{{ details[0].formatted_datetime }}</span><br>
  </span>
  <!-- LOCATION -->
  <span ng-if="details[0].formatted_location">
   <span class="_location">{{ details[0].formatted_location }}</span> 
  </span>
  <!-- SOCIAL MEDIA -->
  <div class="button-row-1">
    <span ng-if="details[0].artists[0].facebook_page_url">
      <a href="{{ details[0].artists[0].facebook_page_url }}" target="_blank" class="facebook-background">
        <i class="fa fa-facebook"></i>
      </a>
    </span>
    <span ng-if="details[0].artists[0].url">
      <a href="https://www.twitter.com/{{ details[0].artists[0].url }}" target="_blank" class="twitter-background">
        <i class="fa fa-twitter"></i>
      </a>
    </span>
    <span ng-if="details[0].artists[0].website">  
      <a href="{{ details[0].artists[0].website }}" title="Website for {{ details[0].artists[0].name }}" target="_blank" class="website-background">
        <i class="fa fa-external-link"></i>
      </a>
    </span>
  </div>
  <!-- BUTTONS -->
  <div>
    <button class = "button-main more-info-button">MORE INFO</button>
  </div>   

</div>



<div ng-if="details">
  <div ng-if="(details.errors.length > 0 || details[0] == undefined) && search.length > 0">
    No results found for {{ search }}
  </div>
</div>
