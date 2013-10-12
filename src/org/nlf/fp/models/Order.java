package org.nlf.fp.models;

import org.nlf.fp.util.Utilities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import com.google.appengine.api.datastore.Key;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
@PersistenceCapable
public class Order {
    @JsonIgnore
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
    @Persistent
    private long guestId;
    @Persistent
    private boolean forFood;
    @Persistent
    private boolean forClothing;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy", timezone = "UTC")
    @Persistent
    private Date orderDate;

    public class Views {
        public class ForOrderScreen {
        }
    }

    public Key getKey() {
        return key;
    }

    public void setKey(final Key key) {
        this.key = key;
    }

    public long getGuestId() {
        return guestId;
    }

    public void setGuestId(final long guestId) {
        this.guestId = guestId;
    }

    @JsonView(Views.ForOrderScreen.class)
    public boolean isForFood() {
        return forFood;
    }

    public void setForFood(final boolean forFood) {
        this.forFood = forFood;
    }

    @JsonView(Views.ForOrderScreen.class)
    public boolean isForClothing() {
        return forClothing;
    }

    public void setForClothing(final boolean forClothing) {
        this.forClothing = forClothing;
    }

    @JsonView(Views.ForOrderScreen.class)
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(final Date orderDate) {
        this.orderDate = Utilities.toUtc(orderDate);
    }

    // @JsonView(Views.ForOrderScreen.class)
    // public String getFormattedOrderDate() {
    // return Utilities.formatAsMMddyyyy(orderDate);
    // }
    //
    // public void setFormattedOrderDate(final String orderDate) {
    // try {
    // this.orderDate = Utilities.parseAsMMddyyyy(orderDate);
    // } catch (final ParseException e) {
    // this.orderDate = null;
    // }
    // }
}
