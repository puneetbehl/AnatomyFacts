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

    def tagInput = { attrs ->
        Map model = [:]
        attrs.id = attrs.id ?: attrs.name
        model.id = attrs.id
        model.name = attrs.name
        model.url = attrs.url
        model.htmlClass = attrs.class ?: " "
        out << g.render(template: '/sharedTemplates/tagInput', model: model)
    }
}
