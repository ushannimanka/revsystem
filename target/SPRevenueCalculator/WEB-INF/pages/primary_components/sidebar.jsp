<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: y2ksh
  Date: 10/15/2015
  Time: 1:00 AM
  To change this template use SPhelper | Settings | SPhelper Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
  <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
  <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
  <div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <ul class="page-sidebar-menu page-sidebar-menu-light" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
      <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
      <li class="sidebar-toggler-wrapper">
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        <div class="sidebar-toggler" style="margin-bottom: 15px">
        </div>
        <!-- END SIDEBAR TOGGLER BUTTON -->
      </li>



      <!-- start of main section -->

      <li  data-ng-class="{'start active open' : isActive('/dashboard')}" >


        <a href="#/" >
          <i class="icon-home"></i>
          <span class="title">Dashboard</span>


              <span  data-ng-if="isActive('/dashboard')"  data-ng-show="true" class="selected"></span>




        </a>

      </li>





      <%--<li data-ng-class="{'start active open' : isActive('/create_new_app/app_settings')}" >--%>



        <%--<a href="#/create_new_app/app_settings" >--%>
          <%--<i class="icon-plus"></i>--%>
          <%--<span class="title">Create New App</span>--%>

          <%--<span  data-ng-if="isActive('/create_new_app/app_settings')"  data-ng-show="true" class="selected"></span>--%>

        <%--</a>--%>

      <%--</li>--%>



      <!-- end of Main section -->



      <!-- start of my apps section -->

      <li class="heading">
        <h3 class="uppercase">My Apps</h3>
      </li>




      <li data-ng-repeat="app in apps"  data-ng-class="{'start active open' : isActive('/app/'+app.id)}" >
        <a ui-sref="app.sms({appId: app.id, d_appId: app.id})">
          <i class="icon-screen-smartphone"></i>
          <span class="title">{{app.name}}</span>

          <span  data-ng-if="isActive('/app/'+app.id)"  data-ng-show="true" class="selected"></span>
        </a>

      </li>

      <li>
        <a ui-sref="userSettings">
          <i class="icon-settings"></i>
          <span class="title">Settings</span>
        </a>
      </li>




      <!-- end of my apps section -->


      <!-- start of manage account section -->

      <%--<li class="heading">--%>
        <%--<h3 class="uppercase">Account Manage</h3>--%>
      <%--</li>--%>

      <%--<li >
    <a href="/">
     <i class="icon-notebook"></i>
      <span class="title">Reports</span>
      </a>

      </li>


      <%--<li >--%>
        <%--<a href="/">--%>
          <%--<i class="icon-settings"></i>--%>
          <%--<span class="title">Settings</span>--%>
        <%--</a>--%>

      <%--</li>--%>


      <!-- start of manage account section -->



    </ul>
    <!-- END SIDEBAR MENU -->
  </div>
</div>
<!-- END SIDEBAR -->