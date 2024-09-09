package com.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class RecommendationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email from the session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Check if email is provided
        if (email == null || email.isEmpty()) {
            // Handle the case where email is not provided
            response.getWriter().println("Email is missing.");
            return;
        }

        // Use email to fetch user's preferences and other relevant information from the database
        List<String> userPreferences = getUserPreferences(email);

        // Perform machine learning-based recommendation
        List<String> recommendedVehicles = recommendVehicles(userPreferences);

        // Set recommended vehicles as an attribute to be used in JSP
        request.setAttribute("recommendedVehicles", recommendedVehicles);

        // Forward the request to the JSP page to display recommendations
        request.getRequestDispatcher("/recommendations.jsp").forward(request, response);
    }

    // Method to simulate fetching user preferences from the database using email
    private List<String> getUserPreferences(String email) {
        // Simulating user preferences (replace with actual database queries)
        List<String> userPreferences = new ArrayList<>();
        // Fetch user preferences from the database based on the provided email
        // For demonstration, let's assume some hardcoded preferences
        userPreferences.add("SUV");
        userPreferences.add("4-Wheel Drive");
        // Add more preferences based on user's history or profile
        return userPreferences;
    }

    // Method to perform recommendation based on user's preferences
    private List<String> recommendVehicles(List<String> userPreferences) {
        // Simple content-based filtering approach
        // Simulate a list of available vehicles (replace with actual database queries)
        List<String> availableVehicles = new ArrayList<>();
        availableVehicles.add("Toyota RAV4");
        availableVehicles.add("Jeep Wrangler");
        availableVehicles.add("Ford Explorer");

        // Perform recommendation based on user preferences
        List<String> recommendedVehicles = new ArrayList<>();
        for (String vehicle : availableVehicles) {
            // Simulate a simple matching algorithm (e.g., if any preference matches vehicle type)
            for (String preference : userPreferences) {
                if (vehicle.toLowerCase().contains(preference.toLowerCase())) {
                    recommendedVehicles.add(vehicle);
                    break; // Once a match is found, move to the next vehicle
                }
            }
        }
        return recommendedVehicles;
    }
}
