package fyp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", getEmails: "GET"]

    def sessionFactory

    def getEmails() {

        def userEmails = User.createCriteria()
        def acqEmails = userEmails.list
        {
            projections
            {
                property("email")  
            }
        }
        
        render acqEmails
    }

    def login(){}
    
    def authenticate(){
        def user = User.findByEmailIlikeAndPassword(params.email, params.password)

        if(user != null){
            session.user = user 
            redirect(controller:"main")
        }

        else{
            flash.message= "TRY AGAIN"
            redirect(action:"login")
        }
    }
    
    def logout(){
        flash.message="BYE"
        session.user = null
        redirect(uri: request.getHeader('referer') )
    }


    def auth(){
        if(!session.user){
            redirect(controller:'user', action:'login')
            return false
        }
    }






    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }


    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            flash.message = "YOU NEED TO TRY THAT AGAIN"
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = "NOW SIGN IN"
                redirect(action:'login')
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    @Transactional
    def registration() {
        def user = new User(params).save()

        if(user.hasErrors()) {
            flash.userInstance = user
            redirect action: 'register'
        } else {
            session.user = user 
            redirect uri: '/' 
        } 
    }
}
