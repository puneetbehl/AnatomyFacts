package com.intelligrape.anatomyfacts

import grails.converters.JSON

class TagController {

    def tags() {
        render Tag.list() as JSON
    }
}
