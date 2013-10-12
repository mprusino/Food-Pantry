package org.nlf.fp;

import org.nlf.fp.models.Order;

import org.apache.commons.io.IOUtils;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.KeyRange;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This servlet is for getting and posting new orders.
 */
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(OrderServlet.class.getSimpleName());

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        dispatchGet(req, resp);
    }

    private void dispatchGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("guestId") == null) {
            getAllOrders(req, resp);
        } else {
            getOrdersForGuest(req, resp);
        }
    }

    private void getAllOrders(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {

    }

    private void getOrdersForGuest(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Query q = pm.newQuery(Order.class);

        try {
            q.setFilter("guestId == givenGuestId");
            q.setOrdering("orderDate desc");
            q.declareParameters("long givenGuestId");

            final Long guestId = Long.parseLong(req.getParameter("guestId"));
            @SuppressWarnings("unchecked")
            final List<Order> ordersForGuest = (List<Order>) q.execute(guestId.longValue());
            final ObjectMapper mapper = new ObjectMapper();
            mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);

            //@formatter:off
            final String json = mapper
                    .writerWithView(Order.Views.ForOrderScreen.class)
                    .writeValueAsString(ordersForGuest);
            //@formatter:on
            resp.getWriter().println(json);
        } catch (final Exception e) {
            resp.setStatus(404);
        } finally {
            q.closeAll();
            pm.close();
        }
    }

    @Override
    public void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final String json = IOUtils.toString(req.getInputStream());
        logger.log(Level.INFO, "Received this JSON:\n" + json + "\nStoring to datastore.");
        final Order order = JsonMapper.get().readValue(json, Order.class);
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        final KeyRange keyRange = datastore.allocateIds(Order.class.getSimpleName(), 1L);
        try {
            order.setKey(keyRange.getStart());
            pm.makePersistent(order);
            resp.getWriter().println("Access new order with id: " + order.getKey().getId());
        } finally {
            pm.close();
        }
    }
}
