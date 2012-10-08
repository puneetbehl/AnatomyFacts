package com.intelligrape.anatomyfacts

class QuizQuestion extends Question {
    List<Option> options

    static hasMany = [options: Option]
    static constraints = {
        options(minSize: 4, maxSize: 4, nullable: false)
        tags(bindable: false)
    }

    @Override
    String toString() {
        return super.toString()
    }
}
