package org.nlf.fp;

import com.google.inject.Singleton;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@Singleton
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        try {
            req.getRequestDispatcher("/pages/index.jsp").include(req, resp);
        } catch (final ServletException e) {
            e.printStackTrace();
        }
    }

}
