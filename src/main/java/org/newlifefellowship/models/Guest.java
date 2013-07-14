package org.newlifefellowship.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Guest")
public class Guest {
    private String firstName;
    private String lastName;
    private String ethnicity;
    private String zipCode;
    private short numChildren;
    private short numAdults;
    private short numSeniors;
    private short total;

    public Guest() {

    }

    public Guest(final String firstName, final String lastName,
            final String ethnicity, final String zipCode,
            final short numChildren, final short numAdults,
            final short numSeniors, final short total) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.ethnicity = ethnicity;
        this.zipCode = zipCode;
        this.numChildren = numChildren;
        this.numAdults = numAdults;
        this.numSeniors = numSeniors;
        this.total = total;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(final String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public short getNumChildren() {
        return numChildren;
    }

    public void setNumChildren(final short numChildren) {
        this.numChildren = numChildren;
    }

    public short getNumAdults() {
        return numAdults;
    }

    public void setNumAdults(final short numAdults) {
        this.numAdults = numAdults;
    }

    public short getNumSeniors() {
        return numSeniors;
    }

    public void setNumSeniors(final short numSeniors) {
        this.numSeniors = numSeniors;
    }

    public short getTotal() {
        return total;
    }

    public void setTotal(final short total) {
        this.total = total;
    }
}
