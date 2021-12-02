<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="Entity.User"%>
<%@page import="Entity.House"%>
<%@page import="java.util.List"%>
<%@page import="DAO.HouseDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp" %>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Boarding House UTE</title>
        <style>
            .main-img{height: 170px;width: 250px}
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <% User user = (User) session.getAttribute("admin"); %>
        <Section>
            <div class="position-relative  p-3 p-md-5 text-center banner">
                <div class="col-md-5 p-lg-5 mx-auto my-5 fontWhite">
                    <h1 class="display-4 font-weight-normal">Find & Book Now</h1>
                    <p class="lead font-weight-normal">Find accommodation easily with our website. View and save the news you care about and book when you want. We will contact you shortly to give you detailed information.</p>
                </div>
                <div class="product-device box-shadow d-none d-md-block"></div>
                <div class="product-device product-device-2 box-shadow d-none d-md-block"></div>
            </div>
        </Section>
        <div class="product-panel">
            <div class="container" style="padding-bottom: 50px">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2 class="text-center">New house</h2>
                        </div>
                    </div>
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
                                            <%
                                                HouseDAO dao = new HouseDAO();
                                                List<House> list = dao.getNewHouse();
                                                request.setAttribute("list", list);
                                            %>
                                            <c:forEach var="allHouse" items="${list}">
                                                <!--Start-->
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="<c:url value='house_infor.jsp'/>?id=<c:out value='${allHouse.id}' />&userId=<c:out value='${admin.id}' />">
                                                                <img src="<c:url value='getImage.jsp'/>?id=<c:out value='${allHouse.id}' />" class="main-img" alt="#">
                                                            </a>
                                                        </div>

                                                        <div class="product-title">
                                                            <h5><c:out value='${allHouse.name}' /></h5>
                                                            <div class="product-price">
                                                                <span>Price: <c:out value='${allHouse.price}' /> $</span>
                                                                <% if (user != null) {%>
                                                                <span><a href="<c:url value='addList?id=' /><c:out value='${allHouse.id}' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
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
                                    <div class="text-center mt-1">
                                        <a href="<c:url value="all_new_house.jsp"/>?userId=<c:out value="${admin.id}" />" class="btn btn-danger btn-sm text-white">View All</a>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    List<House> boardings = dao.get4HouseByCategory("Boarding House");
                    request.setAttribute("boardings", boardings);
                    if (boardings != null) {
                %>

                <div style="margin-bottom: 1em">
                    <a href="<c:url value='all_boarding_house.jsp' />?userId=<c:out value="${admin.id}" />" class="btn btn-danger btn-sm text-white">All boarding house</a>
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

                                            <c:forEach var="boarding" items="${boardings}">
                                                <!--Start-->
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="<c:url value='house_infor.jsp'/>?id=<c:out value='${boarding.id}' />&userId=<c:out value='${admin.id}' />">
                                                                <img src="<c:url value='getImage.jsp'/>?id=<c:out value='${boarding.id}' />" class="main-img" alt="#">
                                                            </a>
                                                        </div>
                                                        <div class="product-title">
                                                            <h5><c:out value='${boarding.name}' /></h5>
                                                            <div class="product-price">
                                                                <span>Price: <c:out value='${boarding.price}' /> $</span>
                                                                <% if (user != null) {%>
                                                                <span><a href="<c:url value='addList?id=' /><c:out value='${boarding.id}' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
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
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                <%
                    List<House> apartments = dao.get4HouseByCategory("Apartment");
                    request.setAttribute("apartments", apartments);
                    if (apartments
                            != null) {
                %>
                <div style="margin-bottom: 1em">
                    <a href="<c:url value='all_apartment.jsp' />?userId=<c:out value="${admin.id}" />" class="btn btn-danger btn-sm text-white">All Apartment</a>
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

                                            <c:forEach var="apartment" items="${apartments}">
                                                <!--Start-->
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="<c:url value='house_infor.jsp'/>?id=<c:out value='${apartment.id}' />&userId=<c:out value='${admin.id}' />">
                                                                <img src="<c:url value='getImage.jsp'/>?id=<c:out value='${apartment.id}' />" class="main-img" alt="#">
                                                            </a>
                                                        </div>
                                                        <div class="product-title">
                                                            <h5><c:out value='${apartment.name}' /></h5>
                                                            <div class="product-price">
                                                                <span>Price: <c:out value='${apartment.price}' /> $</span>
                                                                <% if (user != null) {%>
                                                                <span><a href="<c:url value='addList?id=' /><c:out value='${apartment.id}' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
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
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                <%
                    List<House> houses = dao.get4HouseByCategory("House");
                    request.setAttribute("houses", houses);
                    if (houses != null) {
                %>
                <div style="margin-bottom: 1em">
                    <a href="<c:url value='all_house.jsp' />?userId=<c:out value="${admin.id}" />" class="btn btn-danger btn-sm text-white">All House</a>
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

                                            <c:forEach var="house" items="${houses}">
                                                <!--Start-->
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="<c:url value='house_infor.jsp'/>?id=<c:out value='${house.id}' />&userId=<c:out value='${admin.id}' />">
                                                                <img src="<c:url value='getImage.jsp'/>?id=<c:out value='${house.id}' />" class="main-img" alt="#">
                                                            </a>
                                                        </div>
                                                        <div class="product-title">
                                                            <h5><c:out value='${house.name}' /></h5>
                                                            <div class="product-price">
                                                                <span>Price: <c:out value='${house.price}' /> $</span>
                                                                <% if (user != null) {%>
                                                                <span><a href="<c:url value='addList?id=' /><c:out value='${house.id}' />&userId=<c:out value='${admin.id}' />" class="btn btn-success">Save to list</a></span>
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
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
