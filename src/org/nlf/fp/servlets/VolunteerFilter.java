package org.nlf.fp.servlets;

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
 * filter is intended to make sure that the user is a volunteer. For now this
 * means they are either a Google App Engine admin or their email address is one
 * of two known email addresses.
 */
@Singleton
public class VolunteerFilter implements Filter {

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(final ServletRequest req, final ServletResponse resp, final FilterChain chain)
            throws IOException, ServletException {
        final UserService userService = UserServiceFactory.getUserService();
        final String email = userService.getCurrentUser().getEmail();
        final boolean isAdmin = userService.isUserAdmin();
        if (isAdmin || "NLFCDCPantryVolunteer@gmail.com".equals(email) || "NLFCDCPantryManager@gmail.com".equals(email)) {
            chain.doFilter(req, resp);
        } else {
            ((HttpServletResponse) resp).sendRedirect("/unauthorized");
        }
    }

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
    }
}
