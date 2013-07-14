package org.newlifefellowship.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Neighborhood")
public class Neighborhood {
    private String zipCode;
    private String neighborhood;
    private State state;

    public Neighborhood() {

    }

    public Neighborhood(final String zipCode, final String neighborhood,
            final State state) {
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

    public State getState() {
        return state;
    }

    public void setState(final State state) {
        this.state = state;
    }
}
