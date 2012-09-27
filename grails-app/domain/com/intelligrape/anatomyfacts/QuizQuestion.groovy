package com.intelligrape.anatomyfacts

class QuizQuestion extends Question {

    static constraints = {
        options(minSize: 4, maxSize: 4, nullable: false)
    }

    @Override
    String toString() {
        return super.toString()
    }
}
