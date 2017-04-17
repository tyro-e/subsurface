<%@ page import="fyp.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'bandsintown_id', 'error')} required">
	<label for="bandsintown_id">
		<g:message code="event.bandsintown_id.label" default="Bandsintownid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bandsintown_id" type="number" value="${eventInstance.bandsintown_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'livestream', 'error')} ">
	<label for="livestream">
		<g:message code="event.livestream.label" default="Livestream" />
		
	</label>
	<g:textField name="livestream" value="${eventInstance?.livestream}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'artist', 'error')} ">
	<label for="artist">
		<g:message code="event.artist.label" default="Artist" />
		
	</label>
	<g:textField name="artist" value="${eventInstance?.artist}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="event.content.label" default="Content" />
		
	</label>
	
<ul class="one-to-many">
	<g:each in="${eventInstance?.content?}" var="c">
	    <li><g:link controller="content" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
	</g:each>

	<li class="add">
		<g:link controller="content" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'content.label', default: 'Content')])}</g:link>
	</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventTime', 'error')} ">
	<label for="eventTime">
		<g:message code="event.eventTime.label" default="Event Time" />
		
	</label>
	<g:textField name="eventTime" value="${eventInstance?.eventTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'ticketStatus', 'error')} ">
	<label for="ticketStatus">
		<g:message code="event.ticketStatus.label" default="Ticket Status" />
		
	</label>
	<g:textField name="ticketStatus" value="${eventInstance?.ticketStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'ticketUrl', 'error')} ">
	<label for="ticketUrl">
		<g:message code="event.ticketUrl.label" default="Ticket Url" />
		
	</label>
	<g:textField name="ticketUrl" value="${eventInstance?.ticketUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'venue', 'error')} ">
	<label for="venue">
		<g:message code="event.venue.label" default="Venue" />
		
	</label>
	<g:textField name="venue" value="${eventInstance?.venue}"/>
</div>

