<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%
    UserService userService = UserServiceFactory.getUserService();
    final String logoutUrl = userService.createLogoutURL("/login");
    final String suffix = userService.isUserAdmin() ? " (admin)" : "";
    final String nickName = userService.getCurrentUser().getNickname() + suffix;
%>
<div
    class="navbar"
    ng-controller="NavbarCtrl">
    <div class="navbar-inner">
        <div class="container">
            <div class="nav-collapse collapse">
                <ul class="nav navbar-nav">
                    <!-- 
                    <li class="navbar-search pull-left">
                        <input id="guestSearch" type="text" class="search-query" placeholder="Guest Search..." autocomplete="off"/>
                    </li>
                     -->
                    <li><a
                        class="brand"
                        href="/food-pantry!#/landing">New Life Fellowship</a></li>
                    <li
                        ng-repeat="route in navbarLinks"
                        class="{{route.active}}"><a href="/food-pantry!\#{{route.linkUrl}}">{{route.title}}</a></li>
                </ul>
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown"><a
                        href="#"
                        class="dropdown-toggle"
                        data-toggle="dropdown"> <%=nickName%><b class="caret"></b>
                    </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=logoutUrl%>">Sign out</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
	/*
	 $(function() {
	 $('#guestSearch').select2({
	 placeholder : 'Guest Search...',
	 minimumInputLength : 1,
	 query : function(query) {
	 var data = {
	 results : []
	 }, i, j, s;
	 for (i = 1; i < 5; i++) {
	 s = "";
	 for (j = 0; j < i; j++) {
	 s = s + query.term;
	 }
	 data.results.push({
	 id : query.term + i,
	 text : s
	 });
	 }
	 query.callback(data);
	 }
	 });
	 });
	 */
</script>