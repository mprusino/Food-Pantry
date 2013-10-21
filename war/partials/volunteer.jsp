<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
    UserService userService = UserServiceFactory.getUserService();
    final String logoutUrl = userService.createLogoutURL("/login");
    final String email = userService.getCurrentUser().getEmail();
%>
<form>
    <fieldset>
        <legend>Volunteer Information</legend>
        <div class="row">
            <div class="span3 offset1">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" placeholder="First Name" required/>
            </div>
            <div class="span3">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" placeholder="Last Name" required/>
            </div>
            <div class="span3">
                <label for="email">Email</label>
                <input type="text" name="email" placeholder="Email" value="<%=email %>" required readonly="readonly"/>
            </div>
        </div>
    </fieldset>
    <div class="form-actions row">
        <div class="offset8">
            <button class="btn btn-large btn-primary" ng-click="postForm()">
                Submit <i class="icon-chevron-right icon-white"></i>
            </button>
        </div>
    </div>
</form>
