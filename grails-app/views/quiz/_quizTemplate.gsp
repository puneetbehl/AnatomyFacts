<g:each in="${questions}" var="question" status="index">
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <td>
                <label class="control-label">
                    <g:hiddenField name="question.${index}.question" value="${question?.id}"/>
                    <strong>Question ${index + 1}:&nbsp;</strong>${question?.content}
                </label>
            </td>
        </tr>
        <g:each in="${question?.options}" var="option" status="optionNumber">
            <tr>
                <td>
                    <label class="radio">
                        <g:radio name="question.${index}.answer" value="${option?.id}"/>
                        ${option?.value}
                    </label>
                </td>
            </tr>
        </g:each>
    </table>
</g:each>
<ul class="pager">
    <li class="previous">
        <a href="#">Older</a>
    </li>
    <li class="next">
        <a href="#">Newer</a>
    </li>
</ul>
<tr>
    <td>
        <g:submitButton class="btn-block btn-large btn-info" name="submit" value="Submit"/>
    </td>
</tr>