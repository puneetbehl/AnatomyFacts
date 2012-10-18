package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class TestController {

    public static final MAX_QUESTIONS = 10

    def springSecurityService

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def create(Long id) {
        def test = id ? Test.get(id) : new Test(params)
        if (!test) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(action: "list")
        } else {
            [test: test]
        }
    }

    def save(Long id, Long version) {
        def test = id ? Test.get(id) : new Test(params)
        if (!test) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (test.version > version) {
                test.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'test.label', default: 'Test')] as Object[],
                        "Another user has updated this Test while you were editing")
                render(view: "create", model: [test: test])
                return
            }
        }

        test.properties = params

        if (!test.save(flush: true)) {
            render(view: "create", model: [test: test])
            return
        }
        flash.success = id ? message(code: 'default.updated.message', args: [message(code: 'test.label', default: 'Test'), test.id]) : message(code: 'default.created.message', args: [message(code: 'test.label', default: 'Test'), test.id])
        redirect(action: "show", id: test.id)
    }

    def show(Long id) {
        def test = Test.get(id)
        if (!test) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(action: "list")
            return
        }
        [test: test]
    }

    def delete(Long id) {
        def test = Test.get(id)
        if (!test) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(controller: 'login', action: "dashboard")
            return
        }

        try {
            test.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(controller: 'login', action: "dashboard")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'test.label', default: 'Test'), id])
            redirect(action: "show", id: id)
        }
    }

    def generate() {
        List<Category> categories = params?.categories?.collect {  categoryID ->
            Category.load(categoryID)
        }
        Collection<Long> questionIds = TestQuestion.getAllQuestionIdsFromDb(categories)
        Collections.shuffle questionIds
        List<Long> ids = questionIds.take(questionIds.size() < MAX_QUESTIONS ? questionIds.size() : MAX_QUESTIONS)
        List<TestQuestion> questions = TestQuestion.getAll(ids)
        render(view: '/test/test', model: [questions: questions, categoryIds: params?.categories])
    }

    def result() {
        Test test = new Test(params)
        test.contestant = (User) springSecurityService.currentUser
        Integer totalScore = 0
        test?.testAnswers?.each { qa ->
            totalScore += (qa?.answer == qa?.question?.answer ? 1 : 0)
        }
        test.score = totalScore
        test.save failOnError: true
        render view: '/test/testResult', model: [test: test, totalScore: totalScore]
    }
}
