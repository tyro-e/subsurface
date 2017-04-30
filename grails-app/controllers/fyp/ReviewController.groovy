package fyp

import static org.springframework.http.HttpStatus.*
import com.sun.jmx.snmp.UserAcl;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReviewController extends ControllerTemplate
{
    def beforeInterceptor=[action:this.&auth, except:["index", "show"]]

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", saveAjax: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Review.list(params), model:[reviewCount: Review.count()]
    }

    def show(Review review) {
        respond review
    }

    def create() {
        respond new Review(params)
    }

    @Transactional
    def save(Review review) {
        if (review == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (review.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond review.errors, view:'create'
            return
        }
        review.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'review.label', default: 'Review'), review.id])
                redirect(action:'show',controller:'event', id:review.event.id)
            }
            '*' { respond review, [status: CREATED] }
        }
    }

    def saveAjax(Review review) 
    {
        User user = User.get(session.user.id)
        def comment = review?.comment
        def rating = review?.rating

        

        println user
        println comment
        println rating

        review.save flush:true
    }





    def edit(Review review) {
        User user = User.get(session.user.id)
        println user

        if(user != review.author){
            flash.message="You can only edit your own review"
            redirect(action:'show',controller:'event', id:review.event.id)
        }else{
            respond review
        }
    }

    @Transactional
    def update(Review review) {
        if (review == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (review.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond review.errors, view:'edit'
            return
        }

        review.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'review.label', default: 'Review'), review.id])
                redirect(action:'show',controller:'event', id:review.event.id)
            }
            '*'{ respond review, [status: OK] }
        }
    }

    @Transactional
    def delete(Review review) {
        User user = User.get(session.user.id)
      
        if(user != review.author)
        {
            flash.message="You can only delete your own review"
            redirect(action:'show',controller:'event', id:review.event.id)
            return 
        }

        if (review == null)
        {
            notFound()
            return
        }

        review.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Review.label', default: 'Review'), review.id])
                redirect(action:'show',controller:'event', id:params.eventId)
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
