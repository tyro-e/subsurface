<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'livestream.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'event.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'rating.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'setlist.css')}" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.0/slick-theme.css" rel="stylesheet"/>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.0/slick.css" rel="stylesheet"/>
		<script type="text/javascript" src="http://l2.io/ip.js?var=myip"></script>
		<script type="text/javascript" src="https://cdn.emailjs.com/dist/email.min.js"></script>
		<script type="text/javascript">
		   (function(){
		      emailjs.init("user_APMufY2ao4hLbOYmzZoeL");
		   })();
		</script>
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
				<div class="venue-sect">
					<g:if test="${event?.venue}">
						LIVE<div style="display:inline-block;color: red">AT</div>
						<span class="property-value venue-name" id = "venueName" aria-labelledby="venue-label">
							<g:fieldValue bean="${event}" field="venue"/>
						</span>
					</g:if>

					<g:if test="${event?.id}">
						<span class="property-value event-id" id = "eventId" aria-labelledby="id-label">
							<g:fieldValue bean="${event}" field="id"/>
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

			<div class="col-md-2" style="padding: 0;">
				<div class="livestream-button">
				  	<g:form name = "Start" url="[resource:event, action:'update']" method="PUT" >
		  				<div name="livestream" type="text" id="room-id" value="${event?.livestream}"></div>
						
						<div>
		    				<input id="open-room" class="save" action="update" value="LIVE" />
		    			</div>
	    			</g:form>

			    	<button style = "visibility: hidden;" id="join-room">Join</button>
			    	<button style = "visibility: hidden;" id="open-or-join-room">Auto Start or Join</button>
			    </div>

			    <div>
					<div id = "upload-button">UPLOAD</div>
					<div id = "upload-chooser">
						<!-- UPLOAD FORM -->
			            <g:uploadForm name="upload" action="upload">
			                <g:hiddenField name="id"        value="${this.event?.id}" />
			                <g:hiddenField name="eventId"   value="${this.event?.id}" />
			                <g:hiddenField name="version"   value="${this.event?.version}" />
			                
			                <input type="file" name="file" />
			                <input class="save" type="submit" value="Confirm" />  
			            </g:uploadForm>
					</div>
				</div>


		    </div>
		</div>

		<div class="below-title">
			<div id="show-event" class="col-md-9 scaffold-show" role="main">	
				<div class="content" style="padding-left: 0">
					
					<!-- DISPLAY IMAGES -->
		    		<div class="content" style="padding-left: 0px;padding-right: 60px;max-height: 500px;">

			    		<div class="slider-nav">
						  	<g:each in="${event.contents}" var="content">
			                	<img height = "50px" class = "event-content" src = "${content.url}" />
			            	</g:each>
						</div>

						<div class="content-holder">
							<div class="slider-for">

								<g:each in="${event.contents}" var="content">
				                	<img class = "event-content" src = "${content.url}" />
				            	</g:each>

				            	<!--
								<g:each in="${event.contents}" var="content">
				                	<video class = "event-content" controls>
				                		<source src = "${content.url}" >
				                	</video>
				            	</g:each>			
								-->
							</div>
						</div>
					</div>

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

					<!-- COMMENTS -->
					<g:render template="createReview"></g:render>

					<g:if test="${event?.reviews}">
								
						<g:each in="${reviewList}" var="r">
							<div class="col-md-12" style="margin-top: 15px;">
								<blockquote class="pull-left">
									<div class="review-text">${r.review }</div>
									<small>by<cite title="Source Title">${r.author }</cite></small> 
									<div class = "rating-text">Rating <cite title="Source Title">${r.rating }/5</cite></div>
									<!--<div class="ratingz">${r.rating}</div>-->
								</blockquote>

								<div class="btn-group-vertical pull-right">
									<g:if test='${session.user?.role.equals("ROLE_USER") || session.user?.role.equals("ROLE_ADMIN")}'>

										<g:form  id="${r.id }" controller="review" action="delete" method="DELETE" style = "margin-top: 0">
											<g:hiddenField name="eventId" value="${ event.id}"/>
											
											<g:actionSubmit class="btn delete-comment-btn" action="delete" value="X" onclick="return confirm('Are you sure?');" />
											<!--
											<input type="submit" id="deleteComment" value="AJAX DELETE" />-->
										</g:form>
									</g:if>
								</div>

							</div>
						</g:each>
					</g:if>
					
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
			</div>
					
			<div class="col-md-3" style="padding-right: 0;">

				<!-- SPOTIFY -->
				<div class="spotify-section">
				    <div class="container" style="width:100%;padding-right: 0">
					    <div id="results"></div>
					</div>
					<script id="results-template" type="text/x-handlebars-template">
					    {{#each albums.items}}
					    <div style="background-image:url({{images.0.url}})" data-album-id="{{id}}" class="cover"></div>
					    {{/each}}
					</script>
				</div>

				<!-- SETLIST -->
				<div class="setlist-section">
					<g:render template="setlist"></g:render>
				    <div class="setlist" id="sortable-setlist"></div>
		    	</div>

			</div>

			<div class="col-md-12" style="padding:0;">
				<div id="map"></div>
			</div>
		</div>

	
	<!-- SLICK CAROUSEL -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
    <!-- MAIN -->
	<script src="${resource(dir:'js', file:'event.js')}" type="text/javascript"></script>
    <!-- SPOTIFY -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0-alpha.1/handlebars.min.js"></script>
    <script src="${resource(dir:'js', file:'spotify.js')}" type="text/javascript"></script>
    <!-- DROPZONE -->
    <script src="${resource(dir:'js/plugins', file:'dropzone.js')}" type="text/javascript"></script>
    
    <!-- SETLIST 
    <script src="https://rubaxa.github.io/Sortable/Sortable.js"></script>
	<script src="${resource(dir:'js', file:'setlist.js')}" type="text/javascript"></script>-->
    <!-- GOOGLE MAPS API -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPPFxf8JyiTirmJeZvOWSW4z6NePOuEaU"></script>
	<!-- LIVESTREAMING -->
	<script src="${resource(dir:'js/livestream', file:'RTCMultiConnection.js')}" type="text/javascript"></script>
	<script src="${resource(dir:'js/livestream', file:'socket.io.js')}" type="text/javascript"></script>
	<script src="${resource(dir:'js/livestream', file:'livestream.js')}" type="text/javascript"></script>
	<g:javascript>var emailAction = "${createLink(controller:'user',action:'getEmails')}"</g:javascript>
	<g:javascript>var reviewCommentAction = "${createLink(controller:'review',action:'save')}"</g:javascript>
	<g:javascript>var reviewDeleteAction = "${createLink(controller:'review',action:'delete')}"</g:javascript>
	<script type="text/javascript">
	$(document).ready(function() {
    
    	$('.slick-track').css('transform','translate3d(0, 0, 0)');
    	$('.slick-slider').css('transform','translate3d(0, 0, 0)');

    	$('.slick-list').css('padding','0');
	});
	</script>
	</body>

</html>
