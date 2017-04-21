<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir:'css',file:'event.css')}" />
	</head>
	<body style="background-color: white !important">
		<div class="col-md-12 listings-top">
			LISTINGS
		</div>

		<g:form name="form" controller="event" action="search">
			<g:textField name="query" value="${query}">  </g:textField>
			<g:actionSubmit value="SEARCH"  action="search"/>
		</g:form>

		<div style="padding:15px">
			<table style="width: 100%;">
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
