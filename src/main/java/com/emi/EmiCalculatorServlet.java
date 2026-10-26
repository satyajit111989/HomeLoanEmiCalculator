package com.emi;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/calculate")
public class EmiCalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double principal = Double.parseDouble(request.getParameter("price"));
            double annualRate = Double.parseDouble(request.getParameter("rate"));
            int years = Integer.parseInt(request.getParameter("tenure"));

            if (principal <= 0 || annualRate < 0 || years <= 0) {
                throw new IllegalArgumentException();
            }

            int months = years * 12;
            double monthlyRate = annualRate / 12 / 100;

            // EMI = P * r * (1 + r)^n / ((1 + r)^n - 1)
            double emi;
            if (monthlyRate == 0) {
                emi = principal / months;
            } else {
                double factor = Math.pow(1 + monthlyRate, months);
                emi = principal * monthlyRate * factor / (factor - 1);
            }

            double totalPayment = emi * months;
            double totalInterest = totalPayment - principal;

            request.setAttribute("price", principal);
            request.setAttribute("rate", annualRate);
            request.setAttribute("tenure", years);
            request.setAttribute("emi", emi);
            request.setAttribute("totalInterest", totalInterest);
            request.setAttribute("totalPayment", totalPayment);
        } catch (IllegalArgumentException e) {
            // NumberFormatException is a subclass, so bad/missing input lands here too
            request.setAttribute("error", "Please enter valid positive values.");
        }

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.html");
    }
}
