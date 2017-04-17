<%@ page import="fyp.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="content.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${contentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="content.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${contentInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'absoluteUrl', 'error')} ">
	<label for="absoluteUrl">
		<g:message code="content.absoluteUrl.label" default="Absolute Url" />
		
	</label>
	<g:textField name="absoluteUrl" value="${contentInstance?.absoluteUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="content.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${fyp.Event.list()}" optionKey="id" required="" value="${contentInstance?.event?.id}" class="many-to-one"/>
</div>

