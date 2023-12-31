<%@include file="../connection/myconnection.jsp" %>
<%   String email = session.getAttribute("email") + "";
   String addFriend = "", disable = "";
   PreparedStatement ps, ps1, ps2;
   ResultSet rs, rs1, rs2;
   String frName = request.getParameter("frName");
   try {
      ps = con.prepareStatement("select * from signup Where name like '%" + frName + "%' and  NOT email='" + email + "'");
      rs = ps.executeQuery();
      while (rs.next()) {
         addFriend = "Add Friend";
         disable = "";

         ps1 = con.prepareStatement("select * from friendrequestlist where requestto=? and requestfrom=?");
         ps1.setString(1, rs.getString("email"));
         ps1.setString(2, email);
         rs1 = ps1.executeQuery();

         ps2 = con.prepareStatement("select * from friendslist where useremail=? and friendmail=?");
         ps2.setString(1, email);
         ps2.setString(2, rs.getString("email"));
         rs2 = ps2.executeQuery();

         if (rs1.next()) {
            addFriend = "Request Already Send";
            disable = "disabled";
            rs1.close();
         } else if (rs2.next()) {
            addFriend = "Already friend";
            disable = "disabled";
            rs2.close();
         }
%>
<hr>
<div class="searchFriend">
    <div class="instant-search-title" style="color: white; ">
        <img src="Images/<%=rs.getString("image")%>" style="border: 2px solid white; cursor: pointer" class="rounded-circle" width="50px" height="50px" alt="profile image"/>&nbsp;&nbsp;
        <span style="cursor: default"><%=rs.getString("name")%></span>
    </div><br>
    <p class="instant-searc__paragraph">
        <button type="button" <%=disable%> class="btn btn-outline-info" onclick="sendRequest('<%=rs.getString("email")%>')"><%=addFriend%></button>&nbsp;
        <button type="button" class="btn btn-outline-info">message</button>
    </p>  
</div><hr>
<%      }
      rs.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }


%>