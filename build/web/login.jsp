<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp" %>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Login</title>
    </head>
    <body>	
        <%@include file="components/navbar.jsp"%>
        <div class="container p-4">
            <div class="row">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h2>Login</h2>
                            <form action="Login" method="post">
                                <input type="hidden" name = "action" value="login">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label> 
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>							    
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                                </div>
                                <c:if test="${not empty LoggedFailed }">
                                    <p class="text-danger"><i>${LoggedFailed}</i></p>
                                            <c:remove scope="session" var="LoggedFailed" />
                                        </c:if>
                                <button type="submit" class="btn btn-success">Login</button>
                                <div>
                                    <span>You haven't account, register now</span> 
                                    <a class="btn btn-primary" href="register.jsp">Register</a>
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