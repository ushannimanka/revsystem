<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" ng-app="hello">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Neon Admin Panel" />
  <meta name="author" content="" />

<!-- Custom CSS -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
  <script>$.noConflict();</script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neon-core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neon-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/neon-forms.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/t/dt/dt-1.10.11/datatables.min.css"/>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.min.css"/>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/dataTables.jqueryui.min.css"/>
  <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

<%--  <script src="https://cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf"></script>
  <script src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>--%>

  <script type="text/javascript" src="https://cdn.datatables.net/t/dt/dt-1.10.11/datatables.min.js"></script>


  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.js"></script>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ng-table/0.8.3/ng-table.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ng-table/0.8.3/ng-table.min.js"></script>
<%--  <script type="text/javascript" src="tableExport.js">--%>
  <%--  <script type="text/javascript" src="jquery.base64.js">
--%>


  <title>SP Dashboard</title>
  <%--<link href="css/angular-bootstrap.css" rel="stylesheet">
  <style type="text/css">
    [ng\:cloak], [ng-cloak], .ng-cloak {
      display: none !important;
    }
  </style>--%>
</head>



<body class="page-body  page-fade"  data-url="http://neon.dev">

<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

  <div class="sidebar-menu">

    <div class="sidebar-menu-inner">

      <header class="logo-env">

        <!-- logo -->
        <div class="logo">
          <a href="index.html">
            <img src="${pageContext.request.contextPath}/resources/images/bglogo.png" width="150" alt="" />
          </a>
        </div>

        <!-- logo collapse icon -->
        <div class="sidebar-collapse">
          <a href="#" class="sidebar-collapse-icon"><!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
            <i class="entypo-menu"></i>
          </a>
        </div>


        <!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
        <div class="sidebar-mobile-menu visible-xs">
          <a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
            <i class="entypo-menu"></i>
          </a>
        </div>

      </header>


      <ul id="main-menu" class="main-menu">
        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
        <li class="active opened active">
          <a href="index.html">
            <i class="entypo-gauge"></i>
            <span class="title">Dashboard</span>
          </a>
          <ul>
            <li class="active">
              <a ui-sref="upload">
                <span class="title">Service Provider Revenue</span>
              </a>
            </li></ul>
<ul>
              <li class="active">
                  <a ui-sref="history">
                      <span class="title">History</span>
                  </a>
              </li>
    </ul>

            <ul>
                <li class="active">
                    <a ui-sref="jobHistory">
                        <span class="title">Job History</span>
                    </a>
                </li>
            </ul>



            </li>
          </ul>



    </div>

  </div>

  <div class="main-content">

    <div class="row">

      <!-- Profile Info and Notifications -->
      <div class="col-md-6 col-sm-8 clearfix">

        <ul class="user-info pull-left pull-none-xsm">

          <!-- Profile Info -->
          <li class="profile-info dropdown"><!-- add class "pull-right" if you want to place this from right -->

            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${pageContext.request.contextPath}/resources/images/thumb-1@2x.png" alt="" class="img-circle" width="44" />
              admin
            </a>

            <ul class="dropdown-menu">

              <!-- Reverse Caret -->
              <li class="caret"></li>

              <!-- Profile sub-links -->
              <li>
                <a href="extra-timeline.html">
                  <i class="entypo-user"></i>
                  Edit Profile
                </a>
              </li>

              <li>
                <a href="mailbox.html">
                  <i class="entypo-mail"></i>
                  Inbox
                </a>
              </li>

              <li>
                <a href="extra-calendar.html">
                  <i class="entypo-calendar"></i>
                  Calendar
                </a>
              </li>

              <li>
                <a href="#">
                  <i class="entypo-clipboard"></i>
                  Tasks
                </a>
              </li>
            </ul>
          </li>

        </ul>









      </div>


      <!-- Raw Links -->
      <div class="col-md-6 col-sm-4 clearfix hidden-xs">

        <ul class="list-inline links-list pull-right">

          <!-- Language Selector -->


          <li class="sep"></li>



          <li class="sep"></li>

          <li>
            <a href="extra-login.html">
              Log Out <i class="entypo-logout right"></i>
            </a>
          </li>
        </ul>

      </div>

    </div>

    <hr />




    <br />

  <div ui-view ></div>




    <div class="row">

      <div class="col-sm-4">



      </div>

      <div class="col-sm-8">


    </div>










    </div>

    <!-- Footer -->
    <footer class="main">

    <%--  &copy; 2014 <strong>Neon</strong> Admin Theme by <a href="http://laborator.co" target="_blank">Laborator</a>--%>

    </footer>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
  <script src="${pageContext.request.contextPath}/resources/angularJS/libs/angular-ui-router.min.js" type="text/javascript"></script>


<!-- Imported styles on this page -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/rickshaw/rickshaw.min.css">

<!-- Bottom scripts (common) -->
<script src="${pageContext.request.contextPath}/resources/js/gsap/main-gsap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/joinable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/resizeable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neon-api.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>


<!-- Imported scripts on this page -->
<script src="${pageContext.request.contextPath}/resources/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/rickshaw/vendor/d3.v3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/rickshaw/rickshaw.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/toastr.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/neon-chat.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="${pageContext.request.contextPath}/resources/js/neon-custom.js"></script>


<!-- Demo Settings -->
<script src="${pageContext.request.contextPath}/resources/js/neon-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/angularJS/scripts/dashboard.js" type="text/javascript"></script>

  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tableExport.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.base64.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf/libs/sprintf.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf/jspdf.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jspdf/libs/base64.js"></script>


<%--<script src="${pageContext.request.contextPath}/resources/angularJS/scripts/dashboard.js"></script>--%>
</body>
</html>

