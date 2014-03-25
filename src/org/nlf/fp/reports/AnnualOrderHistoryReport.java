package org.nlf.fp.reports;

import org.nlf.fp.models.FoodOrder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class AnnualOrderHistoryReport {
    private final List<Row> rowsInReport = new ArrayList<Row>(12);

    public AnnualOrderHistoryReport(final Iterable<FoodOrder> foodOrders, final short year) {
        initializeReport();
        final Calendar calendar = Calendar.getInstance();

        for (final FoodOrder order : foodOrders) {
            final Date date = order.getOrderDate();
            calendar.setTime(date);
            if (calendar.get(Calendar.YEAR) != year) {
                continue;
            }
            final int month = calendar.get(Calendar.MONTH);
            rowsInReport.get(month).includeOrder(order);
        }

        finalizeReport();
    }

    public String toJson() throws JsonProcessingException {
        final ObjectMapper mapper = new ObjectMapper();
        mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, false);
        return mapper.writeValueAsString(rowsInReport);
    }

    private void initializeReport() {
        for (int i = 0; i <= 11; i++) {
            rowsInReport.add(new Row(i));
        }
    }

    private void finalizeReport() {
        for (int i = 0; i <= 11; i++) {
            rowsInReport.get(i).calculateTotalFed();
        }
    }

    public class Row {
        private final int month;
        private int totalOrder = 0;
        private int totalFed = 0;
        private int children = 0;
        private int adults = 0;
        private int seniors = 0;

        Row(final int month) {
            this.month = month;
        }

        void includeOrder(final FoodOrder order) {
            totalOrder++;
            children += order.getChildren();
            adults += order.getAdults();
            seniors += order.getSeniors();
        }

        void calculateTotalFed() {
            totalFed = children + adults + seniors;
        }

        public int getMonth() {
            return month;
        }

        public String getMonthName() {
            switch (month) {
            case 0:
                return "January";
            case 1:
                return "February";
            case 2:
                return "March";
            case 3:
                return "April";
            case 4:
                return "May";
            case 5:
                return "June";

            case 6:
                return "July";
            case 7:
                return "August";
            case 8:
                return "September";
            case 9:
                return "October";
            case 10:
                return "November";
            case 11:
                return "December";
            default:
                return "";
            }
        }

        public int getTotalOrder() {
            return totalOrder;
        }

        public int getTotalFed() {
            return totalFed;
        }

        public int getChildren() {
            return children;
        }

        public int getAdults() {
            return adults;
        }

        public int getSeniors() {
            return seniors;
        }
    }
}
