package com.intelligrape.anatomyfacts

abstract class Question {
    String content
    String description
    List<Option> options
    Date dateCreated
    Date lastUpdated

    static belongsTo = [category: Category]
    static hasMany = [options: Option]

    static constraints = {
        content(nullable: false, blank: false, size: 1..140)
        category(nullable: false)
    }

    @Override
    String toString() {
        return content
    }
}
