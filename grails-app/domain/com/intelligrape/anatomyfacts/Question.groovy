package com.intelligrape.anatomyfacts

abstract class Question {
    String content
    String description
    Date dateCreated
    Date lastUpdated
    List<Tag> tags

    static belongsTo = [category: Category]
    static hasMany = [tags: Tag]

    static mapping = {
        sort(id: 'desc')
        content type: 'text'
        description type: 'text'
    }

    static constraints = {
        content(nullable: false, blank: false, size: 1..140)
        category(nullable: false)
        tags(nullable: true, blank: true)
    }

    @Override
    String toString() {
        return content
    }
}