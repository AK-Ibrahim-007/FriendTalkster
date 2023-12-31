<%@include file="../connection/myconnection.jsp"%>
<%   String email = session.getAttribute("email") + "";
   try {
      PreparedStatement ps = con.prepareStatement("Select s.email,s.name,s.image,fr.* from friendslist fr,signup s where s.email=fr.useremail and friendmail='" + email + "'");
      ResultSet rs = ps.executeQuery();
      String name = "", image = "";
      while (rs.next()) {
         name = rs.getString("name");
         image = rs.getString("image");
%>
<div class="rounded-pill mt-2 p-1 profile-image">
    <a href='FriendProfile.jsp?email=<%=rs.getString("email")%>' style="text-decoration: none; color: white" >
        <img src="Images/<%=image%>" style="border: 2px solid white;" class="rounded-circle" width="50px" height="50px" alt="profile image"/>&nbsp;&nbsp;
        <span  class=" fs-5"><%=name%></span>
    </a>                
</div>

<%
      }
      rs.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>