import grails.util.Environment
import fyp.User
import fyp.Role
import fyp.UserRole
import fyp.EventController
import fyp.Event

class BootStrap {

    def init = { servletContext ->

        //new EventController().populate()

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def admin = new User(username: "admin", password: "admin", enabled: true).save(flush: true)
        UserRole.create(admin, adminRole).save()
        UserRole.create(admin, userRole).save()

        def user = new User(username: "user", password: "user", enabled: true).save(flush: true)
        UserRole.create(user, userRole).save()
    }

    def destroy = {
    }
}
