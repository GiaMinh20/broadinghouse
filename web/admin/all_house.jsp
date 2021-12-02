<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@page import="Entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp" %>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Nha tro: Admin</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <c:if test="${not empty DeleteMsg }">
            <script>
                alert("${DeleteMsg}");
            </script>
            <c:remove scope="session" var="DeleteMsg" />
        </c:if>
        <%            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            if (admin == null) {
                String redirectURL = "../login.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th></th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Description</th>
                    <th scope="col">Location</th>
                    <th scope="col">Category</th>
                    <th scope="col"><a href="../admin/home.jsp?userId=${admin.id}" class="btn btn-success">Back</a></th>
                </tr>
            </thead>
            <tbody>
                <%
                    HouseDAO dao = new HouseDAO();
                    int id = Integer.parseInt(request.getParameter("userId"));
                    List<House> allHouseOfAdmin = dao.getAllHouseByUserId(id);
                    if (allHouseOfAdmin != null) {
                        request.setAttribute("allHouseOfAdmin", allHouseOfAdmin);
                        for (House allhouse : allHouseOfAdmin) {
                %>
                <tr>
                    <td></td>
                    <td><img src="<c:url value='../getImage.jsp'/>?id=<c:out value='<%=allhouse.getId()%>' />" style="width: 50px;height: 50px" alt="#"></td>
                    <td><c:out value='<%=allhouse.getName()%>' /></td>
                    <td><c:out value='<%=allhouse.getPrice()%>' /></td>
                    <td style="max-width: 300px"><c:out value='<%=allhouse.getDesciption()%>' /></td>
                    <td><c:out value='<%=allhouse.getLocation()%>' /></td>
                    <td><c:out value='<%=allhouse.getCategory()%>' /></td>
                    <td>
                        <a href="edit_house.jsp?id=<c:out value='<%=allhouse.getId()%>' />" class="btn btn-sm btn-primary"><i class="fas fa-edit " ></i></a>
                        <a href="../deleteHouse?id=<c:out value='<%=allhouse.getId()%>' />&userId=${admin.id}"  class="btn btn-sm btn-danger"><i class="fas fa-trash-alt " ></i></a>
                    </td>
                </tr>
                <%
                    } }
                %>
                    
                
            </tbody>
        </table>
        <%
            }
        %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
