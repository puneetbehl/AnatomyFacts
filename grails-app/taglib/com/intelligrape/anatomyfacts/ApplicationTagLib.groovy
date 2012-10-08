package com.intelligrape.anatomyfacts

class ApplicationTagLib {

    static namespace = "af"
    def ifLoggedIn = { attrs, body ->
        if (session.email)
            out << body()
    }

    def ifNotLoggeedIn = { attrs, body ->
        if (!session.email)
            out << body()
    }
}
