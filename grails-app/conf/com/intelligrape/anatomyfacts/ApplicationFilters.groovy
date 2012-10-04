package com.intelligrape.anatomyfacts

class ApplicationFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info "${params}"
            }
        }
        consoleImports(controller: 'console', action: '*') {
            before = {
                String importStatements = """import com.intelligrape.anatomyfacts.*"""
                session['_grails_console_last_code_'] = session['_grails_console_last_code_'] ?: importStatements
            }
        }

    }
}
