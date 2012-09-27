package com.intelligrape.anatomyfacts

class Category {

    String name
    Date dateCreated
    Date lastUpdated

    static hasMany = [questions: Question, tips: Tip]
    static constraints = {
        name(size: 1..25, nullable: false, blank: false)
    }

    @Override
    public String toString() {
        return name
    }
}
