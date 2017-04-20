package fyp

class Setlist 
{
    String track
    int position

    static belongsTo = [event:Event, author:User]

    static constraints = {
        
    }
}