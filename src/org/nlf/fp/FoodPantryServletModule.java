package org.nlf.fp;

import com.google.inject.servlet.ServletModule;

public class FoodPantryServletModule extends ServletModule {
    @Override
    protected void configureServlets() {
        serve("/login*").with(LoginServlet.class);

        serve("/food-pantry*").with(IndexServlet.class);
        filter("/food-pantry*").through(AuthenticationFilter.class);

        serve("/guest*").with(GuestServlet.class);
        filter("/guest*").through(AuthenticationFilter.class);

        serve("/food*").with(FoodServlet.class);
        filter("/food*").through(AuthenticationFilter.class);

        serve("/clothing*").with(ClothingServlet.class);
        filter("/clothing*").through(AuthenticationFilter.class);

        serve("/zipCode*").with(ZipCodeServlet.class);
        filter("/zipCode*").through(AuthenticationFilter.class);

        serve("/volunteer*").with(VolunteerServlet.class);
        filter("/volunteer*").through(AuthenticationFilter.class);

        serve("/report*").with(ReportServlet.class);
        filter("/report*").through(AuthenticationFilter.class);
    }
}
