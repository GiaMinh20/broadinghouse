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
        <title>Change Password</title>
    </head>
    <body>	
        <%@include file="components/navbar.jsp"%>
        <div class="container p-4">
            <div class="row" style="margin-top: 1.5em">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h2>Change password</h2>
                            <form action="../changePassword" method="post">
                                <input type="hidden" value="${admin.id}" name="id">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>							    
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="newpassword">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Confirm Password</label>							    
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="confirmpassword">
                                </div>
                                <c:if test="${not empty ChangeFailed }">
                                    <p class="text-danger"><i>${ChangeFailed}</i></p>
                                            <c:remove scope="session" var="ChangeFailed" />
                                        </c:if>
                                <button type="submit" class="btn btn-success">Change</button>
                                <button class="btn btn-danger"><a href="home.jsp?userId=${admin.id}" >Cancel</a></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>