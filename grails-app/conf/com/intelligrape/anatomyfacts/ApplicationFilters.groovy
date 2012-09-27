package com.intelligrape.anatomyfacts

class ApplicationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info "${params}"
            }
        }
    }
}
