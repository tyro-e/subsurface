package fyp



import grails.test.mixin.*
import spock.lang.*

@TestFor(ArtistController)
@Mock(Artist)
class ArtistControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.artistInstanceList
            model.artistInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.artistInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def artist = new Artist()
            artist.validate()
            controller.save(artist)

        then:"The create view is rendered again with the correct model"
            model.artistInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            artist = new Artist(params)

            controller.save(artist)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/artist/show/1'
            controller.flash.message != null
            Artist.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def artist = new Artist(params)
            controller.show(artist)

        then:"A model is populated containing the domain instance"
            model.artistInstance == artist
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def artist = new Artist(params)
            controller.edit(artist)

        then:"A model is populated containing the domain instance"
            model.artistInstance == artist
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/artist/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def artist = new Artist()
            artist.validate()
            controller.update(artist)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.artistInstance == artist

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            artist = new Artist(params).save(flush: true)
            controller.update(artist)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/artist/show/$artist.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/artist/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def artist = new Artist(params).save(flush: true)

        then:"It exists"
            Artist.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(artist)

        then:"The instance is deleted"
            Artist.count() == 0
            response.redirectedUrl == '/artist/index'
            flash.message != null
    }
}
