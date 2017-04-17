package fyp



import grails.test.mixin.*
import spock.lang.*

@TestFor(HotelController)
@Mock(Hotel)
class HotelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.hotelInstanceList
            model.hotelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.hotelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def hotel = new Hotel()
            hotel.validate()
            controller.save(hotel)

        then:"The create view is rendered again with the correct model"
            model.hotelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            hotel = new Hotel(params)

            controller.save(hotel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/hotel/show/1'
            controller.flash.message != null
            Hotel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def hotel = new Hotel(params)
            controller.show(hotel)

        then:"A model is populated containing the domain instance"
            model.hotelInstance == hotel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def hotel = new Hotel(params)
            controller.edit(hotel)

        then:"A model is populated containing the domain instance"
            model.hotelInstance == hotel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/hotel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def hotel = new Hotel()
            hotel.validate()
            controller.update(hotel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.hotelInstance == hotel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            hotel = new Hotel(params).save(flush: true)
            controller.update(hotel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/hotel/show/$hotel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/hotel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def hotel = new Hotel(params).save(flush: true)

        then:"It exists"
            Hotel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(hotel)

        then:"The instance is deleted"
            Hotel.count() == 0
            response.redirectedUrl == '/hotel/index'
            flash.message != null
    }
}
