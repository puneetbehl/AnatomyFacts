package com.intelligrape.anatomyfacts

import org.springframework.dao.DataIntegrityViolationException

class TipController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipList: Tip.list(params), tipTotal: Tip.count()]
    }

    def create(Long id) {
        def tip = id ? Tip.get(id) : new Tip(params)
        if (!tip) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "list")
        } else {
            [tip: tip]
        }
    }

    def save(Long id, Long version) {
        def tip = id ? Tip.get(id) : new Tip(params)
        if (!tip) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tip.version > version) {
                tip.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'tip.label', default: 'Tip')] as Object[],
                        "Another user has updated this Tip while you were editing")
                render(view: "create", model: [tip: tip])
                return
            }
        }

        tip.properties = params

        if (!tip.save(flush: true)) {
            render(view: "create", model: [tip: tip])
            return
        }

        if (id) {
            flash.success = message(code: 'default.updated.message', args: [message(code: 'tip.label', default: 'Tip'), tip.id])
        } else {
            flash.success = message(code: 'default.created.message', args: [message(code: 'tip.label', default: 'Tip'), tip.id])
        }

        if (params?.fromContext)
            flash.success="Tip successfully added"
        String controller = params?.fromContext ? "category" : "tip"
        String action = params?.fromContext ? "show" : "create"
        redirect(action: action, controller: controller, id: "${params?.fromContext ? params?.category.id : ''}")
    }

    def show(Long id) {
        def tip = Tip.get(id)
        if (!tip) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "list")
            return
        }

        [tip: tip]
    }

    def delete(Long id) {
        def tip = Tip.get(id)
        if (!tip) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "list")
            return
        }

        try {
            tip.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'tip.label', default: 'Tip'), id])
            redirect(action: "show", id: id)
        }
    }
}
