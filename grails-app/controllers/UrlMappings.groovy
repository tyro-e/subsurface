class UrlMappings {

	static mappings = {

        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"main")
        "/artist"(controller:"artist")
        "/venue"(controller:"venue")
        "/event"(controller:"event")
        "/user"(controller:"user")
        "/livestream"(controller:"livestream")

        "500"(view:'/error')

        "/event/$id/upload"(controller: "event", parseRequest: true) 
        {
           action = [POST: "uploadImageToAmazon"]
        }
	}
}
