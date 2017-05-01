package fyp

class Review {
	
	String comment
	int rating

	static belongsTo = [event:Event, user:User]
	
	static mapping = {
		comment type:"text"
		rating nullable:true
		
	}

    static constraints = {
		rating( range: 1..5)
    }
}