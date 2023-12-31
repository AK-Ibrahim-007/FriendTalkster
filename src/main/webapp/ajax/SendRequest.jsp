<%@page import="java.time.LocalDate"%>
<%@include file="../connection/myconnection.jsp"%>
<%   String msg = "";
   ResultSet rs, rs1;
   PreparedStatement ps, ps1;
   String email = session.getAttribute("email") + "";
   String fremail = request.getParameter("fremail");
   try {
      ps = con.prepareStatement("select * from  friendrequestlist where requestfrom=? and requestto=?");
      ps.setString(1, email);
      ps.setString(2, fremail);
      rs = ps.executeQuery();

      ps1 = con.prepareStatement("select * from friendslist where useremail=? and friendmail=?");
      ps1.setString(1, email);
      ps1.setString(2, fremail);
      rs1 = ps1.executeQuery();
      if (rs.next()) {
         msg = "Request Send Already";
         rs.close();
      } else if (rs1.next()) {
         msg = "Already Friend";
         rs1.close();
      } else {
         Date sqldate = Date.valueOf(LocalDate.now());
         ps = con.prepareStatement("insert into friendrequestlist(requestfrom,requestto,requestdate)values(?,?,?)");
         ps.setString(1, email);
         ps.setString(2, fremail);
         ps.setDate(3, sqldate);
         ps.executeUpdate();
         msg = "request success";
      }
      out.print(msg);
      rs.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }


%>