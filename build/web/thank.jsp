
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/css.jsp" %>
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Thanks</title>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="jumbotron text-center"style="margin-bottom: 0;padding: 2.5rem 1rem;">
            <h1 class="display-3">Thank you for rent my house!</h1>
            <br>
            <p class="lead"><h3>Your order has been sent </h3></p>

            <hr>
            <p>
                Click Continue to return homepage
            </p>
            <p class="lead">
                <a class="btn btn-primary btn-sm" href="<c:url value='index.jsp' />?userId=<c:out value="${admin.id}" />" role="button">Continue to homepage</a>
            </p>
        </div>

    <%@include file="components/footer.jsp" %>
</body>
</html>
