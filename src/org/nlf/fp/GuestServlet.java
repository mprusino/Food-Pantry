package org.nlf.fp;

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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This servlet is intended to handle these types of requests:
 * <ul>
 * <li>HTTP POST requests to create new guests.
 * <li>HTTP PUT requests to update existing guests.
 * <li>HTTP GET requests with a guest identifier to return all details for guest
 * <li>HTTP GET requests without a guest identifier to return all guests
 * <li>HTTP HEAD requests to return the number of guests in the system
 * </ul>
 */
@Singleton
public class GuestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger("GuestServlet");

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        dispatchGet(req, resp);
    }

    private void dispatchGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("guestId") != null) {
            getSingleGuest(req, resp);
        } else if (req.getParameter("lastName") != null && !req.getParameter("lastName").isEmpty()) {
            getGuestsFromSearch(req, resp);
        } else if (req.getParameterMap().isEmpty()) {
            getAllGuests(req, resp);
        }
    }

    private void getSingleGuest(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        try {
            final PersistenceManager pm = PMF.get().getPersistenceManager();
            final Long guestId = Long.parseLong(req.getParameter("guestId"));
            final Guest guest = pm.getObjectById(Guest.class, guestId);
            resp.getWriter().println(JsonMapper.get().writeValueAsString(guest));
        } catch (final Exception e) {
            resp.setStatus(404);
        }
    }

    private void getAllGuests(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Query q = pm.newQuery(Guest.class);
        try {
            @SuppressWarnings("unchecked")
            final List<Guest> guests = (List<Guest>) q.execute();
            final ObjectMapper mapper = new ObjectMapper();
            mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);

            //@formatter:off
            final String json = mapper
                    .writeValueAsString(guests);
            //@formatter:on
            resp.getWriter().println(json);
        } finally {
            q.closeAll();
            pm.close();
        }
    }

    private void getGuestsFromSearch(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        // TODO Getting an error here, look at later. (Seems to be working now!)
        final String lastName = req.getParameter("lastName").toUpperCase();
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final Query q = pm.newQuery(Guest.class);
        try {
            q.setFilter("upperCaseLastName.startsWith(givenLastName)");
            // q.setOrdering("lastName asc, firstName asc");
            q.declareParameters("String givenLastName");

            @SuppressWarnings("unchecked")
            final List<Guest> guestsFromSearch = new ArrayList<Guest>((List<Guest>) q.execute(lastName));
            final ObjectMapper mapper = new ObjectMapper();
            mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);

            //@formatter:off
            final String json = mapper
                    //.writerWithView(Guest.Views.ForOrderScreen.class)
                    .writeValueAsString(guestsFromSearch);
            //@formatter:on
            resp.getWriter().println(json);
        } catch (final Exception e) {
            e.printStackTrace();
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

        final Guest guest = JsonMapper.get().readValue(json, Guest.class);
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        final KeyRange keyRange = datastore.allocateIds(Guest.class.getSimpleName(), 1L);
        try {
            guest.setKey(keyRange.getStart());
            pm.makePersistent(guest);
            resp.getWriter().print(guest.getKey().getId());
        } finally {
            pm.close();
        }
    }

    @Override
    public void doHead(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {

    }

    @Override
    public void doPut(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final Long id = Long.valueOf(req.getParameter("guestId"));
        final String json = IOUtils.toString(req.getInputStream());
        logger.log(Level.INFO, "Received this JSON:\n" + json + "\nStoring to datastore.");

        final Guest guest = JsonMapper.get().readValue(json, Guest.class);
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            final Guest existingGuest = pm.getObjectById(Guest.class, id);
            existingGuest.setFirstName(guest.getFirstName());
            existingGuest.setLastName(guest.getLastName());
            existingGuest.setEthnicity(guest.getEthnicity());
            existingGuest.setLang(guest.getLang());
            existingGuest.setAddress(guest.getAddress());
            existingGuest.setZipCode(guest.getZipCode());
            existingGuest.setSeniors(guest.getSeniors());
            existingGuest.setAdults(guest.getAdults());
            existingGuest.setChildren(guest.getChildren());
            existingGuest.setPhone(guest.getPhone());
            resp.getWriter().print(existingGuest.getKey().getId());
        } finally {
            pm.close();
        }
    }
}
