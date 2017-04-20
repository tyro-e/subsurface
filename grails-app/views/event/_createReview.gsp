<div id="create-review" role="main">
	<div class = "comments-title">DISCUSSION</div>
	<g:hasErrors bean="${review}">
		<ul class="errors" role="alert">
			<g:eachError bean="${review}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
					<g:message error="${error}"/>
				</li>
			</g:eachError>
		</ul>
	</g:hasErrors>

	<g:form url="[resource:review, action:'save',controller:'review',params:[event:event?.id,author:session.user?.id]]" style= "margin-top: 0;" >
		
		<fieldset class="form">
			<g:render template="/review/form"/>
		</fieldset>

		
	</g:form>

</div>