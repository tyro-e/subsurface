import grails.util.Environment
import fyp.User
import fyp.EventController
import fyp.Event

class BootStrap {

    def init = { servletContext ->

        def user = User.findOrSaveWhere(fullName:"Tyrone Stock", email:"s.tyrone@hotmail.com", password:"root",role:"ROLE_ADMIN")
        def admin = User.findOrSaveWhere(fullName:"Admin", email:"admin@hotmail.com", password:'root',role:"ROLE_ADMIN")

    }

    def destroy = {
    }
}