<!DOCTYPE html>
<html ng-app="myApp" ng-controller="BandsInTownController">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> 
  <title><g:layoutTitle default="SUBSURFACE" /></title>

  <!-- STYLESHEETS -->
  <link rel="stylesheet" href="${resource(dir:'css',file:'master.css')}" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="${resource(dir:'css/plugins',file:'pure.min.css')}" />

  <!-- JAVASCRIPTS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="${resource(dir:'js/plugins/bootstrap', file:'bootstrap.js')}" type="text/javascript"></script>
  <script src="${resource(dir:'js/plugins', file:'moment.js')}" type="text/javascript"></script>
  <script src="${resource(dir:'js/plugins', file:'moment.min.js')}" type="text/javascript"></script>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Bungee|Montserrat+Subrayada|Nunito|Poppins|Work+Sans" rel="stylesheet">
  <g:layoutHead />  
</head>

<body>
  <div id="wrapper">

    <!-- NAVBAR -->
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <ul class="nav navbar-nav">
          <li><g:link controller = "main" style="font-size: 18px;font-weight: 600;">SUBSURFACE</g:link></li>
          <li><a href="/main/homepage#scrollTo">UPCOMING</a> 
          <li><g:link controller = "event">ARCHIVE</g:link></li>

          <li style="float: right;">
            <div class="login-control">
              <g:loginControl/>
            </div>
          </li>
        </ul>
      </div>
    </nav>

    <!-- CONTENT -->
    <div id="content">
      <g:layoutBody />
    </div>
  </div>
</body>
</html>