package fyp

import grails.transaction.Transactional

@Transactional
class UploadEventService
{
    def amazonS3Service
    def eventGormService

    Event upload(UploadCommand cmd) {

        def path = "event/${cmd.id}/" + cmd.file.originalFilename
        String s3FileUrl = amazonS3Service.storeMultipartFile(path, cmd.file)

        def event = eventGormService.updateUrl(cmd.id, cmd.eventId, cmd.version, s3FileUrl)

        if ( !event || event.hasErrors() ) 
        {
            amazonS3Service.deleteFile(path)
        }
        
        event
    }
}
