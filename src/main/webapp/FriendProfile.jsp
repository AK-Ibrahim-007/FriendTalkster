<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection/myconnection.jsp"%>
<!DOCTYPE html>
<%   if (session.getAttribute("email") == null) {
      response.sendRedirect("login.jsp");
   }
%>
<%
   String name = "", mail = "", phone = "", gender = "", address = "", dob = "", image = "";
   try {
      String email = request.getParameter("email");
      PreparedStatement ps = con.prepareStatement("Select * from signup where email='" + email + "'");
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         name = rs.getString("name");
         mail = rs.getString("email");
         phone = rs.getString("mobile");
         gender = rs.getString("gender");
         address = rs.getString("address");
         dob = rs.getString("dob");
         image = rs.getString("image");
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      con.close();
   }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Friend Profile</title>
        <%@include file="component/css_js_bt.jsp"%>
        <style>
            .container{
                margin-top: 50px;
            }
            .card{
                min-width:350px;
                max-width:350px;
            }
            input{
                background: none;
                outline: none;
                border: none;
            }

        </style>

    </head>
    <body class="fst-normal">
        <div class="container">
            <div class="row">
                <div class="col-md-5 text-center">
                    <div class="card bg-dark" style="margin-left: 50px">
                        <img src="Images/<%=image%>" class="card-img" alt="...">                 
                    </div><br>
                    <button type="button" class="btn btn-success">Message</button>
                    <button type="button" class="btn btn-danger">Delete Friend</button>
                </div>
                <div class="col-md-7">
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Name : <%=name%>.</label></span>
                    </div><hr>
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Email : <%=mail%>.</label></span>
                    </div><hr>
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Phone : <%=phone%>.</label></span>
                    </div><hr>
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Gender :<%=gender%>.</label></span>
                    </div><hr>
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Address : <%=address%>.</label></span>
                    </div> <hr>            
                    <div class="col-auto">
                        <span style="font-size: 20px;"> <label for="inputtext" class="col-form-label">Date of Birth : <%=dob%></label></span>
                    </div>  <hr>           
                </div>
            </div>
        </div>
    </body>
</html>
