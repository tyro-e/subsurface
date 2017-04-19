package fyp

import com.amazonaws.services.s3.model.*

class Event  {


	int bandsintown_id
	String artist
	String venue
	String ticketUrl
	String ticketStatus
    String eventTime
    String livestream
    String longitude
    String latitude

    static hasMany = [contents:Content, reviews:Review]

    static constraints = {
        bandsintown_id unique:true
        livestream nullable:true
    }

    static mapping = { 
        ticketUrl column: 'ticket_url' 
    }


    def onAddComment = { comment ->
        // post processing logic for newly added comment
    }

    Double getAvgRating() {
        // Dynamic call to method added by Rateable plugin.
        return averageRating
    }

    Integer getRatingCount() {
        return totalRatings
    }


}
