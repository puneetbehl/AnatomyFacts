<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Anatomy Facts</title>
    <style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }

    .sidebar-nav {
        padding: 9px 0;
    }
    </style>
</head>

<body>
<g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name:'app.name'))}"/>
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
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Installed Plugins</li>
                    <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                        <li>${plugin.name} - ${plugin.version}</li>
                    </g:each>
                    <li class="nav-header">Application Status</li>
                    <li>App version: <g:meta name="app.version"/></li>
                    <li>Grails version: <g:meta name="app.grails.version"/></li>
                    <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                    <li>JVM version: ${System.getProperty('java.version')}</li>
                    <li>ReloadiCompany 2012ng active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                </ul>

            </div>
        </div>

        <div class="span9">
            <div class="hero-unit">
                <h1>Welcome to ${appName}</h1>

                <p>Congratulations, you have successfully started ${appName} application.</p>

            </div>
        </div>
    </div>
    <hr>

    <footer>
        <p>&copy; Intelligrape Software Ltd.</p>
    </footer>
</div>
</body>
</html>







































%{--
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Anatomy Facts</title>
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
            <a class="brand" href="#">Anatomy Facts</a>

            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    Logged in as <a href="#" class="navbar-link">Username</a>
                </p>
                <ul class="nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span4">
            <div class="well sidebar-nav">

                <ul>
                    <li class="nav-header">Installed Plugins</li>
                    <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                        <li>${plugin.name} - ${plugin.version}</li>
                    </g:each>
                    <li class="nav-header">Application Status</li>
                    <li>App version: <g:meta name="app.version"/></li>
                    <li>Grails version: <g:meta name="app.grails.version"/></li>
                    <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                    <li>JVM version: ${System.getProperty('java.version')}</li>
                    <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    <li class="nav-header">Available Controllers</li>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div><!--/.well -->
        </div><!--/span-->
        <div class="span8">
            <div class="hero-unit">
                <h1>Welcome to Anatomy Facts</h1>

                <p>Congratulations, you have successfully started Anatomy Fact application</p>

                <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>
            </div>

            <div class="row-fluid">
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
            </div><!--/row-->
            <div class="row-fluid">
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
                <div class="span4">
                    <h2>Heading</h2>

                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>

                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div><!--/span-->
            </div><!--/row-->
        </div><!--/span-->
    </div><!--/row-->
    <hr>
    <footer>
        <p>&copy; Intelligrape Software Ltd. 2008</p>
    </footer>
</div><!--/.fluid-container-->
</body>
</html>
--}%
