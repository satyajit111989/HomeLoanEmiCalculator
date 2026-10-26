# Home Loan EMI Calculator

A simple J2EE (Jakarta Servlet + JSP) web app that calculates the monthly EMI for a home loan.

Enter the house price (loan amount), annual interest rate, and tenure in years; the app shows the
monthly EMI, total interest, and total payment.

EMI formula: `EMI = P × r × (1 + r)^n / ((1 + r)^n − 1)`, where `r` is the monthly rate and `n` the number of months.

## Requirements
- Java 17
- Apache Tomcat 10.1 (Jakarta Servlet 5.0+)
- Eclipse IDE for Enterprise Java (Dynamic Web Project, no Maven)

## Run
1. Import into Eclipse: File → Import → Existing Projects into Workspace.
2. Set Targeted Runtime to Apache Tomcat v10.1.
3. Run As → Run on Server, then open `http://localhost:8080/HomeLoanEmiCalculator/`.
