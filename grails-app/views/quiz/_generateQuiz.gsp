<div class="modal hide fade in" id="generateQuiz" tabindex="-1" role="dialog" aria-labelledby="generateQuizLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="generateQuizModalLabel">Generate Quiz</h3>
    </div>

    <g:form class="form-horizontal tip_form" controller="quiz" action="generate">
        <div class="modal-body">
            <af:categories/>
        </div>

        <div class="modal-footer">
            <g:submitButton name="generate" class="btn btn-info" value="${message(code: 'default.button.generate.label', default: 'Generate')}"/>
            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </g:form>
</div>