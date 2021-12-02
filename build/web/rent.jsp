<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Rent</title>
        <%@include file="components/css.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            if (admin == null) {
                String redirectURL = "login.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <div class="container">
            <div class="contact-box">
                <div class="left">
                    <%
                        int hid = Integer.parseInt(request.getParameter("id"));
                        UserDAO _userDAO = new UserDAO();
                        HouseDAO dao = new HouseDAO();
                        House house = dao.getHouseById(hid);
                        User user = _userDAO.getUserById(house.getUserId());

                    %>
                    <div style="margin-top:20px">
                        <h2><%=house.getName()%></h2>
                        <div class="product-img">
                            <img src="<c:url value='getImage.jsp'/>?id=<%=hid%>" alt="" style="width: 400px;height: 270px;">
                        </div>
                    </div>

                    <div class="own-house">
                        <p>Author: <%=user.getLastname()%> <%=user.getFirstname()%></p>
                        <p>Author phone: <%=user.getPhone()%></p>
                        <p>Price: <%=house.getPrice()%></p>
                        <p>Location: <%=house.getDetailLocation()%>. <%=house.getLocation()%></p>
                    </div>
                </div>
                <form action="sendEmail?id=<%=house.getId()%>&userId=${admin.id}" method="post">
                    <div class="right">
                        <h2>Your Information</h2>
                        <input type="text" class="field" name="userName" placeholder="Your Name" required="required" value="<c:out value="${admin.lastname} ${admin.firstname}"/>">
                        <input type="text" class="field" name="userPhone" placeholder="Number phone" pattern="(\+84|0)\d{9,10}" required="required" value="<c:out value="${admin.phone}"/>">
                        <input type="email" class="field" name="userEmail" placeholder="Email"   required="required" value="<c:out value="${admin.email}" />">
                        <input type="text" class="field" name="userAddress" placeholder="Address" required="required" value="<c:out value="${admin.address}"/>">
                        <input type="submit" class="btn btn-primary" value="Confirm">
                    </div>
                </form>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
        <%}%>
    </body>
</html>