package com.intelligrape.anatomyfacts

import grails.converters.JSON

class TagController {

    def scaffold = true

    def tags() {
        String queryString = params?.term?.split(',')?.last()
        List<String> result = Tag.findAllByLabelIlike("%${queryString}%")
        render(result as JSON)
    }
}
