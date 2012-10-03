<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Index</title>
</head>

<body>
<g:set var="appName" value="${grails.util.GrailsNameUtils.getNaturalName(g.meta(name: 'app.name'))}" scope="page"/>
<div class="row-fluid">
    <div class="span9">
        <div class="hero-unit">
            <h1>Welcome to ${appName}</h1>

            <p>Congratulations, you have successfully started ${appName} application.</p>

            <div class="form-horizontal">
                <a class="btn btn-primary" href="http://grails.org/doc/latest/">Learn Grails &raquo;</a>
                <a class="btn btn-primary" href="http://twitter.github.com/bootstrap/">Learn Bootstrap &raquo;</a>
            </div>

        </div>
    </div>

    <div class="span3">
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle btn btn-info" data-toggle="collapse" data-parent="#accordion2" href="#application-status">
                        Application Status
                    </a>
                </div>

                <div id="application-status" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <ul class="unstyled">
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
            </div>

            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle btn btn-info" data-toggle="collapse" data-parent="#accordion2" href="#installed-plugins">
                        Installed-Plugins
                    </a>
                </div>

                <div id="installed-plugins" class="accordion-body collapse">
                    <div class="accordion-inner">
                        <ul class="unstyled">
                            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                <li>${plugin.name} - ${plugin.version}</li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>