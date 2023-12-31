<%@include file="../connection/myconnection.jsp"%>
<%   String email = session.getAttribute("email") + "";
   ResultSet rs;
   try {
      PreparedStatement ps = con.prepareStatement("select s.name,s.image,fr.* from friendrequestlist fr ,signup s where s.email=fr.requestfrom and requestto='" + email + "'");
      rs = ps.executeQuery();
      while (rs.next()) {
%>
<hr>
<div class="searchFriend">
    <div class="instant-search-title" style="color: white; ">
        <img src="Images/<%=rs.getString("image")%>" style="border: 2px solid white; cursor: pointer" class="rounded-circle" width="50px" height="50px" alt="profile image"/>&nbsp;&nbsp;
        <span style="cursor: default"><%=rs.getString("name")%></span>
    </div><br>
    <p class="instant-searc__paragraph">
        <button type="button"class="btn btn-outline-info" onclick="confirmFriend('<%=rs.getString("friendrequestid")%>')">Confirm</button>&nbsp;
        <button type="button" class="btn btn-outline-info" onclick="deleteFriendRequest('<%=rs.getString("friendrequestid")%>')">Delete</button>
    </p>  
</div><hr>

<%
      }
      rs.close();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }


%>
