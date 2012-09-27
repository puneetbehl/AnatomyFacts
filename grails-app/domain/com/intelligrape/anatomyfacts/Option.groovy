package com.intelligrape.anatomyfacts

class Option {
    String value
    boolean isCorrect

    static constraints = {
        value(nullable: false, blank: false, size: 1..15)
    }

    @Override
    String toString() {
        return value
    }
}
