<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
</head>

<body>
    <div id="create-user" class="content scaffold-create" role="main">
        <g:if test="${flash.message}">
            <div class="notif" role="status">${flash.message}</div>
        </g:if>
        
        <div class="login-form col-md-4 col-md-offset-4 " style="padding-left: 0;padding-right: 0;">
            <g:form action="save" >
                <input type="text" name="fullName" class=" login-field" autocomplete="off" placeholder="Name"/>
                <input type="text" name="email" class=" login-field" autocomplete="off" placeholder="Email"/>
                <input type="password" id="password" name="password" class=" login-field" autocomplete="new-password" placeholder="Password"/>

                <input type = "submit" name="register" value="REGISTER" class="btn login-btn"/>          
            </g:form>
        </div>
    </div>
</body>
</html>
