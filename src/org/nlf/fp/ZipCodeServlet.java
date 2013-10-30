package org.nlf.fp;

import org.nlf.fp.models.ZipCode;

import com.google.inject.Singleton;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

@Singleton
public class ZipCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        final Collection<ZipCode> zipCodes = new ArrayList<ZipCode>();
        zipCodes.add(astoria());
        zipCodes.add(elmhurst());
        zipCodes.add(forestHills());
        zipCodes.add(corona());
        resp.getWriter().println(JsonMapper.get().writeValueAsString(zipCodes));
    }

    private ZipCode astoria() {
        final ZipCode zipCode = new ZipCode();
        zipCode.setZipCode("11103");
        zipCode.setCity("Astoria");
        zipCode.setState("NY");
        return zipCode;
    }

    private ZipCode elmhurst() {
        final ZipCode zipCode = new ZipCode();
        zipCode.setZipCode("11373");
        zipCode.setCity("Elmhurst");
        zipCode.setState("NY");
        return zipCode;
    }

    private ZipCode forestHills() {
        final ZipCode zipCode = new ZipCode();
        zipCode.setZipCode("11735");
        zipCode.setCity("Forest Hills");
        zipCode.setState("NY");
        return zipCode;
    }

    private ZipCode corona() {
        final ZipCode zipCode = new ZipCode();
        zipCode.setZipCode("11368");
        zipCode.setCity("Corona");
        zipCode.setState("NY");
        return zipCode;
    }
}
