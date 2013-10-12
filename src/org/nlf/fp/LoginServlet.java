package org.nlf.fp;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(final HttpServletRequest req,
            final HttpServletResponse resp) throws IOException {
        final UserService userService = UserServiceFactory.getUserService();
        resp.setContentType("text/html");
        if (req.getUserPrincipal() != null) {
            resp.sendRedirect("/food-pantry!#/order");
        } else {
            resp.sendRedirect(userService
                    .createLoginURL("/food-pantry!#/order"));
        }
    }
}
