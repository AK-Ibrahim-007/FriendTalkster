<%@page import="java.time.LocalDate"%>
<%@include file="../connection/myconnection.jsp"%>
<%   
   String email = session.getAttribute("email") + "";
   String friendrequestid = request.getParameter("friendrequestid");
   ResultSet rst;
   try {
      PreparedStatement pst = con.prepareStatement("select * from friendrequestlist where  friendrequestid=?");
      pst.setInt(1, Integer.parseInt(friendrequestid));
      rst = pst.executeQuery();
      while (rst.next()) {
         Date sqldate = Date.valueOf((LocalDate.now()));
         PreparedStatement ps = con.prepareStatement("INSERT INTO friendslist(useremail,friendmail,accepteddate) VALUES(?,?,?)");
         ps.setString(1, email);
         ps.setString(2, rst.getString("requestfrom"));
         ps.setDate(3, sqldate);
         ps.executeUpdate();
         PreparedStatement ps1 = con.prepareStatement("INSERT INTO friendslist(useremail,friendmail,accepteddate) VALUES(?,?,?)");
         ps1.setString(1, rst.getString("requestfrom"));
         ps1.setString(2, email);
         ps1.setDate(3, sqldate);
         ps1.executeUpdate();
         out.print("successfully accepted");         
      }
      rst.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>
