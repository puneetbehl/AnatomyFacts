class BootStrap {

    def bootstrapService

    def init = { servletContext ->
        bootstrapService.createQuizQuestionsAndOptionsAndCategories()
        bootstrapService.createTips()
        bootstrapService.createTestQuestionAndOptions()
    }
    def destroy = {
    }
}
