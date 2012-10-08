class BootStrap {

    def bootstrapService

    def init = { servletContext ->
        bootstrapService.createSaveAndAssignRoleToUser()
        bootstrapService.createQuizQuestionsAndOptionsAndCategories()
        bootstrapService.createTips()
        bootstrapService.createTestQuestionAndOptions()
    }
    def destroy = {
    }
}
