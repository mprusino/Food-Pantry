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
import javax.jdo.annotations.Unique;

import java.util.Calendar;
import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
@PersistenceCapable
@Unique(name = "OneClothingOrderPerDay", members = { "guestId", "orderDate" })
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
    @Persistent
    private short seniors;
    @Persistent
    private short adults;
    @Persistent
    private short children;

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

    @JsonView(Views.ForOrderScreen.class)
    public boolean isToday() {
        final Calendar today = Calendar.getInstance();
        final Calendar orderCalendar = Calendar.getInstance();
        orderCalendar.setTime(orderDate);
        return orderCalendar.get(Calendar.YEAR) == today.get(Calendar.YEAR)
                && orderCalendar.get(Calendar.MONTH) == today.get(Calendar.MONTH)
                && orderCalendar.get(Calendar.DATE) == today.get(Calendar.DATE);
    }

    public void setOrderDate(final Date orderDate) {
        this.orderDate = Utilities.toUtc(Utilities.truncateTime(orderDate));
    }

    public void setOrderDateToToday() {
        this.orderDate = Utilities.toUtc(Utilities.truncateTime(new Date()));
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

}
