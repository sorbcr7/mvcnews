<%-- 
    Document   : signout
    Created on : 7 Mar, 2020, 12:01:57 PM
    Author     : guraman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("reporter");
    response.sendRedirect("../login.jsp");
    %>
