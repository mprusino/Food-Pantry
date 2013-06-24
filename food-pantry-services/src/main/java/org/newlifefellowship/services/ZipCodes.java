package org.newlifefellowship.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/zipcodes")
public class ZipCodes {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getZipCodes() {
        return "zip codes!";
    }
}
