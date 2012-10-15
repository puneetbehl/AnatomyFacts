package com.intelligrape.anatomyfacts

class QuizAnswer {
    Question question
    Option answer
    static constraints = {
        answer(nullable: true)
    }
    static belongsTo = [quiz: Quiz]
}
