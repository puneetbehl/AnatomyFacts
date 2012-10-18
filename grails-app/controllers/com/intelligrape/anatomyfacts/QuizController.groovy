package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class QuizController {

    public static final Integer MAX_QUESTIONS = 10

    def springSecurityService

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def generate() {
        List<Category> categories = params?.categories?.collect {  categoryID ->
            Category.load(categoryID)
        }
        Collection<Long> questionIds = QuizQuestion.getAllQuestionIdsFromDb(categories)
        Collections.shuffle questionIds
        List<Long> ids = questionIds.take(questionIds.size() < MAX_QUESTIONS ? questionIds.size() : MAX_QUESTIONS)
        List<QuizQuestion> questions = QuizQuestion.getAll(ids)
        render(view: '/quiz/quiz', model: [questions: questions, categoryIds: params?.categories])
    }

    def result() {
        Quiz quiz = new Quiz(params)
        quiz.contestant = (User) springSecurityService.currentUser
        Integer totalScore = 0
        quiz?.quizAnswers?.each { qa ->
            totalScore += qa?.answer?.isCorrect ? 1 : 0
        }
        quiz.score = totalScore
        quiz.save failOnError: true
        render view: '/quiz/quizResult', model: [quiz: quiz, totalScore: totalScore]
    }

    def save(Long id, Long version) {
        def quiz = id ? Quiz.get(id) : new Quiz(params)
        if (!quiz) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (quiz.version > version) {
                quiz.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'quiz.label', default: 'Quiz')] as Object[],
                        "Another user has updated this Quiz while you were editing")
                render(view: "create", model: [quiz: quiz])
                return
            }
        }

        quiz.properties = params

        if (!quiz.save(flush: true)) {
            render(view: "create", model: [quiz: quiz])
            return
        }

        flash.success = id ? message(code: 'default.updated.message', args: [message(code: 'quiz.label', default: 'Quiz'), quiz.id]) : message(code: 'default.created.message', args: [message(code: 'quiz.label', default: 'Quiz'), quiz.id])
        redirect(action: "show", id: quiz.id)
    }

    def show(Long id) {
        def quiz = Quiz.get(id)
        if (!quiz) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
            redirect(action: "list")
            return
        }

        [quiz: quiz]
    }

    def delete(Long id) {
        def quiz = Quiz.get(id)
        if (!quiz) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
            redirect(controller: 'login', action: "dashboard")
            return
        }

        try {
            quiz.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
            redirect(controller: 'login', action: "dashboard")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
            redirect(action: "show", id: id)
        }
    }
}
