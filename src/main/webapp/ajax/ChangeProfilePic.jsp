<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@include file="../connection/myconnection.jsp"%>
<%    
    String email = session.getAttribute("email") + "";
    String newEname = email.substring(0, email.indexOf("@"));
    String root = getServletContext().getRealPath("/") + "Images";
    MultipartRequest mr = new MultipartRequest(request, root, 1024 * 1024 * 500);
    String name = mr.getOriginalFileName("file");   
    String extention = name.substring(name.indexOf("."));    
    File file = new File(root + "/" + name);
    File rename = new File(root + "/" + newEname + extention);
    if (rename.exists()) {
      rename.delete();
   }
   file.renameTo(rename);
   try {
      PreparedStatement ps = con.prepareStatement("Update signup set image=? Where email=?");
      ps.setString(1, newEname + extention);
      ps.setString(2, email);
      ps.executeUpdate();
      out.print("Change successfully");
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>