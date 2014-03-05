<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%
    UserService userService = UserServiceFactory.getUserService();
    final String logoutUrl = userService.createLogoutURL("/login");
%>
<div>
    Must be a volunteer! <a href="<%=logoutUrl%>">Sign out</a>
</div>
