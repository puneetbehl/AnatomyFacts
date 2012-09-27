package com.intelligrape.anatomyfacts

class TestQuestion extends Question {

    static constraints = {
        options(minSize: 2, maxSize: 2, nullable: false)
    }

    @Override
    String toString() {
        return super.toString()
    }
}
