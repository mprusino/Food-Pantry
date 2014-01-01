package org.nlf.fp;

import org.nlf.fp.models.FoodOrder;

import org.apache.commons.io.IOUtils;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.KeyRange;
import com.google.inject.Singleton;

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
 * This servlet is for getting and posting food orders.
 */
@Singleton
public class FoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(FoodServlet.class.getSimpleName());

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        dispatchGet(req, resp);
    }

    private void dispatchGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("guestId") != null) {
            getFoodOrdersForGuest(req, resp);
        }
    }

    private void getFoodOrdersForGuest(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Query q = pm.newQuery(FoodOrder.class);

        try {
            q.setFilter("guestId == givenGuestId");
            q.setOrdering("orderDate desc");
            q.declareParameters("long givenGuestId");

            final Long guestId = Long.parseLong(req.getParameter("guestId"));
            @SuppressWarnings("unchecked")
            final List<FoodOrder> foodOrdersForGuest = (List<FoodOrder>) q.execute(guestId.longValue());
            final ObjectMapper mapper = new ObjectMapper();
            mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);

            //@formatter:off
            final String json = mapper
                    .writerWithView(FoodOrder.Views.ForOrderScreen.class)
                    .writeValueAsString(foodOrdersForGuest);
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
        final long guestId = Long.parseLong(IOUtils.toString(req.getInputStream()));
        logger.log(Level.INFO, "Received this guest id:\n" + guestId + "\nStoring to datastore.");
        final FoodOrder foodOrder = new FoodOrder();
        foodOrder.setGuestId(guestId);
        foodOrder.setOrderDateToToday();

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        final KeyRange keyRange = datastore.allocateIds(FoodOrder.class.getSimpleName(), 1L);
        try {
            foodOrder.setKey(keyRange.getStart());
            pm.makePersistent(foodOrder);
            resp.getWriter().print(foodOrder.getKey().getId());
        } finally {
            pm.close();
        }
    }
}
