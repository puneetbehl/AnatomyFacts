package com.intelligrape.anatomyfacts

class QuizQuestion extends Question {
    List<Option> options

    static hasMany = [options: Option]
    static constraints = {
        options(minSize: 4, maxSize: 4, nullable: false)
        tags(bindable: false)
    }

    static mapping = {
        sort(id: 'desc')
    }

    public static Collection<Long> getAllQuestionIdsFromDb(List<Category> categories) {
        Collection<Long> questionIds = (QuizQuestion.createCriteria().list {
            projections {
                property("id")
            }
            if (categories) {
                inList('category', categories)
            }
        })
        questionIds
    }

    @Override
    String toString() {
        return super.toString()
    }
}
