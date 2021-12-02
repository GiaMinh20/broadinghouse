<%@page import="Entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp"%>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Edit Information</title>
    </head>
    <style>
        #body{background: #fff9c4 ;}
    </style>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            if (admin == null) {
                String redirectURL = "../login.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <div id="body">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 offset-md-4">
                        <div class="card">
                            <div class="card-body">
                                <form action="../editAccount" method="post">
                                    <input type="hidden" value="${admin.id}" name="id">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">First Name</label><input value="${admin.firstname}"
                                                                                                 type="text" class="form-control" id="exampleInputEmail1"
                                                                                                 aria-describedby="emailHelp" required="required"
                                                                                                 name="firstName">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Last Name</label><input value="${admin.lastname}"
                                                                                                type="text" class="form-control" id="exampleInputEmail1"
                                                                                                aria-describedby="emailHelp" required="required"
                                                                                                name="lastName">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Phone Number</label><input value="${admin.phone}"
                                                                                                   type="text" class="form-control" id="exampleInputEmail1"
                                                                                                   pattern="(\+84|0)\d{9,10}" aria-describedby="emailHelp"
                                                                                                   required="required" name="phone">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email </label><input value="${admin.email}" readonly=""
                                                                                             type="email" class="form-control" id="exampleInputEmail1"
                                                                                             aria-describedby="emailHelp" required="required" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Address </label><input value="${admin.address}"
                                                                                               type="text" class="form-control" id="exampleInputEmail1"
                                                                                               aria-describedby="emailHelp" required="required" name="address">
                                    </div>
                                    <button type="submit" class="btn btn-success">Save</button>
                                    <button class="btn btn-danger"><a href="home.jsp?userId=${admin.id}" >Cancel</a></button>
                                    <a class="text-danger" href="<c:url value="change_password.jsp" />?userId=<c:out value="${admin.id}" />" style="margin-left: 1em"><i>Change your password</i></a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <%@include file="components/footer.jsp"%>
    </body>
</html>