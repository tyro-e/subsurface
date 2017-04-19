package fyp

class Review {
	
	String review
	int rating

	static belongsTo = [event:Event, author:User]
	
	static mapping = {
		review type:"text"
		rating nullable:true
	}

    static constraints = {
		rating( range: 1..5)
    }
}