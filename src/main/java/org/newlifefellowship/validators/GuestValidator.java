package org.newlifefellowship.validators;

import org.apache.commons.lang3.StringUtils;
import org.newlifefellowship.models.Guest;

import java.util.ArrayList;
import java.util.Collection;

public class GuestValidator {
    /**
     * @param guest
     *            a Guest to be validated
     * @return {@code true} if the given {@code guest} is valid, {@code false}
     *         otherwise
     */
    public boolean isValid(final Guest guest) {
        return findProblems(guest).isEmpty();
    }

    /**
     * 
     * @param guest
     *            a Guest to be validated
     * @return a collection of error messages where each message indicates what
     *         is wrong with the given {@code guest}
     */
    public Collection<String> findProblems(final Guest guest) {
        final Collection<String> problems = new ArrayList<String>();

        if (StringUtils.isBlank(guest.getFirstName())) {
            problems.add("Missing first name.");
        }

        if (StringUtils.isBlank(guest.getLastName())) {
            problems.add("Missing last name.");
        }

        return problems;
    }
}
