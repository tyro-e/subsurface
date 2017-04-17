<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="create-user" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
                <g:form action="save">
                    <fieldset class="form">
                        <div class="fieldcontation ${hasErrors(bean: userInstance, field: 'fullName', 'error')}">
                            <label for="fullName">
                                <g:message code="endUser.fullName.label" default="Full Name" />
                            </label>
                                <g:textField name="fullName" value="${userInstance?.fullName}"/>
                        </div>
                        <div class="fieldcontation ${hasErrors(bean: userInstance, field: 'email', 'error')}">
                            <label for="email">
                                <g:message code="endUser.email.label" default="Email" />
                            </label>
                                <g:textField name="email" value="${userInstance?.email}"/>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
                            <label for="password">
                                <g:message code="endUser.password.label" default="Password"/>
                            </label>
                            <g:field type="password" name="password" value="${userInstance?.password}"/>
                        </div>

                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="register" class="save" value="Register" />
                    </fieldset>
                </g:form>
        </div>
    </body>
</html>
