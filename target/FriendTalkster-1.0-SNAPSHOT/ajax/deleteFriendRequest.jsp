<%@include file="../connection/myconnection.jsp"%>
<%   
   try {
      PreparedStatement ps = con.prepareStatement("DELETE FROM friendrequestlist WHERE friendrequestid=?");
      ps.setInt(1, Integer.parseInt(request.getParameter("friendrequestid")));
      ps.executeUpdate();
      out.print("Successfully delete");
   } catch(Exception e){
      e.printStackTrace();
   } finally {
      con.close();
   }
%>
