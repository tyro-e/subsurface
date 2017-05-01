<html>
<head>
	<meta name='layout' content='main'/>
</head>

<body>
	<div class="body">
	    <g:if test="${flash.message}">
            <div class="notif" role="status">${flash.message}</div>
        </g:if>
		<div class="login-form col-md-4 col-md-offset-4 " style="padding-left: 0;padding-right: 0;">
			<g:form action="authenticate" method="post" class="form-horizontal">
			 	<input type="text" id="email" name="email" class=" login-field" autocomplete="off" placeholder="Email"/>
				<input type="password" id="password" name="password" class=" login-field" autocomplete="new-password" placeholder="Password"/>
				<input type="submit" value="LOGIN" class="btn login-btn"/>			
			</g:form>
		</div>
	</div>
</body>
</html>