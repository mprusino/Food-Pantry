package org.nlf.fp.data;

import org.nlf.fp.models.Guest;

import java.util.Collection;

public class Main {
    public static void main(final String args[]) throws Exception {
        final Collection<Guest> guests = DataReader.getGuests();
        System.out.println("Guests read: " + guests.size());

        for (final Guest guest : guests) {

        }
    }
}
