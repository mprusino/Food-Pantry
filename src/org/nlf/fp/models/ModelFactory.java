package org.nlf.fp.models;

import org.nlf.fp.JsonMapper;

import org.apache.commons.io.IOUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import javax.servlet.http.HttpServletRequest;

import java.io.IOException;

public class ModelFactory {
    public static Guest toGuest(final HttpServletRequest req) throws JsonParseException, JsonMappingException,
            IOException {
        final String json = IOUtils.toString(req.getInputStream());
        System.out.println("JSON: " + json);
        return toGuest(json);
    }

    public static Guest toGuest(final String json) throws JsonParseException, JsonMappingException, IOException {
        return JsonMapper.get().readValue(json, Guest.class);
    }
}
