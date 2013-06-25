package org.newlifefellowship.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/zipcodes")
public class ZipCodes {
    @GET @Path("/{zipcode}")
    @Produces(MediaType.TEXT_PLAIN)
    public String getZipCodes(@PathParam("zipcode") final String zipcode) {
        return "query: " + zipcode;
    }
}
