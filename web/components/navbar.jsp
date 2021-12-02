<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg" id="my-navbar">
    <div class="container">
        <%
            String id = request.getParameter("userId");
            if (id == null || id == "") {
        %>
        <a class="navbar-brand font-weight-bold brand-color" href="<c:url value='/'/>">Boarding House UTE</a>
        <div class="collapse navbar-collapse" id="my-nav">
            <div class="col-md-6">
                <form class="form-inline my-2 my-lg-0" action="findHouseByLocation" method="post">
                    <div class="form-group">
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
                    <button type="submit" class="btn btn-ouline"><i class="fas fa-search-location fa-2x"></i></button>
                </form>
            </div>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="<c:url value='login.jsp'/>" class="btn btn-primary" style="color: white">Login</a></li>
            </ul>
        </div>
        <%
        } else {
        %>
        <a class="navbar-brand font-weight-bold brand-color" href="<c:url value='/'/>?userId=<c:out value='${admin.id}' />">Boarding House UTE</a>
        <div class="collapse navbar-collapse" id="my-nav">
            <div class="col-md-6">
                <form class="form-inline my-2 my-lg-0" action="findHouseByLocation?userId=${admin.id}" method="post">
                    <div class="form-group">
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
                    <button type="submit" class="btn btn-outline"><i class="fas fa-search-location fa-2x"></i></button>
                </form>
            </div>
            <ul class="navbar-nav ml-auto">
                <li>

                </li>
                <li class="nav-item"><a href="<c:url value='save_list.jsp'/>?userId=<c:out value='${admin.id}' />" class="nav-link">Saved List</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='admin/home.jsp'/>?userId=<c:out value='${admin.id}'/>"><c:out value="${admin.firstname}" /></a>
                </li>
                <form action="Logout" method="post">
                    <button type="submit" class="btn btn-primary">Logout</button>

                </form>
            </ul>
        </div>
        <%
            }
        %>
    </div>
</nav>