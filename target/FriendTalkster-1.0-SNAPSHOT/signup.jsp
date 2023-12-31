<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup FriendTalkster</title>
        <%@include file = "component/css_js_bt.jsp"%> 
        <script type="text/javascript">
            function saveSignup()
            {
                var name = document.getElementById("name").value;
                var mobile = document.getElementById("mobile").value;
                var email = document.getElementById("email").value;
                var pwd = document.getElementById("pwd").value;
                var cpwd = document.getElementById("cpwd").value;
                var address = document.getElementById("address").value;
                var dob = document.getElementById("dob").value;
                var gen = "";
                if (document.getElementById("r1").checked) {
                    gen = "male";
                } else if (document.getElementById("r2").checked) {
                    gen = "female";
                }
                if (name == "")
                {
                    alert("Enter your Name");
                    document.getElementById("name").focus();
                } else if (mobile == "")
                {
                    alert("Enter your Mobile Number");
                    document.getElementById("mobile").focus();
                } else if (email == "")
                {
                    alert("Enter your Email Id");
                    document.getElementById("email").focus();
                } else if (pwd == "")
                {
                    alert("Enter your password");
                    document.getElementById("pwd").focus();
                } else if (pwd !== cpwd)
                {
                    alert("Enter both  correct password");
                    document.getElementById("pwd").focus();
                } else if (address == "")
                {
                    alert("Enter your Address");
                    document.getElementById("address").focus();
                } else if (dob == "") {
                    alert("Choose your date of birth");
                } else if (document.getElementById("r1").checked == false && document.getElementById("r2").checked == false) {
                    alert("choose your gender");
                } else
                {
                    var s = new XMLHttpRequest();
                    var t = Math.random();
                    s.onreadystatechange = function ()
                    {
                        if (s.readyState == 4)
                        {
                            document.getElementById("message").innerHTML = s.responseText;
                            document.getElementById("name").value = "";
                            document.getElementById("mobile").value = "";
                            document.getElementById("email").value = "";
                            document.getElementById("pwd").value = "";
                            document.getElementById("cpwd").value = "";
                            document.getElementById("address").value = "";
                            document.getElementById("dob").value = "";
                            document.getElementById("name").focus();
                        }
                    };
                    s.open("post", "ajax/savesignup.jsp?t=" + t + "&name=" + name + "&mobile=" + mobile + "&email=" + email + "&pwd=" + pwd + "&address=" + address + "&dob=" + dob + "&gen=" + gen);
                    s.send();
                }
            }
        </script>
    </head>
    <body>      
        <div class="container sign">
            <div class="header">
                <a href="Home.jsp"style="text-align: center"><i class="fa fa-home" style="color:white;font-size: 20px;cursor: pointer;" aria-hidden="true"></i></a>
                <h2 style="text-align: center">Register Here !!</h2>
            </div>   
            <div class="contenar text-center"id="message"></div>
            <div class="row">
                <div class="col-sm-6">
                    <label>Name:</label><br>
                    <input type="text" placeholder="Enter Your Name.." id="name" autofocus class="form-control" width="50%">
                    <br>
                    <label>Mobile:</label><br>
                    <input type="Number" placeholder="Enter Your Mobile Number.." id="mobile" class="form-control">
                    <br>
                    <label>Address:</label><br>
                    <input type="text" placeholder="Enter Your Address.." id="address" class="form-control"><br>
                    <label>Date of birth:</label><br>
                    <input type="date"  id="dob" class="form-control">

                </div>
                <div class="col-sm-6">
                    <label for="email">Email:</label><br>
                    <input type="email" placeholder="Enter Your Email.." id="email" class="form-control">
                    <br>
                    <label>Password:</label><br>
                    <input type="password" placeholder="Enter Your password" id="pwd" class="form-control">
                    <br>                
                    <label>Confirm Password:</label><br>
                    <input type="password" placeholder="confirm your password" id="cpwd" class="form-control"><br>
                    <label>gender:</label><br>
                    Male&nbsp;<input type="radio" name="gen" id="r1"  value="male">
                    Female&nbsp;<input type="radio" name="gen" id="r2"  value="female">
                </div> 
            </div>       
            <br>
            <div class="text-center p-3"> 
                <button type="button" id="button" onclick="saveSignup()" class="btn btn-outline-warning" style="width: 100px;">SignUp</button>              
            </div>
        </div>
    </body>
</html>
