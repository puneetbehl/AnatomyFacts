<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>

<sec:ifNotLoggedIn>
    <g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
    <g:set var="config" value="${SpringSecurityUtils.securityConfig}"/>
    <g:set var="postUrl" value="${request.contextPath}${config.apf.filterProcessesUrl}"/>
    <g:set var="rememberMeParameter" value="${config.rememberMe.parameter}"/>
    <g:if test="${flash.registrationSuccess}">
        <div class="row-fluid">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.registerationSuccess}
            </div>
        </div>
    </g:if>

    <div class="span9">
        <div class="row">
            <g:render template="/login/loginForm"/>
        </div>

        <div class="row">
            <g:render template="/login/registerationForm"/>
        </div>
    </div>
    <g:render template="/login/forgotPasswordModal"/>
</sec:ifNotLoggedIn>
<script type="text/javascript">

    $(document).ready(function () {
        $('.myform').css('margin-bottom', '20px');
        $('.forgot_password_form').css('margin', '0px 0px');
    });
</script>
</body>
</html>