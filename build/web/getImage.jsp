<%@page import="Entity.House"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="Connection.DBConnect"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.id = :id";
        TypedQuery<House> q = em.createQuery(query, House.class);
        q.setParameter("id", id);
        House house = null;
        try {
            house = q.getSingleResult();
            byte byteArray[] = house.getImageUrl();
//            Blob blob = house.getImageUrl();
//            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } catch (Exception e) {
        
        }
    } catch (Exception e) {
        out.println(e);
    }
%>