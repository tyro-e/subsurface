package fyp

import grails.transaction.Transactional

class HotelGormService {

    @Transactional(readOnly = true)
    List list(Map params) {
        [Event.list(params), Event.count()]
    }

    // tag::updateFeaturedImageUrl[]
    @Transactional
    Event updateFeaturedImageUrl(Long id, Long eventId, Integer version, String featuredImageUrl) {
        
        Event event = Event.get(eventId)

        def content = new Content(event: event, featuredImageUrl: featuredImageUrl)

        if(!content.save(flush:true)){
            content.errors.allErrors.each{
                log.error(it)
            }
        }

        event.save()
    }
    // end::updateFeaturedImageUrl[]

    @Transactional
    Event save(NameCommand cmd) {
        def event = new Event()
        event.properties = cmd.properties
        event.save()
    }

    @Transactional
    Event update(NameUpdateCommand cmd) {
        Event event = Event.get(cmd.id)
        event.properties = cmd.properties
        event.save()
    }

    @Transactional
    void deleteById(Long eventId) {
        def event = Event.get(eventId)
        event?.delete()
    }
}
