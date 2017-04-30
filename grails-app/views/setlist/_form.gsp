<%@ page import="fyp.Setlist" %>

<div class="fieldcontain ${hasErrors(bean: setlist, field: 'position', 'error')}">
	<div style="display: flex">
       
		<g:textArea type="number" placeholder="#" class="song-position" id="position" name="position" value="${setlist?.position}"  required autocomplete="off" onkeyup="checkInput(this)" />
        <g:textArea placeholder="Track name" class="song-title" id="title" name="track" value="${setlist?.track}"  required autocomplete="off" />
       	<div class="btn add-track-button">ADD</div>
       	
	</div>
</div>