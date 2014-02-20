<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <title><g:layoutTitle default="Nome da Aplicação"/></title>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/todo/css/bootstrap.css" />
    <g:layoutHead/>
    <r:layoutResources />
  </head>
  <body>
    <nav class="navbar navbar-static-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <g:link class="navbar-brand" >Todo</g:link>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="divider"></li>
            <li class="dropdown ${params.controller in ['controlador1','controlador2'] ? 'active' : ''}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-folder-open"></i>  Cadastros <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li class="${params.controller  == 'projeto' ? 'active' : ''}">
                  <g:link controller="projeto">Projetos</g:link>
                </li>
                <li class="${params.controller  == 'tarefa' ? 'active' : ''}">
                  <g:link controller="tarefa">Tarefas</g:link>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <g:layoutBody/>
        </div>
      </div>
      <hr>
      <footer>
        <p>&copy; Todo</p>
      </footer>
    </div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:javascript src="jquery.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="application.js" />
    <r:layoutResources />
  </body>
</html>
