package com.intelligrape.anatomyfacts

class QuizController {

    public static final Integer TOTAL_NO_OF_QUESTIONS = 50

    def index() { }

    def generateQuiz() {
        final Integer TOTAL_CATEGORIES = params?.categories?.size()
        Collection<QuizQuestion> questions = []
        params?.categories?.each {  categoryID ->
            Category category = Category.load(categoryID)
            questions.addAll(QuizQuestion.findAllByCategory(category, [max: TOTAL_NO_OF_QUESTIONS / TOTAL_CATEGORIES]))
        }
        render(view: '/quiz/quiz', model: [questions: questions])
    }

    def calculateResult() {

    }
}
