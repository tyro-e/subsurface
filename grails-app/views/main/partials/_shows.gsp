<%@ page import="fyp.Event" %>
<div ng-if="details.Response!=='False' && details != 'empty'">
  <div ng-if="details.length == 0">No shows for {{ search }}</div>

  <ul class="rel-results">
    <li ng-repeat="show in details">
      <div class = "eventTimeConv"></div>
      <div id = "event-time" class = "event-date-time">{{ moment(show.datetime).format('YYYY-MM-DD h:m') }}</div>
      

      <div class = "event-item">  
        <div class = "artistAndVenue col-md-9" style="margin-left: 0;margin-right: 0">
          <span class="artist-name row">
            <a href="#/" id="{{ $index + 1 }}" ng-click="update(show)" class = "artist-item">
                {{ show.artists[0].name }}
            </a>
          </span>

          <span class="venue-name row">
            <a href="#/" id="{{ $index + 1 }}" ng-click="update(show)" class = "venue-item">           
              <div style = "text-transform: lowercase;display: inline-block;color: red;font-size: 80%;">at</div> {{ show.venue.name }}  {{ show.formatted_location }}
            </a>
          </span>
        </div>
               
        <div class="ticketsAndInfo col-md-3" style="margin-left: 0;margin-right: 0">
          <span class = "tickets row">
            <a href="{{ show.ticket_url }}" title="Tickets for {{ show.title }}" target="_blank" >
              <button class = "button-main ticket-background"> 
                TICKETS <i class="fa fa-ticket"></i>
              </button> 
            </a>
          </span>

          <span class = "rsvp row">
            <a ng-href="${createLink( controller: 'event', action: 'showByBandId' )}/{{show.id}}" target="_blank">
              <button class="button-main calendar-background">
                INFO <i class="fa fa-info"></i>
              </button>
            </a>
          </span>
        </div>
      </div>
    </li>
  </ul>
</div>
