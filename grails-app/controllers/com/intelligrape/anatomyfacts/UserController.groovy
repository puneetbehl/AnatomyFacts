package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userList: User.list(params), userTotal: User.count()]
    }

    def create(Long id) {
        def user = id ? User.get(id) : new User(params)
        if (!user) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }else{
            [user: user]
        }
    }

    def save(Long id, Long version) {
        def user = id ? User.get(id) : new User(params)
        if (!user) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'user.label', default: 'User')] as Object[],
                        "Another user has updated this User while you were editing")
            render(view: "create", model: [user: user])
            return
            }
        }

        user.properties = params

        if (!user.save(flush: true)) {
            render(view: "create", model: [user: user])
            return
        }

        if(id){
            flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        }else{
            flash.success = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        }
        redirect(action: "show", id: user.id)
    }

    def show(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [user: user]
    }

    def delete(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            user.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
