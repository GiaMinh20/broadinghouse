<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp"%>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Register</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <form action="register" method="post">
                                <c:if test="${not empty existsUser }">
                                    <p class="text-danger"><i>${existsUser}</i></p>
                                            <c:remove scope="session" var="existsUser" />
                                        </c:if>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">First Name</label> <input
                                        type="text" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required"
                                        name="firstName">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Last Name</label> <input
                                        type="text" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required"
                                        name="lastName">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label> <input
                                        type="text" class="form-control" 
                                        pattern="(\+84|0)\d{9,10}" 
                                        required="required" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email </label> <input
                                        type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Address </label> <input
                                        type="text" class="form-control"  required="required" name="address">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label> <input
                                        type="password" class="form-control" 
                                        title="Password must be 8 characters including 1 uppercase letter, 1 lowercase letter and numeric characters"
                                        required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                                        required="required" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Confirm Password</label> <input
                                        type="password" class="form-control" id="exampleInputPassword1"
                                        required="required" name="confirmPassword">
                                </div>
                                <button type="submit" class="btn btn-success">Register</button>
                                <div>
                                    <span>You already account, login now</span> <a
                                        class="btn btn-primary" href="login.jsp">Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>