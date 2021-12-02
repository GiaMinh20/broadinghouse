<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.House"%>
<%@page import="DAO.HouseDAO"%>
<%@page import="Entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Add House</title>        
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <%@include file="components/css.jsp" %>
        <style>
        #body{background: #fff9c4 ;}
        #inputPrice{width: 200px; display: inline-block;margin-left: 23px;}
        #inputTitle{width: 39rem; display: inline-block;margin-left: 29px;}
        #inputDesc{min-height: 150px}
    </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            if (admin == null) {
                String redirectURL = "../login.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit house</h4>
                            <form action="../editHouse" method="post" enctype="multipart/form-data">
                                <%
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    HouseDAO dao = new HouseDAO();
                                    House house = dao.getHouseById(id);
                                %>
                                <input type="hidden" name="userId" value="<c:out value='${admin.id}' />">
                                <input type="hidden" name="id" value="<%=house.getId()%>">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Title</label>
                                    <input type="text" class="form-control" id="inputTitle" 
                                           required="required" 
                                           name="name" value="<%=house.getName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price</label>
                                    <input type="number" class="form-control" id="inputPrice" 
                                           required="required" min="100" step="100"
                                           name="price" value="<%=house.getPrice()%>">
                                </div>
                                <div class="form-group" >
                                    <label for="exampleInputEmail1">Description</label>
                                    <textarea type="text" class="form-control" aria-describedby="emailHelp" required="required" name="description" style="min-height: 150px"><%=house.getDesciption()%></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="imageUrl">
                                </div>
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button class="btn btn-danger"><a href="home.jsp?userId=${admin.id}" >Cancel</a></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <%@include file="components/footer.jsp" %>
    </body>
</html>