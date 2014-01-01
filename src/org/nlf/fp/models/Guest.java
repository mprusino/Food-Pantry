package org.nlf.fp.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import com.google.appengine.api.datastore.Key;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@JsonIgnoreProperties(ignoreUnknown = true)
@PersistenceCapable
public class Guest {
    @JsonIgnore
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
    @Persistent
    private String firstName;
    @Persistent
    private String lastName;
    @Persistent
    private String ethnicity;
    @Persistent
    private String lang;
    @Persistent
    private String address;
    @Persistent
    private String zipCode;
    @Persistent
    private short seniors;
    @Persistent
    private short adults;
    @Persistent
    private short children;
    @Persistent
    private String phone;

    public class Views {
        public class ForOrderScreen {
        }
    }

    @JsonView(Views.ForOrderScreen.class)
    public long getId() {
        return key == null ? 0L : key.getId();
    }

    public Key getKey() {
        return key;
    }

    public void setKey(final Key key) {
        this.key = key;
    }

    @JsonView(Views.ForOrderScreen.class)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    @JsonView(Views.ForOrderScreen.class)
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

    @JsonView(Views.ForOrderScreen.class)
    public String getAddress() {
        return address;
    }

    public void setAddress(final String address) {
        this.address = address;
    }

    @JsonView(Views.ForOrderScreen.class)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public short getSeniors() {
        return seniors;
    }

    public void setSeniors(final short seniors) {
        this.seniors = seniors;
    }

    public short getAdults() {
        return adults;
    }

    public void setAdults(final short adults) {
        this.adults = adults;
    }

    public short getChildren() {
        return children;
    }

    public void setChildren(final short children) {
        this.children = children;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(final String lang) {
        this.lang = lang;
    }

}
