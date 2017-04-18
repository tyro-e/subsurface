<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'livestream.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'event.css')}" />
		<rateable:resources/>
	</head>
	<body>
		<div class = "event-page-top col-md-12">
			<div class="event-title col-md-10">
				<!-- ARTIST -->
				<div>
					<g:if test="${event?.artist}">
						<span class="property-value artist-name" id = "artistName" aria-labelledby="artist-label">
							<g:fieldValue bean="${event}" field="artist"/>
						</span>
					</g:if>
				</div>

				<!-- VENUE -->
				<div>
					<g:if test="${event?.venue}">
						<span class="property-value venue-name" id = "venueName" aria-labelledby="venue-label">
							LIVE<div style="display:inline-block;color: red">AT</div><g:fieldValue bean="${event}" field="venue"/>
						</span>
					</g:if>
				</div>
			
				<!-- DATE TIME -->
				<div>
					<div class = "eventTime" id="eventTimeCorrect"></div>

					<g:if test="${event?.eventTime}">
						<span class="property-value" id = "eventTime" aria-labelledby="eventTime-label"  style = "opacity: 0;font-size: 0;">
							<g:fieldValue bean="${event}" field="eventTime"/>
						</span>		
					</g:if>
				</div>
			</div>

			<div class="col-md-2">
				<sec:ifLoggedIn>
		    		<sec:ifAllGranted roles="ROLE_ADMIN">
						<div class="livestream-button">
						  	<g:form name = "Start" url="[resource:event, action:'update']" method="PUT" >
				  				<div name="livestream" type="text" id="room-id" value="${event?.livestream}"></div>
								
								<div>
				    				<g:actionSubmit id="open-room" class="save" action="update" value="LIVE" />
				    			</div>
			    			</g:form>

					    	<button style = "visibility: hidden;" id="join-room">Join</button>
					    	<button style = "visibility: hidden;" id="open-or-join-room">Auto Start or Join</button>
					    </div>
					</sec:ifAllGranted>
				</sec:ifLoggedIn>

		    </div>
		</div>

		<div class="below-title">
			<div id="show-event" class="col-md-9 scaffold-show" role="main" style="padding:0;">	
				<div class="content">
					

					<!-- DISPLAY IMAGES -->
		            <g:each in="${event.contents}" var="content">
		            </g:each>


		            <!-- UPLOAD FORM -->
		                <g:hiddenField name="id"        value="${this.event?.id}" />
		                <g:hiddenField name="eventId"   value="${this.event?.id}" />
		                <g:hiddenField name="version"   value="${this.event?.version}" />
		                <fieldset class="buttons">
		                </fieldset>
		            </g:uploadForm>



					<!-- LIVESTREAM WINDOW -->
					<div class="livestream-section">

					    <!-- stream window -->
					    <div id="videos-container"></div>
					    <!-- room url -->
					    <div id="room-urls" style="display: none;"></div>
					</div>

					<!-- TICKET STATUS -->
					<div class="ticketStatusDiv">
						<g:if test="${event?.ticketStatus}">
							<span class="property-value" id = "ticketStatus" aria-labelledby="ticketStatus-label">
								TICKETS <g:fieldValue bean="${event}" field="ticketStatus"/>
							</span>
						</g:if>
					</div>
				
					<!-- TICKET URL -->
					<div class="ticketLinkDiv">
						<a class = "ticketLink btn" id="ticket_url_append" target="_blank">BUY TICKETS</a>

						<g:if test="${event?.ticketUrl}">					
							<span class="property-value ticketUrl" aria-labelledby="ticketUrl-label" style="opacity: 0;font-size: 0;">
								<g:fieldValue bean="${event}" field="ticketUrl"/>
							</span>
						</g:if>				
					</div>

					<!-- RATING -->
					<rateable:ratings bean='${event}'/>

					<!-- COMMENTING -->
					<comments:render bean="${event}" />

					<!-- LATITUDE & LONGITUDE -->
					<div class="latitudeAndLongitude">
						<div>
							<g:if test="${event?.latitude}">
								<span class="property-value latitude" id = "latitude" aria-labelledby="latitude-label">
									<g:fieldValue bean="${event}" field="latitude"/>
								</span>
							</g:if>
						</div>

						<div>
							<g:if test="${event?.longitude}">
								<span class="property-value longitude" id = "longitude" aria-labelledby="longitude-label">
									<g:fieldValue bean="${event}" field="longitude"/>
								</span>
							</g:if>
						</div>
					</div>
				</div>

				<div id="map"></div>	
				

			</div>
		


			<!-- SPOTIFY -->
			<div class="col-md-3" style="padding-right: 0;overflow: hidden;">
			    <div class="container" style="width:100%;padding-right: 0">
				    <div id="results"></div>
				</div>
				<script id="results-template" type="text/x-handlebars-template">
				    {{#each albums.items}}
				    <div style="background-image:url({{images.0.url}})" data-album-id="{{id}}" class="cover"></div>
				    {{/each}}
				</script>
			</div>
		</div>

		<!--
		<g:form url="[resource:event, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${event}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		-->
	
	<!-- JAVASCRIPTS -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0-alpha.1/handlebars.min.js"></script>
    <script src="${resource(dir:'js', file:'spotify.js')}" type="text/javascript"></script>
    <script src="${resource(dir:'js', file:'event.js')}" type="text/javascript"></script>

    <!-- GOOGLE MAPS API -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPPFxf8JyiTirmJeZvOWSW4z6NePOuEaU"></script>
  </body>
</html>
