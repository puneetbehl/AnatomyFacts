<form action='${postUrl}' method='POST' id='loginForm' class='well well-small span4 offset8' autocomplete='off'>
    <legend>Login</legend>
    <label for="">
        <g:textField class="text_" name="j_username" id="username" placeholder="Username / Email"/>
    </label>
    <label for="">
        <g:passwordField class="text_" name="j_password" id="password" placeholder="Password"/>
    </label>
    <label for="">

        <g:checkBox name="${rememberMeParameter}" id='remember_me'/>
        <small>Remember me</small> - <a href="#forgotPassword" data-toggle="modal"><small>Forgot Password?</small></a>
    </label>

    <g:submitButton name="login" value="Login" class="btn btn-primary inline"/>
</form>