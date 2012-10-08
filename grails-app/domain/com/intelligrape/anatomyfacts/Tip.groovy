package com.intelligrape.anatomyfacts

class Tip {

    String content
    Date dateCreated
    Date lastUpdated

    static belongsTo = [category: Category]
    static mapping = {
        content type: 'text'
        sort(id: 'desc')
    }
    static constraints = {
        content(maxSize: 200, nullable: false, blank: false)
        category(nullable: false)
    }
}
