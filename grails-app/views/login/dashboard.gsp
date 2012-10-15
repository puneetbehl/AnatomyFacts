<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout"/>
    <title></title>
</head>

<body>
<div class="row-fluid">
    <div class="span3">
        <g:render template="/quiz/list"/>
    </div>

    <div class="span3">
        <g:render template="/test/list"/>
    </div>
</div>
</body>
</html>