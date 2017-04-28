package fyp

class Setlist 
{
    String track
    int position

    def beforeInsert() 
    {
    	def lastPonum = Event.list([sort: 'position', order:'desc', max: 1])

	    if(lastPonum)
	      position = (lastPonum.pop().position as int) + 1 as String
	    else
	      position = '0'
  	}

    static belongsTo = [event:Event]

    static constraints = {
        
    }
}