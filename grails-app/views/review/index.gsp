<%@ page import="fyp.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-review" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>					
						<g:sortableColumn property="rating" title="${message(code: 'review.rating.label', default: 'Rating')}" />
						<th><g:message code="review.author.label" default="Author" /></th>					
						<g:sortableColumn property="review" title="${message(code: 'review.review.label', default: 'Review')}" />					
						<th><g:message code="review.event.label" default="Event" /></th>					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
						<td><g:link action="show" id="${reviewInstance.id}">${fieldValue(bean: reviewInstance, field: "rating")}</g:link></td>					
						<td>${fieldValue(bean: reviewInstance, field: "author")}</td>					
						<td>${fieldValue(bean: reviewInstance, field: "review")}</td>					
						<td>${fieldValue(bean: reviewInstance, field: "event")}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reviewInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
