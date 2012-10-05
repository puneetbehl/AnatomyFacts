package com.intelligrape.anatomyfacts

class Tag {
    String label
    static constraints = {
        label(blank: false)
    }

    @Override
    String toString() {
        return label
    }
}
