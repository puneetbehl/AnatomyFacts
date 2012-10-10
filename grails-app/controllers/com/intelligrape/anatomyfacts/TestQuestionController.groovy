package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class TestQuestionController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [testQuestionList: TestQuestion.list(params), testQuestionTotal: TestQuestion.count()]
    }

    def create(Long id) {
        def testQuestion = id ? TestQuestion.get(id) : new TestQuestion(params)
        if (!testQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "list")
        } else {
            [testQuestion: testQuestion]
        }
        render view: "/testQuestion/create", model: ['categoryID': params?.categoryID, 'fromContext': params?.fromContext, testQuestion: testQuestion]
    }

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
        if (params?.fromContext) {
            flash.success = "Question added successfully"
        }
        redirect(controller: params?.fromContext ? "category" : "testQuestion", action: "create", id: "${params?.fromContext ? params?.category?.id : ''}")
    }

    def show(Long id) {
        def testQuestion = TestQuestion.get(id)
        if (!testQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "list")
            return
        }

        [testQuestion: testQuestion]
    }

    def delete(Long id) {
        def testQuestion = TestQuestion.get(id)
        if (!testQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "list")
            return
        }

        try {
            testQuestion.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'testQuestion.label', default: 'TestQuestion'), id])
            redirect(action: "show", id: id)
        }
    }

    private void collectTagsFromParams(TestQuestion testQuestion) {
        testQuestion.tags = params?.tags ?
            params?.tags?.split(',')?.collect { label ->
                Tag existingTag = Tag.findByLabel(label)
                Tag tag = existingTag ? existingTag : new Tag(label: label)
                return tag
            } : []
    }
}
