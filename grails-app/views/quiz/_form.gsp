<g:each in="${questions}" var="question" status="index">
    <div class="questions" id="${index}">
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <td>
                    <label class="control-label">
                        <g:hiddenField name="quizAnswers[${index}].question.id" value="${question?.id}"/>
                        <strong>Question ${index + 1}:&nbsp;</strong>${question?.content}
                    </label>
                </td>
            </tr>
            <g:each in="${question?.options}" var="option" status="optionNumber">
                <tr>
                    <td>
                        <label class="radio">
                            <g:radio name="quizAnswers[${index}].answer.id" value="${option?.id}"/>
                            ${option?.value}
                        </label>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</g:each>
<g:if test="${categoryIds}">
    <div style="display:none;">
        <g:each in="${categoryIds}" var="id">
            <g:hiddenField name="categories" value="${id}"/>
        </g:each>
    </div>
</g:if>
<ul class="pager">
    <li class="previous">
        <a href="#" onclick="prevQuestion()">Previous</a>
    </li>
    <li class="next">
        <a href="#" onclick="nextQuestion()">Next</a>
    </li>
</ul>
<tr>
    <td>
        <g:submitButton class="btn-block btn-large btn-info" name="submit" value="Submit"/>
    </td>
</tr>