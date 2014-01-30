package org.nlf.fp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Utilities {
    public static String formatAsMMddyyyy(final Date date) {
        if (date == null) {
            return null;
        } else {
            return new SimpleDateFormat("MM/dd/yyyy").format(date);
        }
    }

    public static String formatAsFullDate(final Date date) {
        if (date == null) {
            return null;
        } else {
            return new SimpleDateFormat("EEE MMM d yyyy").format(date);
        }
    }

    public static Date parseAsMMddyyyy(final String date) throws ParseException {
        return date == null ? null : new SimpleDateFormat("MM/dd/yyyy").parse(date);
    }

    public static Date toUtc(final Date date) {
        if (date == null) {
            return null;
        } else {
            final Calendar calendar = toCalendar(date);
            calendar.setTimeZone(TimeZone.getTimeZone("UTC"));
            return calendar.getTime();
        }
    }

    public static Calendar toCalendar(final Date date) {
        final Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar;
    }
}
