class BootStrap {

    def bootstrapService

    def init = { servletContext ->
        bootstrapService.createCategories()
    }
    def destroy = {
    }
}
