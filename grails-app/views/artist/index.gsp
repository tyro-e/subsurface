
<%@ page import="fyp.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

	    
	    <link rel="stylesheet" href="${resource(dir:'css',file:'post-page.css')}" />

	</head>

	<body>

	<div class="content">

		<!-- UPLOADED CONTENT -->
		<div class="col-md-12">
			<div class="content-banner">

			</div>
		</div>

		<div class="col-md-9">
			<div class="livestream-title">
		      <div class="livestream-artist">EXAMPLE ARTIST</div>
		      <div class="livestream-venue">LIVE<div style="color: red;display: inline-block;">AT</div>EXAMPLE VENUE</div>
		    </div>

	



		</div>



		<!-- SETLIST -->
		<div class="col-md-3">
			<div class="setlist-section">
				<form action="" id="add-track-form">
			      <fieldset>
			        <input type="text" class="song-title form-inputs" id="title" name="song-title" placeholder="Song Title" required>
			        <input type="text" class="song-key form-inputs" id="key" name="song-key" placeholder="Key" pattern="[A-Ga-g#♮]+">
			        <input type="number" min="1" max="350" class="song-tempo form-inputs" id="tempo" name="song-tempo" placeholder="BPM" >
			      </fieldset>
			      <button class="add-track-button" type="submit" form="add-track-form">Add</button>
			    </form>

			    <div class="setlist" id="sortable-setlist">
			    </div>
		    </div>
		</div>

	</div>


	

	</body>

</html>
