package fyp

class Venue {

	/*
	Long id
	String venueName
	String venueDescription
	String venueAddress
	Boolean alcoholServed
	Integer capacity

	static hasMany = [events:Event]

    static constraints = {
    	venueName blank:false
    	venueDescription nullable:true
    	venueAddress blank:false
    	alcoholServed nullable:true
    	capacity nullable:true
    }
    */

    String name
    String uploadFeaturedImage

    static constraints = {
    	uploadFeaturedImage nullable:true
    }
}
