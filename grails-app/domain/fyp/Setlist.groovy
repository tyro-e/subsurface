package fyp

class Setlist 
{
    String track
    int position

    static belongsTo = [event:Event, user:User]

    static constraints = {
        
    }
}