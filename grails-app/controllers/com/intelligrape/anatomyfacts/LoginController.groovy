package com.intelligrape.anatomyfacts

class LoginController {

    def loginHandler() {
        if(params.email=="admin@ig.com"&&params.password=="igdefault") {
           session.email=params.email
        }
        redirect(uri: '/')
    }
}
