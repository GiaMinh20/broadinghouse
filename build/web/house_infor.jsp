<%@page import="Entity.User"%>
<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@page import="DAO.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>House information</title>
        <%@include file="components/css.jsp" %>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');

        *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
        }
        body{
            line-height: 1.5;
        }
    </style>
    <body style="background-color: #f0f1f2">
        <%@include file="components/navbar.jsp" %>
        <%            
            int hid = Integer.parseInt(request.getParameter("id"));
            UserDAO _userDAO = new UserDAO();
            HouseDAO dao = new HouseDAO();
            House house = dao.getHouseById(hid);
            User user = _userDAO.getUserById(house.getUserId());

        %>

        <div class="card-wrapper">
            <div class="cards">
                <!-- card left -->
                <div class="product-imgs">
                    <div class="img-display">
                        <div class="img-showcase">
                            <img class="img-house-infor" src=" <c:url value='getImage.jsp'/>?id=<%=hid%>" alt="<%=house.getImageUrl()%>">
                        </div>
                    </div>
                </div>
                <!-- card right -->
                <div class="product-content">
                    <h2 class="product-title"><%=house.getName()%></h2>
                    <div class="product-price">
                        <p class="last-price">Price: <span>$ <%=house.getPrice()%></span></p>
                    </div>

                    <div class="product-detail">
                        <h2>about this item: </h2>
                        <p><%=house.getDesciption()%></p>

                        <ul>
                            <li>Location: <span><%=house.getDetailLocation()%>, <%=house.getLocation()%></span></li>
                            <li>Category: <span><%=house.getCategory()%></span></li>
                            <li>Author: <span><%=user.getLastname()%> <%=user.getFirstname()%></span></li>
                            <li>Email contact: <span><%=user.getEmail()%> </span></li>
                            <li>Phone contact: <span><%=user.getPhone()%></span></li>
                        </ul>
                    </div>

                    <div class="purchase-info">
                        <a href="<c:url value='rent.jsp?id='/><%=house.getId()%>&userId=${admin.id}">
                            <button type="button" class="btn" style="max-width: 200px;">
                                Rent <i class="fas fa-shopping-cart"></i>
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>