<div id="create-review" role="main">
	<div class = "comments-title">DISCUSSION</div>

	<g:form url="[resource:review, action:'save',controller:'review',params:[event:event?.id,author:session.user?.id]]" style= "margin-top: 0;" >
		
		<g:render template="/review/form"/>

	</g:form>
</div>