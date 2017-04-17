package fyp

import grails.transaction.Transactional

@Transactional
class UploadHotelFeaturedImageService
{
    def amazonS3Service
    def hotelGormService

    Event uploadFeatureImage(FeaturedImageCommand cmd) {

        def path = "event/${cmd.id}/" + cmd.featuredImageFile.originalFilename
        String s3FileUrl = amazonS3Service.storeMultipartFile(path, cmd.featuredImageFile)

        def event = hotelGormService.updateFeaturedImageUrl(cmd.id, cmd.eventId, cmd.version, s3FileUrl)

        if ( !event || event.hasErrors() ) 
        {
            amazonS3Service.deleteFile(path)
        }
        
        event
    }
}
