<%@ page import="fyp.Review" %>
<!-- RATING -->
<div class="fieldcontain ${hasErrors(bean: review, field: 'rating', 'error')}">
	<div class="form-group">
	    <div class="col-md-7 rating-field" style="float: left;padding: 0">
	    	<span class="star-rating star-5">
		    	<g:radio name="rating" required id="rating-1" value="1"/><i></i>
		    	<g:radio name="rating" id="rating-2" value="2"/><i></i>
		    	<g:radio name="rating" id="rating-3" value="3"/><i></i>
		    	<g:radio name="rating" id="rating-4" value="4"/><i></i>
		    	<g:radio name="rating" id="rating-5" value="5"/><i></i>
		    </span>
	    </div>
    </div>
</div>

<!-- REVIEW -->
<div class="fieldcontain ${hasErrors(bean: review, field: 'review', 'error')}">
	<div class="form-group">
        <div class="col-md-8"  style="float: left;padding: 0;">
        	<g:textArea required class="form-control review-textarea" rows="3" id="review" name="review" value="${review?.review}"></g:textArea>
        	<div style = "float: right;margin-top: 3px;">
	        	<g:if test="${session.user!=null}">
					<g:submitButton name="create" class="btn post-comment-btn" value="POST" />
				</g:if>

				<g:if test="${session.user==null}">
					<div>YOU MUST LOGIN TO TAKE PART</div>
				</g:if>
			</div>
    	</div>
	</div>
</div>













<%--

<div class="fieldcontain ${hasErrors(bean: review, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="review.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${fyp.User.list()}" optionKey="id" required="" value="${review?.author?.id}" class="many-to-one"/>

</div>

--%>


<%--<div class="fieldcontain ${hasErrors(bean: review, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="review.event.label" default="event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${fyp.Event.list()}" optionKey="id" required="" value="${review?.event?.id}" class="many-to-one"/>

</div>

--%>