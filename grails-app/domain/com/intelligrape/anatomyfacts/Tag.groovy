package com.intelligrape.anatomyfacts

class Tag {
    String label

    static constraints = {
        label(blank: false, size: 3..15, unique: true)
    }
}
