<%@ page import="fyp.Setlist" %>

<div class="fieldcontain ${hasErrors(bean: setlist, field: 'setlist', 'error')}">
	<div style="display: flex">
       

        <g:textArea placeholder="Track name" class="song-title" id="title" name="setlist" value="${setlist?.track}"  required autocomplete="off" />
       	<g:submitButton name="create" class="btn add-track-button" value="ADD" />	

    	
	</div>
</div>