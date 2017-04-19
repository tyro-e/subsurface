<div id="create-review" class="row well bs-component col-md-6 col-md-offset-3" role="main">
	<h1>Discussion</h1>
	<g:hasErrors bean="${review}">
		<ul class="errors" role="alert">
			<g:eachError bean="${review}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
					<g:message error="${error}"/>
				</li>
			</g:eachError>
		</ul>
	</g:hasErrors>

	<g:form url="[resource:review, action:'save',controller:'review',params:[event:event?.id,author:session.user?.id]]" >
		
		<fieldset class="form">
			<g:render template="/review/form"/>
		</fieldset>

		<g:submitButton name="create" class="btn btn-warning" value="Submit" />
	</g:form>

</div>
