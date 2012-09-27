<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
    <title>${appName} | <g:layoutTitle/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/custom.css"/>
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/bootstrap-responsive.css"/>
    <script type="text/javascript" src="/js/jquery-1.8.0.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/application.js"></script>
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
                %{-- <p class="navbar-text pull-right">
                    Logged in as <a href="#" class="navbar-link">${session.email}</a>
                </p>--}%
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#controllers">
                            Controllers
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="controllersMenu">
                            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
                            </g:each>
                        </ul>
                    </li>
                </ul>

                <form action="#" class="form-inline navbar-form pull-right">
                    <div class="input-prepend">
                        <span class="add-on">@</span><input name="email" class="span2 input-small" id="prependedInput" size="16" type="text" placeholder="Username">
                    </div>
                    <input name="password" type="password" class="input-small" placeholder="Password">
                    <button type="submit" class="btn btn-inverse">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
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
    <hr>
    <footer>
        <p>&copy; Intelligrape Software Ltd.</p>
    </footer>
</div>

</body>
</html>
