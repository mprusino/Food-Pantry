package org.nlf.fp.servlets;

import com.google.inject.servlet.ServletModule;

public class FoodPantryServletModule extends ServletModule {
    @Override
    protected void configureServlets() {
        serve("/login*").with(LoginServlet.class);
        serve("/unauthorized*").with(NotAVolunteerServlet.class);

        serve("/food-pantry*").with(IndexServlet.class);
        filter("/food-pantry*").through(AuthenticationFilter.class);
        filter("/food-pantry*").through(VolunteerFilter.class);

        serve("/guest*").with(GuestServlet.class);
        filter("/guest*").through(AuthenticationFilter.class);
        filter("/guest*").through(VolunteerFilter.class);

        serve("/food*").with(FoodServlet.class);
        filter("/food*").through(AuthenticationFilter.class);
        filter("/food*").through(VolunteerFilter.class);

        serve("/clothing*").with(ClothingServlet.class);
        filter("/clothing*").through(AuthenticationFilter.class);
        filter("/clothing*").through(VolunteerFilter.class);

        serve("/zipCode*").with(ZipCodeServlet.class);
        filter("/zipCode*").through(AuthenticationFilter.class);
        filter("/zipCode*").through(VolunteerFilter.class);

        serve("/volunteer*").with(VolunteerServlet.class);
        filter("/volunteer*").through(AuthenticationFilter.class);

        serve("/report*").with(ReportServlet.class);
        filter("/report*").through(AuthenticationFilter.class);
        filter("/report*").through(VolunteerFilter.class);

        serve("/migrate*").with(DataMigrationServlet.class);
        filter("/migrate*").through(AdminFilter.class);
    }
}
