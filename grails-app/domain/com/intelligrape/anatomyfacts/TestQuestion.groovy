package com.intelligrape.anatomyfacts

class TestQuestion extends Question {
    boolean answer

    static constraints = {
        tags(bindable: false)
    }

    static mapping = {
        sort(id: 'desc')
    }

    @Override
    String toString() {
        return super.toString()
    }
}