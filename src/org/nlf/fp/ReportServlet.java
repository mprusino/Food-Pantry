package org.nlf.fp;

import org.nlf.fp.models.FoodOrder;
import org.nlf.fp.reports.AnnualOrderHistoryReport;

import com.google.inject.Singleton;

import javax.jdo.Extent;
import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@Singleton
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("year") != null) {
            try {
                final short year = Short.valueOf(req.getParameter("year"));
                doGet(req, resp, year);
            } catch (final NumberFormatException e) {
                resp.setStatus(404);
            }
        } else {
            resp.setStatus(404);
        }
    }

    private void doGet(final HttpServletRequest req, final HttpServletResponse resp, final short year)
            throws IOException {
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Extent<FoodOrder> extent = pm.getExtent(FoodOrder.class, false);
        final AnnualOrderHistoryReport report = new AnnualOrderHistoryReport(extent, year);
        resp.getWriter().print(report.toJson());
    }
}
