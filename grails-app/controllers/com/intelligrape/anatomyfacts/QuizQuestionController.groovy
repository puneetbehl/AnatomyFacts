package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class QuizQuestionController {

    def scaffold = true

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

        quizQuestion.properties = params
        quizQuestion.options.eachWithIndex { option, index ->
            option?.isCorrect = params["options[$index]"].isCorrect?params["options[$index]"].isCorrect:false
        }
        if (!quizQuestion.save(flush: true)) {
            render(view: "create", model: [quizQuestion: quizQuestion])
            return
        }

        if (id) {
            flash.success = message(code: 'default.updated.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), quizQuestion.id])
        } else {
            flash.success = message(code: 'default.created.message', args: [message(code: 'quizQuestion.label', default: 'QuizQuestion'), quizQuestion.id])
        }
        redirect(action: "show", id: quizQuestion.id)
    }
}
