<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection/myconnection.jsp" %>
<%  
   String email = session.getAttribute("email") + "";
   String name = "";
   String address = "";
   String phone = "";
   String dob = "";
   String image = "";
   if (session.getAttribute("email") == null) {
      response.sendRedirect("login.jsp");
   } else {
      PreparedStatement ps = con.prepareStatement("select * from signup where email=?");
      ps.setString(1, email);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
         name = rs.getString("name");
         address = rs.getString("address");
         phone = rs.getString("mobile");
         dob = rs.getString("dob");
         image = rs.getString("image");

      }
   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Details</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <%--<%@include file = "component/css_js_bt.jsp"%>--%> 
        <style type="text/css">
            .avatar{
                width:200px;
                height:200px;
            }
            body{
                background:linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6) ), url('Images/bggalaxy.jpg');
                color:white;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>      
        <div class="container bootstrap snippets bootdey">
            <h1 class="text-primary">Edit Profile</h1>
            <hr style="border-style: 0.01em; border-color: grey">

            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <form method="post" action="" enctype="multipart/form-data">         
                        <div class="text-center">
                            <img src="Images/<%=image%>" class="avatar img-circle img-thumbnail" alt="avatar">
                            <h6>Upload a different photo...</h6>
                            <input type="file" name="image" id="image" class="form-control">
                        </div><br>
                        <div class="text-center"><button type="button" onclick="updateProfilePic()"class="btn btn-primary">Change Profile Picture</button></div>
                    </form>
                </div>

                <!-- edit form column -->

                <div class="col-md-9 personal-info">  
                    <form class="form-horizontal" role="form" id="myform">
                        <h3>Personal info</h3>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="name" id="name" type="text" value="<%=name%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email:</label>
                            <div class="col-lg-8">
                                <input class="form-control" disabled name="email" id="email" type="text" value="<%=email%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="phone" type="text" id="phone" value="<%=phone%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address:</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="address"type="text" id="address" value="<%=address%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Date of Birth:</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="dob" id="dob" type="text" value="<%=dob%>">
                            </div>
                        </div> 
                        <div class="text-center"><button type="button" onclick="updateProfile()"class="btn btn-primary">Update Profile</button></div>
                    </form>
                </div>
            </div>

            <div id="q"></div>
            <hr style="border-style: 0.01em; border-color: grey">
        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">
        </script>
        <script>
            function updateProfile() {
                var name = document.getElementById("name").value;
                var email = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var address = document.getElementById("address").value;
                var dob = document.getElementById("dob").value;
                var hr = new XMLHttpRequest();
                var t = Math.random();
                hr.onreadystatechange = function () {
                    if (hr.readyState === 4) {
                        alert(hr.responseText);
                        location.reload();
                    }
                };
                hr.open("post", "ajax/updateProfile.jsp?t=" + t + "&name=" + name + "&email=" + email + "&phone=" + phone + "&address=" + address + "&dob=" + dob);
                hr.send();
            }
            function updateProfilePic() {
                var fd = new FormData();
                var files = $('#image')[0].files[0];
                var name = "ibrahim";
                fd.append('file', files);
                $.ajax({
                    type: "post",
                    url: "ajax/ChangeProfilePic.jsp?name=" + name,
                    enctype: 'multipart/form-data',
                    data: fd,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        alert(response);
                        location.reload();
                    }
                });
            }
        </script>
    </body>
</html>


