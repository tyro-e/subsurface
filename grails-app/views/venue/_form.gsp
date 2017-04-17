<%@ page import="fyp.Venue" %>



<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'uploadFeaturedImage', 'error')} ">
	<label for="uploadFeaturedImage">
		<g:message code="venue.uploadFeaturedImage.label" default="Upload Featured Image" />
		
	</label>
	<g:textField name="uploadFeaturedImage" value="${venueInstance?.uploadFeaturedImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="venue.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${venueInstance?.name}"/>
</div>

