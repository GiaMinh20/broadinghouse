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
        <title>All new houses</title>
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="components/navbar.jsp" %>
        <% User user = (User) session.getAttribute("admin"); %>
        <div class="container" >
            <h3 class="text-center">Apartment</h3>
            <div class="row">
                <%                    HouseDAO dao = new HouseDAO();
                    List<House> list = dao.getHouseByCategory("Boarding House");
                    for (House house : list) {
                %>
                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                    <div class="single-product">
                        <div class="product-img">
                            <a href="<c:url value='house_infor.jsp'/>?id=<c:out value="<%=house.getId()%>"/>&userId=<c:out value="${admin.id}"/>">
                                <img style="width: 250px;height: 200px;" src="<c:url value='getImage.jsp'/>?id=<c:out value="<%=house.getId()%>"/>" class="main-img" alt="#">
                            </a>
                        </div>

                        <div class="product-title">
                            <h5><%=house.getName()%></h5>
                            <div class="product-price">
                                <span>Price: <%=house.getPrice()%> $</span>
                                <% if (user != null) {%>
                                <span><a href="<c:url value='addList?id=' /><c:out value='<%=house.getId()%>' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
                                <%} else {  %>
                                <span><a href="<c:url value='login.jsp' />" class="btn btn-success">Save to list</a></span>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
