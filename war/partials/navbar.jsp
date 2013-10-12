<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
    UserService userService = UserServiceFactory.getUserService();
    final String logoutUrl = userService.createLogoutURL("/login");
    final String suffix = userService.isUserAdmin() ? " (admin)" : "";
    final String nickName = userService.getCurrentUser().getNickname() + suffix;
%>
<div class="navbar navbar-inverse" ng-controller="NavbarCtrl">
    <div class="navbar-inner">
        <div class="container">
            <div class="nav-collapse collapse">
                <ul class="nav navbar-nav">
                    <li ng-repeat="route in navbarLinks" class="{{route.active}}">
                        <a href="/food-pantry!\#{{route.linkUrl}}">{{route.title}}</a>
                    </li>
        
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <%=nickName%><b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=logoutUrl%>">Sign out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>