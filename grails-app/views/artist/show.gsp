
<%@ page import="fyp.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artist">
			
				<g:if test="${artistInstance?.artistName}">
				<li class="fieldcontain">
					<span id="artistName-label" class="property-label"><g:message code="artist.artistName.label" default="Artist Name" /></span>
					
						<span class="property-value" aria-labelledby="artistName-label"><g:fieldValue bean="${artistInstance}" field="artistName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.artistGenre}">
				<li class="fieldcontain">
					<span id="artistGenre-label" class="property-label"><g:message code="artist.artistGenre.label" default="Artist Genre" /></span>
					
						<span class="property-value" aria-labelledby="artistGenre-label"><g:fieldValue bean="${artistInstance}" field="artistGenre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.artistDescription}">
				<li class="fieldcontain">
					<span id="artistDescription-label" class="property-label"><g:message code="artist.artistDescription.label" default="Artist Description" /></span>
					
						<span class="property-value" aria-labelledby="artistDescription-label"><g:fieldValue bean="${artistInstance}" field="artistDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.artistNationality}">
				<li class="fieldcontain">
					<span id="artistNationality-label" class="property-label"><g:message code="artist.artistNationality.label" default="Artist Nationality" /></span>
					
						<span class="property-value" aria-labelledby="artistNationality-label"><g:fieldValue bean="${artistInstance}" field="artistNationality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="artist.events.label" default="Events" /></span>
					
						<g:each in="${artistInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:artistInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${artistInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
