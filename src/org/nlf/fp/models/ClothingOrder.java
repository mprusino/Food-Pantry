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
public class ClothingOrder {
    @JsonIgnore
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
    @Persistent
    private long guestId;
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
    public Date getOrderDate() {
        return orderDate;
    }

    @JsonView(Views.ForOrderScreen.class)
    public String getOrderDateAsString() {
        return Utilities.formatAsFullDate(orderDate);
    }

    public void setOrderDate(final Date orderDate) {
        this.orderDate = Utilities.toUtc(orderDate);
    }

    public void setOrderDateToToday() {
        this.orderDate = Utilities.toUtc(new Date());
    }
}
