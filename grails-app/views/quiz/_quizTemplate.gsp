<g:each in="${questions}" var="question" status="index">
    <tr>
        <td>
            <label class="control-label">
                <strong>Question ${index + 1}:&nbsp;</strong>${question?.content}
            </label>
        </td>
    </tr>
    <g:each in="${question?.options}" var="option" status="optionNumber">
        <tr>
            <td>
                <label class="radio">
                    <g:hiddenField name="question[${index}]" value="${question}"/>
                    <g:radio name="answer[${index}]" value="${option?.value}"/>
                    ${option?.value}
                </label>
            </td>
        </tr>
    </g:each>
</g:each>
<tr>
    <td>
        <g:submitButton class="btn-block btn-large btn-info" name="submit" value="Submit"/>
    </td>
</tr>