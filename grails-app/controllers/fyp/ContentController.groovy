package fyp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Content.list(params), model:[contentInstanceCount: Content.count()]
    }

    def show(Content contentInstance) {
        respond contentInstance
    }

    def create() {
        respond new Content(params)
    }

    @Transactional
    def save(Content contentInstance) {
        if (contentInstance == null) {
            notFound()
            return
        }

        if (contentInstance.hasErrors()) {
            respond contentInstance.errors, view:'create'
            return
        }

        contentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contentInstance.label', default: 'Content'), contentInstance.id])
                redirect contentInstance
            }
            '*' { respond contentInstance, [status: CREATED] }
        }
    }

    def edit(Content contentInstance) {
        respond contentInstance
    }

    @Transactional
    def update(Content contentInstance) {
        if (contentInstance == null) {
            notFound()
            return
        }

        if (contentInstance.hasErrors()) {
            respond contentInstance.errors, view:'edit'
            return
        }

        contentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Content.label', default: 'Content'), contentInstance.id])
                redirect contentInstance
            }
            '*'{ respond contentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Content contentInstance) {

        if (contentInstance == null) {
            notFound()
            return
        }

        contentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Content.label', default: 'Content'), contentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentInstance.label', default: 'Content'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
