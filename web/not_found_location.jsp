<%@page import="Entity.User"%>
<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <%@include file="components/css.jsp" %>
        <title>House of location</title>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div style="margin: 1em 0 1.5em 0">
                <h2><strong><i class="fas fa-map-marked-alt"></i>  ${location}</strong></h2>

                <div class="jumbotron text-center"style="margin-bottom: 0;padding: 2.5rem 1rem; background-color: #f7f7f7;">
                    <h1 class="display-3">No news found in ${location}</h1>
                    <p>
                        Click Continue to return homepage
                    </p>
                    <p class="lead">
                        <% User user = (User) session.getAttribute("admin"); 
                            if (user != null) {
                        %>
                        <a class="btn btn-primary btn-sm" href="<c:url value='index.jsp' />?userId=<c:out value="<%=user.getId()%>" />" role="button">Continue to homepage</a>
                        <% } else { %>
                        <a class="btn btn-primary btn-sm" href="<c:url value='index.jsp' />" role="button">Continue to homepage</a>
                        <%}%>
                    </p>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
