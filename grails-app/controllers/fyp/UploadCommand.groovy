package fyp

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class UploadCommand implements Validateable {
    MultipartFile file
    Long id
    Long eventId
    Integer version

    static constraints = {
        id nullable: false
        version nullable: false
        eventId nullable:false
        
        file  validator: { val, obj ->
            if ( val == null ) {
                return false
            }
            if ( val.empty ) {
                return false
            }

            ['jpeg', 'jpg', 'png', 'wmv', 'mp4', 'mov'].any { extension -> // <1>
                 val.originalFilename?.toLowerCase()?.endsWith(extension)
            }
        }
    }
}
