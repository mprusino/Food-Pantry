package org.newlifefellowship.services;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.jetty.http.HttpMethods;
import org.newlifefellowship.models.Guest;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.util.HashMap;
import java.util.Map;

@Path("/guest")
public class GuestService {
    private static final Map<String, Guest> GUESTS;
    private static int guestId = 0;

    static {
        GUESTS = new HashMap<String, Guest>();
    }

    @OPTIONS
    public String options() {
        //@formatter:off
        final String[] supportedMethods = {
                HttpMethods.GET,
                HttpMethods.PUT,
                HttpMethods.POST,
                HttpMethods.OPTIONS };
        //@formatter:on
        return StringUtils.join(supportedMethods, ",");
    }

    /**
     * Find and return the guest with the associated Id.
     * 
     * @param guestId
     *            a unique guest identifier
     * @return the guest with the associated Id, if one exists
     */
    @GET
    @Path("/{guestId}")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public Guest guest(@PathParam("guestId") final String guestId) {
        return GUESTS.get(guestId);
    }

    private static synchronized int getNextGuestId() {
        return guestId++;
    }

    /**
     * Intended to create a new guest.
     * 
     * @param guest
     *            the new guest
     * @return the guest Id for the newly created guest
     */
    @POST
    @Produces({ MediaType.TEXT_PLAIN })
    @Consumes(MediaType.APPLICATION_JSON)
    public String createGuest(final Guest guest) {
        final String guestId = String.valueOf(getNextGuestId());
        GUESTS.put(guestId, guest);
        return guestId;
    }

    /**
     * Intended to update an existing guest.
     * 
     * @param guestId
     *            the Id of the guest to update
     * @param guest
     *            the guests's updated data
     */
    @PUT
    @Path("/{guestId}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void updateGuest(@PathParam("guestId") final String guestId,
            final Guest guest) {
        if (GUESTS.containsKey(guestId)) {
            GUESTS.put(guestId, guest);
        }
    }
}
