package com.intelligrape.anatomyfacts

class Tag {
    String label
    static constraints = {
        label(blank: false, unique: true)
    }

    static mapping = {
        sort(id: 'desc')
    }

    @Override
    String toString() {
        return label
    }
}
