<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMI Result</title>
<style>
    body { font-family: Arial, sans-serif; background: #f2f4f8; }
    .box { width: 380px; margin: 60px auto; background: #fff; padding: 25px;
           border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
    h2 { text-align: center; color: #2c3e50; }
    table { width: 100%; border-collapse: collapse; }
    td { padding: 8px; border-bottom: 1px solid #eee; }
    td.val { text-align: right; font-weight: bold; }
    .emi { font-size: 22px; color: #27ae60; text-align: center; margin: 20px 0; }
    .error { color: #c0392b; text-align: center; }
    a { display: block; text-align: center; margin-top: 20px; }
</style>
</head>
<body>
<div class="box">
<% if (request.getAttribute("error") != null) { %>
    <h2>Error</h2>
    <p class="error"><%= request.getAttribute("error") %></p>
<% } else { %>
    <h2>Your Monthly EMI</h2>
    <div class="emi">&#8377; <%= String.format("%,.2f", (Double) request.getAttribute("emi")) %></div>
    <table>
        <tr><td>Loan Amount</td><td class="val">&#8377; <%= String.format("%,.2f", (Double) request.getAttribute("price")) %></td></tr>
        <tr><td>Interest Rate</td><td class="val"><%= request.getAttribute("rate") %> %</td></tr>
        <tr><td>Tenure</td><td class="val"><%= request.getAttribute("tenure") %> years</td></tr>
        <tr><td>Total Interest</td><td class="val">&#8377; <%= String.format("%,.2f", (Double) request.getAttribute("totalInterest")) %></td></tr>
        <tr><td>Total Payment</td><td class="val">&#8377; <%= String.format("%,.2f", (Double) request.getAttribute("totalPayment")) %></td></tr>
    </table>
<% } %>
    <a href="index.html">&larr; Calculate again</a>
</div>
</body>
</html>
