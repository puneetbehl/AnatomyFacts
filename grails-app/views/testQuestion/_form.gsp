<%@ page import="com.intelligrape.anatomyfacts.TestQuestion" %>
<table class="table table-bordered">
    <tr>
        <td>
            <label for="content">
                <g:message code="testQuestion.content.label" default="Content"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:textField class="input-xxlarge" name="content" maxlength="140" required="" value="${testQuestion?.content}"/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="answer">
                <g:message code="testQuestion.answer.label" default="Answer"/>
            </label>
        </td>
        <td>
            <label class="radio">
                <g:radio name="answer" value="true" checked="${testQuestion?.answer ? true : ''}"/>
                Yes
            </label>
            <label class="radio">
                <g:radio name="answer" value="false" checked="${testQuestion?.answer ? '' : true}"/>
                No
            </label>
        </td>
    </tr>
    <tr>
        <td>
            <label for="description">
                <g:message code="testQuestion.description.label" default="Description"/>

            </label>
        </td>
        <td>
            <g:textArea class="input-xxlarge" rows="15" cols="7" name="description" value="${testQuestion?.description}"/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="category">
                <g:message code="testQuestion.category.label" default="Category"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="category" name="category.id" from="${com.intelligrape.anatomyfacts.Category.list()}" optionKey="id" required="" value="${testQuestion?.category?.id}"
                      class="many-to-one input-xxlarge"/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="tags">
                <g:message code="testQuestion.tags.label" default="Tags"/>
            </label>
        </td>
        <td>
            <af:tagInput name="tags" id="tags" class="tags input-xxlarge" url="${createLink(controller: 'testQuestion', action: 'tags')}"/>
        </td>
    </tr>
</table>
