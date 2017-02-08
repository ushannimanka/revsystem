<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: y2ksh
  Date: 10/15/2015
  Time: 12:47 AM
  To change this template use SPhelper | Settings | SPhelper Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
  <!-- BEGIN HEADER INNER -->
  <div class="page-header-inner">
    <!-- BEGIN LOGO -->
    <div class="page-logo">
      <a href="/">
        <%--<img src="resources/assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/>--%>
      </a>
      <div class="menu-toggler sidebar-toggler hide">
      </div>
    </div>
    <!-- END LOGO -->
    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
    <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
    </a>
    <!-- END RESPONSIVE MENU TOGGLER -->
    <!-- BEGIN TOP NAVIGATION MENU -->
    <div class="top-menu">
      <ul class="nav navbar-nav pull-right">
        <!-- BEGIN NOTIFICATION DROPDOWN -->
        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
        <%--<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">--%>
          <%--<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">--%>
            <%--<i class="icon-bell"></i>--%>
					<%--<span class="badge badge-default">--%>
					<%--7 </span>--%>
          <%--</a>--%>
          <%--<ul class="dropdown-menu">--%>
            <%--<li class="external">--%>
              <%--<h3><span class="bold">12 pending</span> notifications</h3>--%>
              <%--<a href="extra_profile.html">view all</a>--%>
            <%--</li>--%>
            <%--<li>--%>
              <%--<ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">just now</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-success">--%>
									<%--<i class="fa fa-plus"></i>--%>
									<%--</span>--%>
									<%--New user registered. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">3 mins</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-danger">--%>
									<%--<i class="fa fa-bolt"></i>--%>
									<%--</span>--%>
									<%--Server #12 overloaded. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">10 mins</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-warning">--%>
									<%--<i class="fa fa-bell-o"></i>--%>
									<%--</span>--%>
									<%--Server #2 not responding. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">14 hrs</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-info">--%>
									<%--<i class="fa fa-bullhorn"></i>--%>
									<%--</span>--%>
									<%--Application error. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">2 days</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-danger">--%>
									<%--<i class="fa fa-bolt"></i>--%>
									<%--</span>--%>
									<%--Database overloaded 68%. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">3 days</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-danger">--%>
									<%--<i class="fa fa-bolt"></i>--%>
									<%--</span>--%>
									<%--A user IP blocked. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">4 days</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-warning">--%>
									<%--<i class="fa fa-bell-o"></i>--%>
									<%--</span>--%>
									<%--Storage Server #4 not responding dfdfdfd. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">5 days</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-info">--%>
									<%--<i class="fa fa-bullhorn"></i>--%>
									<%--</span>--%>
									<%--System Error. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                  <%--<a href="javascript:;">--%>
                    <%--<span class="time">9 days</span>--%>
									<%--<span class="details">--%>
									<%--<span class="label label-sm label-icon label-danger">--%>
									<%--<i class="fa fa-bolt"></i>--%>
									<%--</span>--%>
									<%--Storage server failed. </span>--%>
                  <%--</a>--%>
                <%--</li>--%>
              <%--</ul>--%>
            <%--</li>--%>
          <%--</ul>--%>
        <%--</li>--%>
        <!-- END NOTIFICATION DROPDOWN -->

        <!-- BEGIN USER LOGIN DROPDOWN -->
        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
        <li class="dropdown dropdown-user">
          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <img alt="" class="img-circle" src="${pageContext.request.contextPath}/resources/assets/admin/layout/img/avatar.png"/>
					<span class="username username-hide-on-mobile">
                      ${userName} </span>
            <i class="fa fa-angle-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-menu-default">
            <%--<li>--%>
              <%--<a href="extra_profile.html">--%>
                <%--<i class="icon-user"></i> My Profile </a>--%>
            <%--</li>--%>


            <li class="divider">
            </li>
              <li>
                <a ui-sref="userSettings">
                  <i class="icon-settings"></i> Settings </a>
              </li>
            <li>
              <a href="logout">
                <i class="icon-key"></i> Log Out </a>
            </li>

          </ul>
        </li>
        <!-- END USER LOGIN DROPDOWN -->
        <!-- BEGIN QUICK SIDEBAR TOGGLER -->
        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
        <li class="dropdown dropdown-quick-sidebar-toggler">



          <a href="logout" class="dropdown-toggle">
            <i class="icon-logout"></i>
          </a>
        </li>
        <!-- END QUICK SIDEBAR TOGGLER -->
      </ul>
    </div>
    <!-- END TOP NAVIGATION MENU -->
  </div>
  <!-- END HEADER INNER -->
</div>


<!-- END HEADER -->

