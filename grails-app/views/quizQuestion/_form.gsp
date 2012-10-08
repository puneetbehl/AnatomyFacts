<%@ page import="com.intelligrape.anatomyfacts.QuizQuestion" %>



<table class="table table-bordered">

    <tr>
        <td>
            <label for="content">
                Question
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:textField class="input-xxlarge" name="content" maxlength="140" required="" value="${quizQuestion?.content}" placeholder="Enter your question content here"/>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Options
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <div class="control-group">
                <input name="options[0].value" type="text" class="inline" placeholder="Option" value="${quizQuestion?.id ? quizQuestion?.options[0]?.value : ''}">
                <g:checkBox name="options[0].isCorrect" class="option" checked="${quizQuestion?.id ? quizQuestion?.options[0]?.isCorrect : false}"/>
            </div>

            <div class="control-group">
                <input name="options[1].value" type="text" class="inline" placeholder="Option" value="${quizQuestion?.id ? quizQuestion?.options[1]?.value : ''}">
                <g:checkBox name="options[1].isCorrect" class="option" checked="${quizQuestion?.id ? quizQuestion?.options[1]?.isCorrect : false}"/>
            </div>

            <div class="control-group">
                <input name="options[2].value" type="text" class="inline" placeholder="Option" value="${quizQuestion?.id ? quizQuestion?.options[2]?.value : ''}">
                <g:checkBox name="options[2].isCorrect" class="option" checked="${quizQuestion?.id ? quizQuestion?.options[2]?.isCorrect : false}"/>
            </div>

            <div class="control-group">
                <input name="options[3].value" type="text" class="inline" placeholder="Option" value="${quizQuestion?.id ? quizQuestion?.options[3]?.value : ''}">
                <g:checkBox name="options[3].isCorrect" class="option" checked="${quizQuestion?.id ? quizQuestion?.options[3]?.isCorrect : false}"/>
            </div>

            <div>
                <i>* Mark one as answer</i>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <label for="description">
                <g:message code="quizQuestion.description.label" default="Description"/>
            </label>
        </td>
        <td>
            <g:textArea class="input-xxlarge" cols="15" rows="7" name="description" value="${quizQuestion?.description}" placeholder="Describe your answer..."/>
        </td>
    </tr>
    ${fromContext}
    <g:if test="${fromContext}">
        <g:hiddenField name="fromContext" value="${fromContext}"/>
        <g:hiddenField name="category.id" value="${category?.id}"/>
    </g:if>
    <g:else>
        <tr>
            <td>
                <label for="category">
                    Category
                    <span class="required-indicator">*</span>
                </label>
            </td>
            <td>
                <g:select id="category" name="category.id" from="${com.intelligrape.anatomyfacts.Category.list()}" optionKey="id" required="" value="${quizQuestion?.category?.id}"
                          class="input-xxlarge many-to-one"/>
            </td>

        </tr>
    </g:else>
    <tr>
        <td>
            <label for="tags">
                Tags
            </label>
        </td>
        <td>
            <g:textField name="tags" class="tags" value="${quizQuestion?.tags ? quizQuestion?.tags?.join(',') : ''}" onkeypress="getSimilarTagsFromDB()"/>
        </td>
    </tr>
</table>

