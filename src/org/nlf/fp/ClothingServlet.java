package org.nlf.fp;

import org.nlf.fp.models.ClothingOrder;
import org.nlf.fp.models.Guest;

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
 * This servlet is for getting and posting clothing orders.
 */
@Singleton
public class ClothingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ClothingServlet.class.getSimpleName());

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        dispatchGet(req, resp);
    }

    private void dispatchGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("guestId") != null) {
            getClothingOrdersForGuest(req, resp);
        }
    }

    private void getClothingOrdersForGuest(final HttpServletRequest req, final HttpServletResponse resp)
            throws IOException {
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Query q = pm.newQuery(ClothingOrder.class);

        try {
            q.setFilter("guestId == givenGuestId");
            q.setOrdering("orderDate desc");
            q.declareParameters("long givenGuestId");

            final Long guestId = Long.parseLong(req.getParameter("guestId"));
            @SuppressWarnings("unchecked")
            final List<ClothingOrder> clothingOrdersForGuest = (List<ClothingOrder>) q.execute(guestId.longValue());
            final ObjectMapper mapper = new ObjectMapper();
            mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);

            //@formatter:off
            final String json = mapper
                    .writerWithView(ClothingOrder.Views.ForOrderScreen.class)
                    .writeValueAsString(clothingOrdersForGuest);
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
        final ClothingOrder clothingOrder = new ClothingOrder();
        clothingOrder.setGuestId(guestId);
        clothingOrder.setOrderDateToToday();

        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Guest guest = pm.getObjectById(Guest.class, guestId);
        clothingOrder.setAdults(guest.getAdults());
        clothingOrder.setChildren(guest.getChildren());
        clothingOrder.setSeniors(guest.getSeniors());
        final DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        final KeyRange keyRange = datastore.allocateIds(ClothingOrder.class.getSimpleName(), 1L);
        try {
            clothingOrder.setKey(keyRange.getStart());
            pm.makePersistent(clothingOrder);
            resp.getWriter().print(clothingOrder.getKey().getId());
        } finally {
            pm.close();
        }
    }
}
