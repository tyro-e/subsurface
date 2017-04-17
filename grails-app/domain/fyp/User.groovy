package fyp

class User {

	String fullName;
	String email;
	String password;
	String role = "ROLE_USER";

    static constraints = {
		fullName()
		email([unique:true, email:true])
		password(password:true)
		role(inList:["ROLE_USER","ROLE_ADMIN"])
    }
	
	String toString(){
		"${fullName}"
	}
}