package fyp

import grails.rest.*
import grails.converters.*
import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.Method.GET
import static groovyx.net.http.ContentType.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class EventController extends RestfulController
{
    static allowedMethods = [save: "POST", update: "PUT", uploadFeaturedImage: "POST", delete: "DELETE"]

    def uploadEventService
    def eventGormService

    EventController() {
        super(Event)
    }

    def populate() {

        def http = new HTTPBuilder( 'http://api.bandsintown.com/events/search.json?&api_version=2.0&app_id=FYP&location=Dublin,Ireland' )

        def JSONData

        http.request( GET, JSON ) 
        {
            response.success = { resp, json -> JSONData = JSON.parse(json.text) }
        }

        int numberEvents = 0

        JSONData.each {

            String artistName1 = it.artists.name.toString();
            String artistName2 = artistName1.replace("[","").replace("]","");

            def event = new Event(  
                                    bandsintown_id: it.id.toString(),
                                    artist: artistName2, 
                                    venue: it.venue.name.toString(),
                                    ticketUrl: it.ticket_url.toString(),
                                    ticketStatus: it.ticket_status.toString(),
                                    eventTime: it.datetime.toString(),
                                    latitude: it.venue.latitude.toString(),
                                    longitude: it.venue.longitude.toString())

                                    
            if (!event.save()) {
                event.errors.allErrors.each {
                    println it
                }
            } 

            else {
                numberEvents++
            }
        }

        render "${numberEvents} events loaded"
    }

    def upload(UploadCommand cmd) {
        
        if (cmd.hasErrors()) {
            respond(cmd.errors, model: [event: cmd], view: 'show')
            return
        }

        def event = uploadEventService.upload(cmd)
        if (event == null) {
            notFound()
            return
        }

        if (event.hasErrors()) {
            respond(event.errors, model: [event: event], view: 'show')
            return
        }
        

        

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }


    def showByBandId() 
    {
        def event = Event.findByBandsintown_id( params.id )
        redirect ( action: 'show', id: event.id )
    }

    def index(Integer max) 
    {
        params.max = Math.min(max ?: 10, 100)
        respond Event.list(params), model:[eventInstanceCount: Event.count()]
    }
    

    def show(Event eventInstance) {
        respond eventInstance
    }

    def create() {
        respond new Event(params)
    }

    @Transactional
    def save(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view:'create'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventInstance.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*' { respond eventInstance, [status: CREATED] }
        }
    }

    def edit(Event eventInstance) {
        respond eventInstance
    }

    @Transactional
    def update(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view:'edit'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*'{ respond eventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Event eventInstance) {

        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventInstance.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


}