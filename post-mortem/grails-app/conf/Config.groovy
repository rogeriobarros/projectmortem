import grails.util.Environment

import java.awt.*

import com.octo.captcha.component.image.backgroundgenerator.UniColorBackgroundGenerator
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator
import com.octo.captcha.component.image.textpaster.NonLinearTextPaster
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator
import com.octo.captcha.engine.GenericCaptchaEngine
import com.octo.captcha.image.gimpy.GimpyFactory
import com.octo.captcha.service.multitype.GenericManageableCaptchaService

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

if(System.properties['appconfig.root']) {
	def appcfgroot = System.properties['appconfig.root']
	grails.config.locations = [ "file:///${appcfgroot}/config/appconfig.properties" ]
} else {
	def locations = ["classpath:appconfig.properties"]
	if(Environment.current == Environment.TEST) {
		locations << "classpath:test-appconfig.properties"
	} else {
		def hostName = InetAddress.getLocalHost().getHostName()
		locations << "classpath:${hostName}-appconfig.properties"
	}
	grails.config.locations = locations
}

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password', 'passwordConfirmation']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = true

environments {
    development {
        grails.logging.jul.usebridge = true
		def port = System.properties.getProperty("server.port")
		grails.serverURL = "http://localhost:${port}/postmortem"
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

grails.mail.default.from="noreply-postmorte@postmortem.com"
grails {
	mail {
		host = 'smtp.gmail.com'
		port = 465
		username = 'userbucha@gmail.com'
		password = 'rogerio123'
		props = [ "mail.smtp.auth":"true", 					   
	              "mail.smtp.socketFactory.port": "465",
	              "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
	              "mail.smtp.socketFactory.fallback": "false"]

	}
}

jcaptchas {
	imageCaptcha = new GenericManageableCaptchaService(
		new GenericCaptchaEngine(
			new GimpyFactory(
				new RandomWordGenerator( "abcdefghijklmnopqrstuvwxyz1234567890" ),
					new ComposedWordToImage(
						new RandomFontGenerator( 20, // min font size
												 30, // max font size
												 [new Font("Arial", 0, 10)] as Font[]
												),
						new UniColorBackgroundGenerator( 140, // width
														 35, // height
														new Color(255, 255, 255)
														),
					   new NonLinearTextPaster( 6, // minimal length of text
												6, // maximal length of text
												new Color(0, 0, 0)
											  )
					)
				)
			),
			180, // minGuarantedStorageDelayInSeconds
			180000 // maxCaptchaStoreSize
		 )
 }

def adminConfigRoles = ['ROLE_ADMIN', 'ROLE_USER', 'IS_AUTHENTICATED_FULLY']

def roles = [
	'/runtimeLogging/**' : adminConfigRoles,
	'/person/**' : adminConfigRoles,
	'/images/**' : ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/css/**' : ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/js/**' : ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/**' : ['IS_AUTHENTICATED_ANONYMOUSLY']
	]

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.postmortem.security.Person'
grails.plugins.springsecurity.userLookup.passwordPropertyName = "password"
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.postmortem.security.PersonAuthority'
grails.plugins.springsecurity.authority.className = 'com.postmortem.security.Authority'
// Values can be
// MD2, MD5, SHA-1, SHA-256, SHA-384, SHA-512
grails.plugins.springsecurity.password.algorithm = "SHA-256"

grails.plugins.springsecurity.securityConfigType = grails.plugins.springsecurity.SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.interceptUrlMap = roles

grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/person'
grails.plugins.springsecurity.failureHandler.defaultFailureUrl = '/login'

if(Environment.currentEnvironment == Environment.PRODUCTION) {
	def authBasicFilters = 'httpSessionContextIntegrationFilterWithASCFalseBasicAuth,basicProcessingFilterBasicAuth,exceptionTranslationWithASCFilterBasicAuth,filterInvocationInterceptor'
	grails.plugins.springsecurity.filterChain.chainMap = [
		'/runtimeLogging/**': authBasicFilters,
		'/content/**': authBasicFilters,
		'/**': 'JOINED_FILTERS']
}

// log4j configuration
String stacktraceName = System.getProperty('stacktrace')
String fileNameLog = "/${appName}-stacktrace.log"
String tempDir = System.getProperty('java.io.tmpdir')

log4j = {
	appenders {
		console name:'stdout', layout:pattern(conversionPattern: '%d [%t] %-5p %c - %m%n')
		environments {
			production {
				rollingFile name:"stacktrace", file:"${stacktraceName ? stacktraceName + fileNameLog : tempDir + fileNameLog}"
			}
		}
	}

	if(Environment.current == Environment.PRODUCTION) {
		info 'com.postmortem', 'grails.app'
		appenders {
			'null' name: "stacktrace" // Desabilitando stacktrace para PROD
		}		
	} else {
		debug 'com.postmortem', 'grails.app'
	}

	info 'com.postmortem', 'grails.app'

	error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
				 'org.codehaus.groovy.grails.web.pages', //  GSP
				 'org.codehaus.groovy.grails.web.sitemesh', //  layouts
				 'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
				 'org.codehaus.groovy.grails.web.mapping', // URL mapping
				 'org.codehaus.groovy.grails.commons', // core / classloading
				 'org.codehaus.groovy.grails.plugins', // plugins
				 'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
				 'org.springframework',
				 'org.hibernate',
				 'net.sf.ehcache.hibernate'
}
