package com.intelligrape.anatomyfacts

import grails.converters.JSON
import vo.TagVO

class TestQuestionController {

    def scaffold = true

    def save(Long id, Long version) {
        def testQuestion = id ? TestQuestion.get(id) : new TestQuestion(params)
        if (!testQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (testQuestion.version > version) {
                testQuestion.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'testQuestion.label', default: 'TestQuestion')] as Object[],
                        "Another user has updated this TestQuestion while you were editing")
                render(view: "create", model: [testQuestion: testQuestion])
                return
            }
        }
        collectTagsFromParams(testQuestion)

        if (!testQuestion.save(flush: true)) {
            render(view: "create", model: [testQuestion: testQuestion])
            return
        }

        flash.success = id ? message(code: 'default.updated.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), testQuestion.id]) :
            message(code: 'default.created.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), testQuestion.id])
        redirect(action: "show", id: testQuestion.id)
    }

    def tags() {
        List<Tag> tags = Tag.list()
        List results = tags ? tags.collect {new TagVO(it.label)} : []
        results.add(new TagVO(params.q))
        results.unique {it.label}
        render([["id": "Netta rufina", "label": "Red-crested Pochard", "value": "Red-crested Pochard"], ["id": "Sterna sandvicensis", "label": "Sandwich Tern", "value": "Sandwich Tern"]] as JSON)
    }

    private void collectTagsFromParams(TestQuestion testQuestion) {
        testQuestion.tags = params?.tags ?
            params?.tags?.split(',')?.collect { label->
                Tag existingTag = Tag.findByLabel(label)
                Tag tag = existingTag ? existingTag : new Tag(label: label)
                return tag
            } : []
    }

}
