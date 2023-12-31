<%@include file="../connection/myconnection.jsp" %>
<%   try {
      PreparedStatement ps = con.prepareStatement("insert into signup(name,email,mobile,password,address,dob,gender,image)values(?,?,?,?,?,?,?,?)");
      ps.setString(1, request.getParameter("name"));
      ps.setString(2, request.getParameter("email"));
      ps.setString(3, request.getParameter("mobile"));
      ps.setString(4, request.getParameter("pwd"));
      ps.setString(5, request.getParameter("address"));
      ps.setString(6, request.getParameter("dob"));
      ps.setString(7, request.getParameter("gen"));
      if (request.getParameter("gen").equals("male")) {
         ps.setString(8, "samplem.png");
      } else if (request.getParameter("gen").equals("female")) {
         ps.setString(8, "samplef.png");
      }
      ps.executeUpdate();
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Successfully Register!</strong> 
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>