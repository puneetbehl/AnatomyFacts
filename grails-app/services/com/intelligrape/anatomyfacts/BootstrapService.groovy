package com.intelligrape.anatomyfacts

class BootstrapService {
    def fakerService

    def createTips() {
        List<Category> categories = Category.list()
        for (category in categories) {
            new Tip(content: fakerService.sentence(10), category: category).save(failOnError: true)
        }
    }

    def createQuizQuestionsAndOptionsAndCategories() {
        Option option
        Category category
        50.times {
            List<Option> options = []
            3.times {
                option = new Option(value: fakerService.word().replace(',', ''), isCorrect: false)
                option.save(failOnError: true)
                options << option
            }
            option = new Option(value: fakerService.word().replace(',', ''), isCorrect: true)
            option.save(failOnError: true)
            options << option
            category = new Category(name: fakerService.name())
            category.save(failOnError: true)
            new QuizQuestion(
                    content: fakerService.sentence(10),
                    description: fakerService.paragraph(15),
                    options: options,
                    category: category
            ).save(failOnError: true)
        }
    }

    def createTestQuestionAndOptions() {
        List<Category> categories = Category.list()
        Option option
        List<Tag> tags = []
        5.times {
            Tag tag = new Tag(label: fakerService.name())
            tags << tag
        }
        for (category in categories) {
            List<Option> options = []
            option = new Option(value: fakerService.word().replace(',', ''), isCorrect: true)
            option.save(failOnError: true)
            options << option
            option = new Option(value: fakerService.word().replace(',', ''), isCorrect: false)
            option.save(failOnError: true)
            options << option
            new TestQuestion(
                    content: fakerService.sentence(8),
                    description: fakerService.paragraph(10),
                    options: options,
                    category: category,
                    tags: tags
            ).save(failOnError: true)
        }
    }
}
