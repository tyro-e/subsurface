
<%@ page import="fyp.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list content">
			
				<g:if test="${contentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="content.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="content.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${contentInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.absoluteUrl}">
				<li class="fieldcontain">
					<span id="absoluteUrl-label" class="property-label"><g:message code="content.absoluteUrl.label" default="Absolute Url" /></span>
					
						<span class="property-value" aria-labelledby="absoluteUrl-label"><g:fieldValue bean="${contentInstance}" field="absoluteUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="content.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${contentInstance?.event?.id}">${contentInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
