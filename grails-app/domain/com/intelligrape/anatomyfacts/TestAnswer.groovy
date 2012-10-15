package com.intelligrape.anatomyfacts

class TestAnswer {
    Question question
    boolean answer

    static constraints = {
    }

    static belongsTo = [test: Test]
}
