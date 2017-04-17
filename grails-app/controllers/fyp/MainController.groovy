package fyp
import org.springframework.web.context.request.RequestContextHolder


class MainController 
{
    def homepage() 
    {
        int eventCount = Event.count()
        int startingPoint = eventCount - 50

        def events = Event.createCriteria().list
        {
            order('id')
            firstResult(startingPoint)
            maxResults(50)
        }
        
        respond events
    }
}




class MenuTagLib 
{
    static namespace = 'html'

  	def render = {attrs ->

    	def filePath = attrs.file

	    if (!file) {
	      throwTagError("'file' attribute must be provided")
	    }

	    def htmlContent = new File(filePath).text
	    out <<  g.render(template: "/bandsintown")
	}
}
