package fyp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LivestreamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Livestream.list(params), model:[livestreamInstanceCount: Livestream.count()]
    }

    def show(Livestream livestreamInstance) {
        respond livestreamInstance
    }

    def create() {
        respond new Livestream(params)
    }

    @Transactional
    def save(Livestream livestreamInstance) {
        if (livestreamInstance == null) {
            notFound()
            return
        }

        if (livestreamInstance.hasErrors()) {
            respond livestreamInstance.errors, view:'create'
            return
        }

        livestreamInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'livestreamInstance.label', default: 'Livestream'), livestreamInstance.id])
                redirect livestreamInstance
            }
            '*' { respond livestreamInstance, [status: CREATED] }
        }
    }

    def edit(Livestream livestreamInstance) {
        respond livestreamInstance
    }

    @Transactional
    def update(Livestream livestreamInstance) {
        if (livestreamInstance == null) {
            notFound()
            return
        }

        if (livestreamInstance.hasErrors()) {
            respond livestreamInstance.errors, view:'edit'
            return
        }

        livestreamInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Livestream.label', default: 'Livestream'), livestreamInstance.id])
                redirect livestreamInstance
            }
            '*'{ respond livestreamInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Livestream livestreamInstance) {

        if (livestreamInstance == null) {
            notFound()
            return
        }

        livestreamInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Livestream.label', default: 'Livestream'), livestreamInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'livestreamInstance.label', default: 'Livestream'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
