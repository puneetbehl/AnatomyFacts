package com.intelligrape.anatomyfacts

class TestQuestion extends Question {
    boolean answer

    static constraints = {
        tags(bindable: false)
    }

    @Override
    String toString() {
        return super.toString()
    }
}