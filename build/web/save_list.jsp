<%@page import="Entity.Savedlist"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SavedListDAO"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <%@include file="components/css.jsp" %>
        <title>Saved List</title>
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
        <%
            SavedListDAO savedlistDAO = new SavedListDAO();
            int userId = Integer.parseInt(request.getParameter("userId"));
            List<Savedlist> list = savedlistDAO.getSavedlistByUserId(userId);
            if (list != null) {
        %>
        <table class="table table-striped container cart-page text-center">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Location</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Savedlist saved : list) {
                %>
                <tr>
                    <td>
                        <a href="<c:url value='house_infor.jsp'/>?id=<%=saved.getHid()%>&userId=${admin.id}">
                            <img style="width: 250px" src="<c:url value='getImage.jsp'/>?id=<%=saved.getHid()%>">
                        </a>
                    </td>

                    <td>
                        <p class="cart-title"><%=saved.getHouseName()%></p>
                    </td>

                    <td>
                        <%=saved.getPrice()%> $
                    </td>

                    <td>
                        <%=saved.getLocation()%>
                    </td>

                    <td>
                        <a href="<c:url value="deleteList" />?sid=<%=saved.getSid()%>&userId=${admin.id}"  class="btn btn-sm btn-danger"><i class="fas fa-trash-alt " ></i></a>
                    </td>
                </tr>
                <%}
                } else {
                %>
            <div class="jumbotron text-center bg-white">
                <h1 class="display-3">Your list is empty</h1>
                <p class="lead"><strong>Please return website</strong> and add more new to your list</p>
                <br>
                <p class="lead">
                    <a class="btn btn-primary btn-sm" href="<c:url value='index.jsp' />" role="button">Continue to homepage</a>
                </p>
            </div>
            <% }%>
        </table>
    </div>
    <%}%>
    <%@include file="components/footer.jsp" %>
</body>
</html>
