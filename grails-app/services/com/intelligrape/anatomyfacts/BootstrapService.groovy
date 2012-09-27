package com.intelligrape.anatomyfacts

class BootstrapService {
    def fakerService

    def createCategories() {
          20.times {
              new Category(name: fakerService.name()).save(failOnError: true)
          }
    }
}
