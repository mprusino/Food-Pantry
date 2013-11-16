package org.nlf.fp;

import org.nlf.fp.models.Volunteer;

import org.apache.commons.io.IOUtils;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.KeyRange;
import com.google.inject.Singleton;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@Singleton
public class VolunteerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(VolunteerServlet.class.getSimpleName());

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        dispatchGet(req, resp);
    }

    private void dispatchGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        if (req.getParameter("volunteerId") == null) {
            resp.sendError(404);
        } else {
            getSingleVolunteer(req, resp);
        }
    }

    private void getSingleVolunteer(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        try {
            final PersistenceManager pm = PMF.get().getPersistenceManager();
            final Long volunteerId = Long.parseLong(req.getParameter("volunteerId"));
            final Volunteer volunteer = pm.getObjectById(Volunteer.class, volunteerId);
            resp.getWriter().println(JsonMapper.get().writeValueAsString(volunteer));
        } catch (final Exception e) {
            resp.setStatus(404);
        }
    }

    @Override
    public void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final String json = IOUtils.toString(req.getInputStream());
        logger.log(Level.INFO, "Received this JSON:\n" + json + "\nStoring to datastore.");

        final Volunteer volunteer = JsonMapper.get().readValue(json, Volunteer.class);
        final PersistenceManager pm = PMF.get().getPersistenceManager();
        final DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        final KeyRange keyRange = datastore.allocateIds(Volunteer.class.getSimpleName(), 1L);
        try {
            volunteer.setKey(keyRange.getStart());
            pm.makePersistent(volunteer);
            resp.getWriter().println("Access new volunteer with id: " + volunteer.getKey().getId());
        } finally {
            pm.close();
        }
    }
}
