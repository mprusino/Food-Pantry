package org.nlf.fp;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.inject.Singleton;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * A filter is triggered before passing the request to a desired servlet. This
 * filter is intended to make sure that the user has been authenticated,
 * redirecting the user to the login servlet if the user has not been.
 */
@Singleton
public class AuthenticationFilter implements Filter {
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(final ServletRequest req, final ServletResponse resp, final FilterChain chain)
            throws IOException, ServletException {
        final UserService userService = UserServiceFactory.getUserService();
        if (userService.isUserLoggedIn()) {
            chain.doFilter(req, resp);
        } else {
            ((HttpServletResponse) resp).sendRedirect("/login");
        }
    }

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
    }
}
