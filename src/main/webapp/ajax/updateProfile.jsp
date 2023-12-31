<%@include file="../connection/myconnection.jsp"%>
<%   
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String address = request.getParameter("address");
   String dob = request.getParameter("dob");
   String phone = request.getParameter("phone");
   try {
      PreparedStatement ps = con.prepareStatement("Update signup set name='" + name + "',email='" + email + "',address='" + address + "',mobile='" + phone + "',dob='" + dob + "' where email='" + email + "'");
      ps.executeUpdate();
      out.print("successfully Update");
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }


%>