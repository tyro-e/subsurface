<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div id="list-event" class="content scaffold-list" role="main">
			<table>
				<thead>
					<tr>						
						<g:sortableColumn property="artist" title="WHO" />
						<g:sortableColumn property="eventTime" title="WHEN" />
						
						<g:sortableColumn property="venue" title="WHERE" />
					</tr>
				</thead>

				<tbody>
					<g:each in="${eventList}" status="i" var="event">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link action="show" id="${event.id}">${fieldValue(bean: event, field: "artist")}</g:link></td>
							<td>${event.eventTime?.substring(5, 10)}</td>
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
