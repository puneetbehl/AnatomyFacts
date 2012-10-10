<%@ page import="com.intelligrape.anatomyfacts.Category" %>

<table class="table table-bordered">
    <tr>
        <td>
            <label for="name">
                <g:message code="category.name.label" default="Name"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:textField name="name" required="" value="${category?.name}"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                <g:message code="category.questions.label" default="Questions"/>
            </label>
        </td>
        <td>
            <ul class="one-to-many unstyled">
                <g:each in="${category?.questions ?}" var="q">
                    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
                </g:each>
                <li class="add">
                    <a href="#addQuestionModal" data-toggle="modal"><i
                            class="icon-plus-sign"></i>&nbsp;${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</a>
                </li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                <g:message code="category.tips.label" default="Tips"/>
            </label>
        </td>
        <td>
            <ul class="one-to-many unstyled">
                <g:each in="${category?.tips ?}" var="tip">
                    <li><g:link controller="tip" action="show" id="${tip.id}">${tip?.encodeAsHTML()}</g:link></li>
                </g:each>
                <li class="add">
                    <a href="#addTipModal" data-toggle="modal"><i class="icon-plus-sign"></i>&nbsp;${message(code: 'default.add.label',
                            args: [message(code: 'tip.label', default: 'Tip')])}</a>
                </li>
            </ul>
        </td>
    </tr>
</table>
