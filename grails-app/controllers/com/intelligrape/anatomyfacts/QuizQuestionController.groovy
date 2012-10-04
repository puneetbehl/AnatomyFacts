package com.intelligrape.anatomyfacts

class QuizQuestionController {

    def scaffold = QuizQuestion

    def save() {
        QuizQuestion question = new QuizQuestion(params)
        if (question.save(failOnError: true))
            flash.success = "Question <a href='${createLink(controller:'quizQuestion', action:'show', id:"${question.id}")}'>${question.id}</a> saved successfully"
        redirect(action: 'create')
    }
}
