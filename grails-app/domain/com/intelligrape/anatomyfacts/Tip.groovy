package com.intelligrape.anatomyfacts

class Tip {

    String content
    Date dateCreated
    Date lastUpdated

    static belongsTo = [category: Category]
    static constraints = {
    }
}
