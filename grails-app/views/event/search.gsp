<%@ page import="fyp.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir:'css',file:'event.css')}" />
	</head>
	<body style="background-color: white !important">

		<g:form name="form" controller="event" action="search">
			<div class="sticky">
				<input placeholder = "SEARCH ARTIST..	" class = "archive-search" name="query" value="${query}"/>
				<g:actionSubmit value="SUBMIT"  action="search" class= "archive-button" />
			</div>
		</g:form>

		<div style="padding:15px">
			<table style="width: 100%;">
				<thead>
					<tr>			
						<div class="col-md-1">			
							<g:sortableColumn property="eventTime" title="DATE" />
						</div>

						<div class="col-md-6">
							<g:sortableColumn property="artist" title="WHO" />
						</div>

						<div class="col-md-2">
							<g:sortableColumn property="venue" title="WHERE" />
						</div>
					</tr>
				</thead>

				<tbody>
					<g:each in="${eventList}" status="i" var="event">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">							
							
							<td class="col-md-1">
								<g:link action="show" id="${event.id}">
									${event.eventTime?.substring(5, 10)}
								</g:link>
							</td>

							<td class="col-md-6">
								<g:link action="show" id="${event.id}">
									${fieldValue(bean: event, field: "artist")}
								</g:link>
							</td>

							<td class="col-md-2">
								<g:link action="show" id="${event.id}">
									${fieldValue(bean: event, field: "venue")}
								</g:link>
							</td>						
						</tr>
					</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</div>
		</div>



<style type="text/css">

table td[class*=col-], table th[class*=col-]
{
	padding: 6px 0 !important;
}

</style>

<script type="text/javascript">
	$(document).scroll(function () {
    //detect when user scroll to top and set position top to 140px else sets position top to 0
        $(".sticky").css({
            "top": "0",
            "position": $(this).scrollTop() > 27 ? "fixed" : "relative"
        });
});
</script>

</body>
</html>


