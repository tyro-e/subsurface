package fyp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SetlistController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", saveAjax: "POST", deleteAjax: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Setlist.list(params), model:[setlistCount: Setlist.count()]
    }

    def show(Setlist setlist) {
        respond setlist
    }

    def create() {
        respond new Setlist(params)
    }

    @Transactional
    def save(Setlist setlist) {
        if (setlist == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (setlist.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond setlist.errors, view:'create'
            return
        }

        setlist.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'setlist.label', default: 'Setlist'), setlist.id])
                //redirect(action:'show',controller:'event', id:setlist.event.id)
            }
            '*' { respond setlist, [status: CREATED] }
        }
    }

    def saveAjax(Setlist setlist){
        def position = setlist?.position
        def track = setlist?.track

        setlist.save flush:true
    }

    def deleteAjax(Setlist setlist){
        def id = setlist?.id

        println id

        setlist.delete flush:true
    }

    def edit(Setlist setlist) {
        respond setlist
    }

    @Transactional
    def update(Setlist setlist) {
        if (setlist == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (setlist.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond setlist.errors, view:'edit'
            return
        }

        setlist.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'setlist.label', default: 'Setlist'), setlist.id])
                redirect setlist
            }
            '*'{ respond setlist, [status: OK] }
        }
    }

    @Transactional
    def delete(Setlist setlist) {

        if (setlist == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        setlist.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'setlist.label', default: 'Setlist'), setlist.id])
                redirect(action:'show',controller:'event', id:setlist.event.id)
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'setlist.label', default: 'Setlist'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
