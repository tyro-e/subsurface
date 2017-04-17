package fyp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VenueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Venue.list(params), model:[venueInstanceCount: Venue.count()]
    }

    def show(Venue venueInstance) {
        respond venueInstance
    }

    def create() {
        respond new Venue(params)
    }

    @Transactional
    def save(Venue venueInstance) {
        if (venueInstance == null) {
            notFound()
            return
        }

        if (venueInstance.hasErrors()) {
            respond venueInstance.errors, view:'create'
            return
        }

        venueInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'venueInstance.label', default: 'Venue'), venueInstance.id])
                redirect venueInstance
            }
            '*' { respond venueInstance, [status: CREATED] }
        }
    }

    def edit(Venue venueInstance) {
        respond venueInstance
    }

    @Transactional
    def update(Venue venueInstance) {
        if (venueInstance == null) {
            notFound()
            return
        }

        if (venueInstance.hasErrors()) {
            respond venueInstance.errors, view:'edit'
            return
        }

        venueInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Venue.label', default: 'Venue'), venueInstance.id])
                redirect venueInstance
            }
            '*'{ respond venueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Venue venueInstance) {

        if (venueInstance == null) {
            notFound()
            return
        }

        venueInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Venue.label', default: 'Venue'), venueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'venueInstance.label', default: 'Venue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
