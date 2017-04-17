<html>
<head>
	<meta name='layout' content='main'/>
	<title>Login</title>
</head>

<body>
	<div class="body">
		<div class="well bs-component col-md-6 col-md-offset-3 ">
			<g:if test="${flash.message }">
				<div class="message">${flash.message }</div>
			</g:if>

			<g:form action="authenticate" method="post" class="form-horizontal">
				<fieldset>
				<legend>Login</legend>

				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">Email</label>
					 <div class="col-lg-10">
					 	<input type="text" id="email" name="email" class="form-control" placeholder="Email"/>
					 </div>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="col-lg-2 control-label">Password</label>
					 <div class="col-lg-10">
					 	<input type="password" id="password" name="password" class="form-control" placeholder="Password"/>
					 </div>
				</div>

				<div class="form-group">
					 <div class="col-lg-10 col-lg-offset-2">
						<input type="submit" value="login" class="btn btn-primary"/>
					</div>
				</div>

				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>