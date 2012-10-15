package com.intelligrape.anatomyfacts

class TestQuestion extends Question {
    boolean answer

    static constraints = {
        tags(bindable: false)
    }

    static mapping = {
        sort(id: 'desc')
    }

    public static Collection<Long> getAllQuestionIdsFromDb(List<Category> categories) {
        Collection<Long> questionIds = (TestQuestion.createCriteria().list {
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