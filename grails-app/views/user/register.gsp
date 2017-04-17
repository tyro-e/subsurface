<html>
<head>
  <title>User Registration</title>
  <meta name="layout" content="main" />
</head>
  <body>
    <g:form controller="user" action="register">
        <fieldset class="form">
            <div class="fieldcontation ${hasErrors(bean: userInstance, field: 'fullName', 'error')}">
                <label for="fullName">
                    <g:message code="endUser.fullName.label" default="Full Name" />
                </label>
                    <g:textField name="fullName" value="${userInstance?.fullName}"/>
            </div>
            <div class="fieldcontation ${hasErrors(bean: userInstance, field: 'username', 'error')}">
                <label for="username">
                    <g:message code="endUser.username.label" default="User Name" />
                </label>
                    <g:textField name="username" value="${userInstance?.username}"/>
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
  </body>
</html>