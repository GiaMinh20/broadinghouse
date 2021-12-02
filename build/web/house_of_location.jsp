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
        <% User user = (User) session.getAttribute("admin"); %>
        <div class="container">
            <div style="margin-top: 1em">
                <h2><strong><i class="fas fa-map-marked-alt"></i>  ${location}</strong></h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product-detail">
                        <!--End of Tabs-->
                        <div class="tab-content" id="myTabContent">
                            <!--Single Tab-->
                            <div class="tab-pane fade show active" id="sneakers" role="tabpanel">
                                <div class="tab-single">
                                    <div class="row">

                                        <c:forEach var="houseOfLocation" items="${houseOfLocations}">
                                            <!--Start-->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                <div class="single-product">
                                                    <div class="product-img">
                                                        <a href="<c:url value='house_infor.jsp'/>?id=<c:out value='${houseOfLocation.id}' />&userId=<c:out value='${admin.id}' />">
                                                            <img src="<c:url value='getImage.jsp'/>?id=<c:out value='${houseOfLocation.id}' />" class="main-img" alt="#">
                                                        </a>
                                                    </div>
                                                    <div class="product-title">
                                                        <h3><c:out value='${houseOfLocation.name}' /></h3>
                                                        <div class="product-price">
                                                            <span>Price: <c:out value='${houseOfLocation.price}' /> $</span>
                                                            <% if (user != null) {%>
                                                            <span><a href="<c:url value='addList?id=' /><c:out value='${houseOfLocation.id}' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
                                                            <%} else {  %>
                                                            <span><a href="<c:url value='login.jsp' />" class="btn btn-success">Save to list</a></span>
                                                            <%}%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
