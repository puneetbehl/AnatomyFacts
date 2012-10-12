<div class="modal hide fade in" id="forgotPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="myModalLabel">Forgot Password?</h3>
    </div>
    <g:form class="form-horizontal forgot_password_form" controller="login" action="auth" style="margin: 0px 0px">
        <div class="modal-body">
            <div class="control-group">
                <label for="email" class="control-label">Email</label>

                <div class="controls">
                    <g:textField name="email" placeholder="Email" class="input-xlarge"/>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>
            <g:submitButton name="submit" value="Submit" class="btn btn-primary"/>
        </div>
    </g:form>
</div>