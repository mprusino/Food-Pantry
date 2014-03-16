package org.nlf.fp.data;

import org.nlf.fp.models.Guest;

import au.com.bytecode.opencsv.CSVReader;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.Collection;

public class DataReader {
    public static Collection<Guest> getGuests() throws Exception {
        CSVReader reader = null;
        try {
            reader = new CSVReader(new FileReader("/home/jmezic/Downloads/tblFamily.csv"));
            final String[] header = reader.readNext();
            System.out.println(header);

            final Collection<Guest> guests = new ArrayList<Guest>();

            String[] line = reader.readNext();
            while (line != null) {
                final Guest guest = new Guest();
                int i = 0;
                guest.setLegacyFamilyId(Long.parseLong(line[i++]));
                guest.setLastName(line[i++]);
                guest.setFirstName(line[i++]);
                guest.setAddress(line[i++]);
                guest.setEthnicity(line[i++]);

                i++; // skip town

                guest.setZipCode(line[i++]);

                i++; // skip total in family

                guest.setSeniors(getShort(line[i++]));
                guest.setAdults(getShort(line[i++]));
                guest.setChildren(getShort(line[i++]));

                // Other values:
                guest.setPhone("");
                guests.add(guest);

                line = reader.readNext();
            }

            return guests;
        } finally {
            reader.close();
        }
    }

    private static short getShort(final String line) {
        try {
            return Short.parseShort(line);
        } catch (final Exception e) {
            return 0;
        }
    }
}
