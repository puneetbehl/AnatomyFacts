package com.intelligrape.anatomyfacts

class Option {
    String value
    boolean isCorrect

    static constraints = {
        value(nullable: false, blank: false, size: 1..30)
    }

    static mapping = {
        sort id: "desc"
    }

    @Override
    String toString() {
        return value
    }
}
