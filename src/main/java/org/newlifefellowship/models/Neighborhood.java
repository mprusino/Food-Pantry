package org.newlifefellowship.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Neighborhood {
    private String zipCode;
    private String neighborhood;
    private String state;

    public Neighborhood() {

    }

    public Neighborhood(final String zipCode, final String neighborhood,
            final String state) {
        super();
        this.zipCode = zipCode;
        this.neighborhood = neighborhood;
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(final String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getState() {
        return state;
    }

    public void setState(final String state) {
        this.state = state;
    }

}
