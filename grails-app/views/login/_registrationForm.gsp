<g:form controller="login" action="register" class="well well-small span4 offset8 form-horizontal">
    <g:hiddenField name="username" value=""/>
    <legend><strong>New?</strong> Sign up</legend>
        <label for="fullName">
            <g:textField name="fullName" placeholder="Full name"/>
        </label>
    <label for="email">
        <g:textField name="email" placeholder="Email" onkeypress="loadUsername()"/>
    </label>
    <label for="password">
        <g:passwordField name="password" placeholder="Password"/>
    </label>
    <g:submitButton name="register" value="Register" class="btn btn-primary"/>
</g:form>
<script type="text/javascript">
    function loadUsername() {
        $('input[name=username]').val((function () {
            var value = $('input[name=email]').val().split("@")
            return value[0]
        }))
    }
</script>