package com.intelligrape.anatomyfacts

class ApplicationTagLib {

    static namespace = "af"

    def categories = { attrs, body ->
        List<Category> categories = Category.list()
        out << render(template: '/quiz/categories', model: [categories: categories])
    }
}
