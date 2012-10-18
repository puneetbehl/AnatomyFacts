package com.intelligrape.anatomyfacts

class Quiz {
    List<QuizAnswer> quizAnswers
    List<Category> categories
    Date dateCreated
    Date lastUpdated
    Integer score

    static belongsTo = [contestant: User]

    static hasMany = [quizAnswers: QuizAnswer, categories: Category]

    static constraints = {
    }
}
