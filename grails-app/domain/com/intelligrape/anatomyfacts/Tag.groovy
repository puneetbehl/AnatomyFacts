package com.intelligrape.anatomyfacts

class Tag {
    String label
    static constraints = {
        label(blank: false, unique: true, size: 30)
    }

    @Override
    String toString() {
        return label
    }
}
