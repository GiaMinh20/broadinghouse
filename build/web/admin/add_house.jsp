<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@page import="Entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="https://img.icons8.com/color/50/000000/3d-recycle-center.png" type="image/x-icon">
        <title>Add House</title>
        <%@include file="components/css.jsp" %>
    </head>
    <style>
        #body{background: #fff9c4 ;}
        #inputCategory{width: 200px; display: inline-block;margin-left: 2.6rem;}
        #inputPrice{width: 200px; display: inline-block;margin-left: 3.3rem;}
        #inputTitle{width: 37rem; display: inline-block;margin-left: 3.7rem;}
        #inputDetailLocation{width: 37rem; display: inline-block;margin-left: 1.8rem;}
        #inputDesc{min-height: 150px}
    </style>
    <body>
        <%@include file="components/navbar.jsp" %>
        <c:if test="${not empty AddMsg }">
            <script>
                alert("${AddMsg}");
            </script>
            <c:remove scope="session" var="AddMsg" />
        </c:if>
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
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="text-center">Add house</h4>
                                <form action="../addHouse" method="post" enctype="multipart/form-data">
                                    <input type="hidden" value="<c:out value="${admin.id}" />" name="userId">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Title</label>
                                        <input type="text" class="form-control" id="inputTitle" required="required" name="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Price</label>
                                        <input type="number" class="form-control" required="required" name="price" id="inputPrice" min="100" step="100">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Location</label>
                                        <input type="text" class="form-control" required="required" name="detailLocation" id="inputDetailLocation">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">District</label>
                                        <select class="form-control" id="inputCategory" name="location">
                                            <option value="1st District" selected>1st District</option>
                                            <option value="2nd District">2nd District</option>
                                            <option value="3rd District">3rd District</option>
                                            <option value="4th District">4th District</option>
                                            <option value="5th District">5th District</option>
                                            <option value="6th District">6th District</option>
                                            <option value="7th District">7th District</option>
                                            <option value="8th District">8th District</option>
                                            <option value="9th District">9th District</option>
                                            <option value="10th District">10th District</option>
                                            <option value="11th District">11th District</option>
                                            <option value="12th District">12th District</option>
                                            <option value="Binh Tan District">Binh Tan District</option>
                                            <option value="Binh Thanh District">Binh Thanh District</option>
                                            <option value="Go Vap District">Go Vap District</option>
                                            <option value="Phu Nhuan District">Phu Nhuan District</option>
                                            <option value="Tan Binh District">Tan Binh District</option>
                                            <option value="Tan Phu District">Tan Phu District</option>
                                            <option value="Thu Duc District">Thu Duc District</option>
                                            <option value="Binh Chanh District">Binh Chanh District</option>
                                            <option value="Can Gio District">Can Gio District</option>
                                            <option value="Cu Chi District">Cu Chi District</option>
                                            <option value="Hoc Mon District">Hoc Mon District</option>
                                            <option value="Nha Be District">Nha Be District</option>
                                        </select>
                                    </div>
                                    <div class="form-group" >
                                        <label for="exampleInputEmail1">Description</label>
                                        <textarea type="text" class="form-control" id="inputDesc" aria-describedby="emailHelp" required="required" name="description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputState">Category</label>
                                        <select class="form-control" id="inputCategory" name="category">
                                            <%
                                                CategoryDAO dao = new CategoryDAO();
                                                List<Category> list = dao.getAllCategories();
                                                for (Category category : list) {
                                            %>
                                            <option value="<c:out value='<%=category.getName()%>' />"><c:out value='<%=category.getName()%>' /></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlFile1">Upload Photo</label>
                                        <input type="file" class="form-control-file" id="exampleFormControlFile1" name="imageUrl">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <button class="btn btn-danger"><a href="home.jsp?userId=${admin.id}" >Cancel</a></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>