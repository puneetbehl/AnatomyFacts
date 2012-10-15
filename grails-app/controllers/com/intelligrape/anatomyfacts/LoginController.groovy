package com.intelligrape.anatomyfacts

import grails.converters.JSON

import javax.servlet.http.HttpServletResponse

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

class LoginController {

    def authenticationTrustResolver
    def springSecurityService

    def index = {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    def auth = {
        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: '/index', model: [postUrl: postUrl,
                rememberMeParameter: config.rememberMe.parameter]
    }

    def authAjax = {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    def denied = {
        if (springSecurityService.isLoggedIn() && authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
            redirect action: 'full', params: params
        }
    }

    def full = {
        def config = SpringSecurityUtils.securityConfig
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
                        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    def authfail = {

        def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            msg = exception instanceof AccountExpiredException ? g.message(code: "springSecurity.errors.login.expired") : exception instanceof CredentialsExpiredException ? g
                    .message(code: "springSecurity.errors.login.passwordExpired") : exception instanceof DisabledException ? g.message(code: """springSecurity.errors.login
.disabled""") : exception instanceof LockedException ? g.message(code: "springSecurity.errors.login.locked") : g.message(code: "springSecurity.errors.login.fail")
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    def ajaxSuccess = {
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    def ajaxDenied = {
        render([error: 'access denied'] as JSON)
    }

    def dashboard(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [testList: Test.list(params), testTotal: Test.count(), quizList: Quiz.list(params), quizTotal: Quiz.count()]
    }

    def register() {
        def config = SpringSecurityUtils.securityConfig
        User user = new User(params)
        user.enabled = true
        user.save failOnError: true
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        flash.registrationSuccess = "User registered successfully. Please login"
        redirect(uri: '/')
    }
}
