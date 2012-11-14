import com.postmortem.security.Authority
import com.postmortem.security.Person
import com.postmortem.security.PersonAuthority

class BootStrap {

	def springSecurityService
	
    def init = { servletContext ->
		def userAuth = Authority.findByAuthority('ROLE_USER') ?: new Authority(authority: 'ROLE_USER').save(failOnError: true)
		def adminAuth = Authority.findByAuthority('ROLE_ADMIN') ?: new Authority(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		def adminUser = Person.findByUsername('admin') ?: new Person(
			username: 'admin',
			password: 'admin',
			enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(adminAuth)) {
			PersonAuthority.create adminUser, adminAuth
		}
    }
    def destroy = {
    }
}
