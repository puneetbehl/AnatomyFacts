<thead>
<th>Question #</th>
<th>Answer</th>
<th>Is Correct</th>
<th>Score</th>
</thead>
<g:each in="${quizAnswers}" var="quizAnswer" status="index">
    <tr>
        <td>${index+1}</td>
        <td>${quizAnswer?.answer?.value}</td>
        <td><g:formatBoolean boolean="${quizAnswer?.answer?.isCorrect}"/></td>
        <td>
            <g:if test="${quizAnswer?.answer?.isCorrect}">1</g:if>
            <g:else>0</g:else>
        </td>
    </tr>
</g:each>
<tr>
    <td colspan="3">Total Score</td>
    <td>${totalScore}</td>
</tr>