<%@page import="java.util.GregorianCalendar, java.util.Calendar" %>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);
%>
</div>
<footer id="footer">

    <div class="footer-top">

        <div class="container">

            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <h3>Boarding House UTE</h3>
                    <p>Using our site will make it easier for you to find a place to stay, and we'll make you happy</p>
                </div>
            </div>
            <div class="social-links">
                <h5>&copy; Copyright <%= currentYear%> Design and Developed by Group 1</h5>            
            </div>
        </div>
    </div>
</footer>