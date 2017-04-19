package fyp

class LoginTagLib {

	def loginControl = {
		if(session.user)
		{
			out << "hi "
			out << """${link(action:"logout", controller:"user", class:"test"){"Logout"}}"""
 	 	}

 	 	else{
			out << """${link(action:"login", controller:"user"){"Login"}}"""
			out << " // "
			out << """${link(action:"create", controller:"user"){"Register"}}"""
		  }
	}
}