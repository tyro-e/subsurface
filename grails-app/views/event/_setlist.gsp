<div id="create-setlist" role="main">
	<div class = "comments-title">SETLIST</div>

	<g:form id="add-track-form" url="[resource:setlist, action:'save',controller:'setlist',params:[event:event?.id]]" style= "margin-top: 0;" >
		
		<fieldset class="form">
			<g:render template="/setlist/form"/>
		</fieldset>

	</g:form>
</div>