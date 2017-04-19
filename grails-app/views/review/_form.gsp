<%@ page import="fyp.Review" %>

<div class="fieldcontain ${hasErrors(bean: review, field: 'rating', 'error')} required">
	<div class="form-group">
	    <label for="rating" class="col-lg-2 control-label">Rating</label>
	    <div class="col-lg-10">
	    	<g:select name="rating" from="${1..5}" class="form-control" required="" value="${fieldValue(bean: review, field: 'rating')}"/>
	    </div>
    </div>
</div><%--

<div class="fieldcontain ${hasErrors(bean: review, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="review.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${fyp.User.list()}" optionKey="id" required="" value="${review?.author?.id}" class="many-to-one"/>

</div>

--%><div class="fieldcontain ${hasErrors(bean: review, field: 'review', 'error')} required">
	<div class="form-group">
        <label for="textArea" class="col-lg-2 control-label">Review</label>
        <div class="col-lg-10">
        	<g:textArea class="form-control" rows="3" id="review" name="review" value="${review?.review}"></g:textArea>
    	</div>
	</div>
</div>
<%--<div class="fieldcontain ${hasErrors(bean: review, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="review.event.label" default="event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${fyp.Event.list()}" optionKey="id" required="" value="${review?.event?.id}" class="many-to-one"/>

</div>

--%>