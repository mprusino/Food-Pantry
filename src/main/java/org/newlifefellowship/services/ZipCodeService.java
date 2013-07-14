package org.newlifefellowship.services;

import org.newlifefellowship.models.Neighborhood;
import org.newlifefellowship.models.State;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.util.HashMap;
import java.util.Map;

@Path("/zipcodes")
public class ZipCodeService {
    private static final Map<String, Neighborhood> ZIP_CODES;

    static {
        ZIP_CODES = new HashMap<String, Neighborhood>();
        ZIP_CODES.put("11103", new Neighborhood("11103", "Astoria", new State(
                "NY", "New York")));
    }

    @GET
    @Path("/{zipcode}")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public Neighborhood getZipCodes(@PathParam("zipcode") final String zipcode) {
        return ZIP_CODES.get(zipcode);
    }
}
