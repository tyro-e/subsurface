package fyp

class LoginTagLib {

	def loginControl = {
		if(session.user)
		{
			out << "Hello ${session.user.fullName} "
			out << """${link(action:"logout", controller:"user", class:"test"){"Logout"}}"""
 	 	}

 	 	else{
			out << """${link(action:"login", controller:"user"){"Login"}}"""
			out << " or Sign up "
			out << """${link(action:"create", controller:"user"){"Register"}}"""
		  }
	}
}