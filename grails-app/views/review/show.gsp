<%@ page import="fyp.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-review" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list review">
			
				<g:if test="${reviewInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="review.rating.label" default="Rating" /></span>					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${reviewInstance}" field="rating"/></span>					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="review.author.label" default="Author" /></span>					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="appUser" action="show" id="${reviewInstance?.author?.id}">${reviewInstance?.author?.encodeAsHTML()}</g:link></span>			
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.review}">
				<li class="fieldcontain">
					<span id="review-label" class="property-label"><g:message code="review.review.label" default="Review" /></span>					
						<span class="property-value" aria-labelledby="review-label"><g:fieldValue bean="${reviewInstance}" field="review"/></span>					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="review.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${reviewInstance?.event?.id}">${reviewInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reviewInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reviewInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
