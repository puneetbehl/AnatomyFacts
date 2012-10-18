package com.intelligrape.anatomyfacts

class Test {
    List<TestAnswer> testAnswers
    List<Category> categories
    Integer score
    Date dateCreated
    Date lastUpdated

    static belongsTo = [contestant: User]

    static hasMany = [testAnswers: TestAnswer, categories: Category]

    static constraints = {
    }
}
