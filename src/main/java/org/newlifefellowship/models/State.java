package org.newlifefellowship.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "State")
public class State {
    private String abbreviation;
    private String fullName;

    public State() {

    }

    public State(final String abbreviation, final String fullName) {
        super();
        this.abbreviation = abbreviation;
        this.fullName = fullName;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(final String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(final String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return this State's abbreviation and full name separated by a colon;
     *         example: NY:New York
     */
    @Override
    public String toString() {
        return String.format("%s:%s", getAbbreviation(), getFullName());
    }
}
