<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
    <title>${appName} | <g:layoutTitle/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tagsinput.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}"/>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.8.0.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.tagsinput.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'application.js')}"></script>
    <g:layoutHead/>
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/">${appName}</a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><g:link controller="category" action="list">Category</g:link></li>
                    <li><g:link controller="quizQuestion" action="list">Quiz Question</g:link></li>
                    <li><g:link controller="testQuestion" action="list">Test Question</g:link></li>
                    <li><a href="#generateQuiz" data-toggle="modal">Quiz</a></li>
                    <li><g:link controller="tip" action="list">Tip</g:link></li>
                </ul>
                <sec:ifLoggedIn>
                    <ul class="pull-right nav">
                        <li>
                            <p class="navbar-text pull-right" id="loginMessgae">
                                Logged in as <sec:loggedInUserInfo field="username"/>
                            </p>
                        </li>
                        <li class="divider-vertical"></li>
                        <li><g:link controller="logout">Logout</g:link></li>
                    </ul>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <g:set var="config" value="${SpringSecurityUtils.securityConfig}"/>
                    <form action='${request.contextPath}${config.apf.filterProcessesUrl}' method='POST' id='loginForm' autocomplete='off'
                          class="form-inline navbar-form pull-right cssForm">
                        <div class="input-prepend">
                            <span class="add-on">@</span>
                            <input type='text' class='text_ span2 input-small' name='j_username' id='username' placeholder="Username"/>
                        </div>
                        <input type='password' class='text_ input-small' name='j_password' id='password' placeholder="Password"/>
                        <button type="submit" class="btn btn-inverse">Sign in</button>
                    </form>
                </sec:ifNotLoggedIn>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <g:if test="${flash.message}">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            ${flash.message}
        </div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            ${flash.error}
        </div>
    </g:if>
    <g:if test="${flash.success}">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            ${flash.success}
        </div>
    </g:if>
    <g:layoutBody/>
</div>

<div class="modal hide fade in" id="generateQuiz" tabindex="-1" role="dialog" aria-labelledby="generateQuizLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="generateQuizModalLabel">Generate Quiz</h3>
    </div>

    <g:form class="form-horizontal tip_form" controller="quiz" action="generateQuiz">
        <div class="modal-body">
            <af:categories/>
        </div>

        <div class="modal-footer">
            <g:submitButton name="generate" class="btn btn-info" value="${message(code: 'default.button.generate.label', default: 'Generate')}"/>
            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </g:form>
</div>


<footer>
    <div class="navbar">
        <hr/>
        <a href="http://www.intelligrape.com">&copy;&nbsp;Intelligrape Software Ltd.</a>
    </div>
</footer>
<script type="text/javascript">
    var urls = {
        tags_autocomplete_url:"${createLink(controller: 'tag', action: 'tags')}"
    }
</script>
</body>
</html>
