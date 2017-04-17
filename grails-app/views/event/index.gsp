<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	</head>
	<body>
		<div id="list-event" class="content scaffold-list" role="main">

			<table>
				<thead>
					<tr>
						<g:sortableColumn property="bandsintown_id" title="${message(code: 'event.bandsintown_id.label', default: 'Bandsintownid')}" />
						<g:sortableColumn property="artist" title="${message(code: 'event.artist.label', default: 'Artist')}" />
						<g:sortableColumn property="ticketStatus" title="${message(code: 'event.ticketStatus.label', default: 'Ticket Status')}" />
						<g:sortableColumn property="ticketUrl" title="${message(code: 'event.ticketUrl.label', default: 'Ticketurl')}" />
						<g:sortableColumn property="venue" title="${message(code: 'event.venue.label', default: 'Venue')}" />
					</tr>
				</thead>

				<tbody>
					<g:each in="${eventList}" status="i" var="event">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link action="show" id="${event.id}">${fieldValue(bean: event, field: "bandsintown_id")}</g:link></td>
							<td>${fieldValue(bean: event, field: "artist")}</td>
							<td>${fieldValue(bean: event, field: "ticketStatus")}</td>
							<td>${fieldValue(bean: event, field: "ticketUrl")}</td>
							<td>${fieldValue(bean: event, field: "venue")}</td>
						</tr>
					</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
	
</html>
