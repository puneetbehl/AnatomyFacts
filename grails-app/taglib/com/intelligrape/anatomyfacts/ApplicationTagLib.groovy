package com.intelligrape.anatomyfacts

class ApplicationTagLib {

    static namespace = "af"

    def categories = { attrs, body ->
        List<Category> categories = Category.list()
        out << render(template: '/category/categoriesMultiSelect', model: [categories: categories])
    }
}
