<div class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#">Quiz History</a>
    </div>
</div>
<table class="table table-bordered table-striped table-hover">
    <thead>
    <th></th>
    <g:sortableColumn property="dateCreated" title="Date"/>
    <th>Score</th>
    </thead>
    <tbody>
    <g:each in="${quizList}" status="i" var="quiz">
        <g:form>
            <g:hiddenField name="id" value="${quiz?.id}"/>
            <tr>
                <td><a class="pull-right" href="${createLink(controller: 'quiz', action: 'delete', id: quiz?.id)}"
                       onclick="return confirm('Are you sure?');"><i class="icon-trash"></i></a></td>
                <td>
                    <g:link action="show" id="${quiz?.id}">
                        <g:formatDate date="${quiz?.dateCreated}"/>
                    </g:link>
                </td>
                <td>
                    ${quiz?.score}
                </td>
            </tr>
        </g:form>
    </g:each>
    </tbody>
</table>

<div class="pagination pagination-right">
    <g:paginate total="${quizTotal}"/>
</div>