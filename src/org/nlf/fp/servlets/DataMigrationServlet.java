package org.nlf.fp.servlets;

import com.google.inject.Singleton;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@Singleton
public class DataMigrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        try {
            req.getRequestDispatcher("/pages/migrate.jsp").include(req, resp);
        } catch (final ServletException e) {
            e.printStackTrace();
        }
    }

}
