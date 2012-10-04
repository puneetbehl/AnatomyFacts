package com.intelligrape.anatomyfacts

class Option {
    String value
    boolean isCorrect

    static constraints = {
        value(nullable: false, blank: false, size: 1..15)
    }

    static mapping = {
        sort id: "desc"
    }

    @Override
    String toString() {
        return value
    }
}
