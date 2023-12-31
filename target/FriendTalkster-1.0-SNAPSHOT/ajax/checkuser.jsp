<%@include file="../connection/myconnection.jsp" %>
<%   try {
      Thread.sleep(2000);
      PreparedStatement ps = con.prepareStatement("select * From signup where email=? and password=?");
      ps.setString(1, request.getParameter("user"));
      ps.setString(2, request.getParameter("pwd"));
      ResultSet rs = ps.executeQuery();
      String msg = "";
      if (rs.next()) {
         msg = "valid user";
         session.setAttribute("email", request.getParameter("user"));
         out.print(msg);
      } else {
         msg = "not valid user";
      }
      if (msg == "not valid user") {

%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Not Valid User!</strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%   }
      rs.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>