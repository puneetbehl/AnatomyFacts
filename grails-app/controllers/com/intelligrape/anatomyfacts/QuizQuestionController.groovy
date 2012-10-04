package com.intelligrape.anatomyfacts

class QuizQuestionController {

    def scaffold = QuizQuestion

    def save() {
        QuizQuestion question = new QuizQuestion(params)
        if (question.save(failOnError: true))
            flash.success = "<a href='${createLink(controller:'quizQuestion', action:'show', id:"${question.id}")}'>${question.id}</a> saved successfully"
        redirect(action: 'create')
    }

    private List<Option> getOptionsFromParams(params) {
        return params.option.findAll {!it.key.contains(".")}.collect {
            return new Option(it.value as Map)
        } as List
    }
}
