package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class QuizQuestionController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [quizQuestionList: QuizQuestion.list(params), quizQuestionTotal: QuizQuestion.count()]
    }

    def create(Long id) {
        def quizQuestion = id ? QuizQuestion.get(id) : new QuizQuestion(params)
        if (!quizQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "list")
        } else {
            [quizQuestion: quizQuestion]
        }
        if (params?.fromContext)
            render view: "/quizQuestion/create", model: ['category.id': params?.category?.id, 'fromContext': params?.fromContext]
    }

    def save(Long id, Long version) {
        def quizQuestion = id ? QuizQuestion.get(id) : new QuizQuestion(params)
        if (!quizQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (quizQuestion.version > version) {
                quizQuestion.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'quizQuestion.label', default: 'QuizQuestion')] as Object[],
                        "Another user has updated this QuizQuestion while you were editing")
                render(view: "create", model: [quizQuestion: quizQuestion])
                return
            }
        }
        collectTagsFromParams(quizQuestion)
        quizQuestion?.properties = params

        quizQuestion?.options?.eachWithIndex { option, index ->
            option?.isCorrect = params["options[$index]"]?.isCorrect ? true : false
        }
        if (!quizQuestion.save(flush: true)) {
            render(view: "create", model: [quizQuestion: quizQuestion])
            return
        }

        flash.success = id ? message(code: 'default.updated.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), quizQuestion.id]) :
            message(code: 'default.created.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), quizQuestion.id])
        if (params?.fromContext) {
            flash.success = "Question added successfully"
        }
        String action = params?.fromContext ? "show" : "create"
        String controller = params?.fromContext ? "category" : "quizQuestion"
        redirect(controller: controller, action: action)
    }

    def show(Long id) {
        def quizQuestion = QuizQuestion.get(id)
        if (!quizQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "list")
            return
        }

        [quizQuestion: quizQuestion]
    }

    def delete(Long id) {
        def quizQuestion = QuizQuestion.get(id)
        if (!quizQuestion) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "list")
            return
        }

        try {
            quizQuestion.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), id])
            redirect(action: "show", id: id)
        }
    }

    private void collectTagsFromParams(QuizQuestion quizQuestion) {
        quizQuestion.tags = params?.tags ? params?.tags?.split(',')?.collect { label ->
            Tag existingTag = Tag.findByLabel(label)
            Tag tag = existingTag ? existingTag : new Tag(label: label)
            return tag
        } : []
    }
}
