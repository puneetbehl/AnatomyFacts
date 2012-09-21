package com.intelligrape.anatomyfacts

class Option {
    String value
    boolean isCorrect

    static constraints = {
    }

    @Override
    String toString() {
        return value
    }
}
