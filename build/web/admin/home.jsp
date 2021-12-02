<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@page import="Entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp" %>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Boarding House</title>
    </head>
    <style>
        .btn{width: 8em; color: white;}
        .btn:hover {
            color: #212529;
        }
        #infor{background: #ebebeb}
    </style>
    <body>
        <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
        <%@include file="components/navbar.jsp" %>
        <%
            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            if (admin == null) {
                String redirectURL = "../login.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <div id="body" >
            <div class = "container p-4" id="infor">
                <div class="col-md-8 offset-md-2" style="font-size: 22px">
                    <h4 class="mb-3">Account Information</h4>
                    <form class="needs-validation" novalidate="">
                        <div class="row">
                            <div class="col-md-8 mb-3">
                                <label for="firstName">Full name: ${admin.lastname} ${admin.firstname}</label>
                                <div class="mb-3">
                                    <label for="username">Phone number: ${admin.phone}</label>
                                </div>

                                <div class="mb-3">
                                    <label for="email">Email: ${admin.email}</label>
                                </div>

                                <div class="mb-3">
                                    <label for="address">Address: ${admin.address}</label>
                                </div>

                            </div>
                            <div class="col-md-4 order-md-2 mb-4">
                                <ul class="list-group mb-3">
                                    <li class=" d-flex justify-content-between lh-condensed p-2">
                                        <div>
                                            <a class="btn btn-success" href="add_house.jsp"><strong>Add news</strong></a>
                                        </div>                               
                                    </li>
                                    <li class=" d-flex justify-content-between lh-condensed p-2">
                                        <div>
                                            <a class="btn btn-warning" href="all_house.jsp?userId=${admin.id}"><strong>All news</strong></a>
                                        </div>                               
                                    </li>
                                    <li class=" d-flex justify-content-between lh-condensed p-2">
                                        <div>
                                            <a class="btn btn-danger" href="edit_account.jsp?userId=${admin.id}"><strong>Edit Account</strong></a>
                                        </div>                               
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container">
            <hr class="mb-4">
            <h2 class="text-center">Your News</h2>
            <div class="row">
                <%
                    HouseDAO dao = new HouseDAO();
                    int id = Integer.parseInt(request.getParameter("userId"));
                    List<House> houseOfAdmin = dao.get4HouseByUserId(id);
                    request.setAttribute("houseOfAdmin", houseOfAdmin);
                    if (houseOfAdmin != null) {
                %>
                <c:forEach var="house" items="${houseOfAdmin}">
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">
                                <a href="<c:url value='../house_infor.jsp'/>?id=<c:out value='${house.id}' />&userId=<c:out value='${admin.id}' />">
                                    <img src="<c:url value='../getImage.jsp'/>?id=<c:out value='${house.id}' />" class="main-img" alt="#" style="width: 250px; height: 200px">
                                </a>
                            </div>
                            <div class="product-title">
                                <h5><c:out value='${house.name}' /></h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <%
                    }
                %>
            </div>
        </div>
        <hr class="mb-4">
        <%@include file="components/footer.jsp" %>
        <%}%>
    </body>
</html>
