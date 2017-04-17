<%@ page import="fyp.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'artistName', 'error')} required">
	<label for="artistName">
		<g:message code="artist.artistName.label" default="Artist Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="artistName" required="" value="${artistInstance?.artistName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'artistGenre', 'error')} required">
	<label for="artistGenre">
		<g:message code="artist.artistGenre.label" default="Artist Genre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="artistGenre" required="" value="${artistInstance?.artistGenre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'artistDescription', 'error')} ">
	<label for="artistDescription">
		<g:message code="artist.artistDescription.label" default="Artist Description" />
		
	</label>
	<g:textField name="artistDescription" value="${artistInstance?.artistDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'artistNationality', 'error')} ">
	<label for="artistNationality">
		<g:message code="artist.artistNationality.label" default="Artist Nationality" />
		
	</label>
	<g:textField name="artistNationality" value="${artistInstance?.artistNationality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="artist.events.label" default="Events" />
		
	</label>
	
</div>

