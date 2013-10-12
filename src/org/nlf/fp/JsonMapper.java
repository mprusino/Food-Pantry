package org.nlf.fp;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonMapper {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    private JsonMapper() {

    }

    public static ObjectMapper get() {
        return objectMapper;
    }
}
