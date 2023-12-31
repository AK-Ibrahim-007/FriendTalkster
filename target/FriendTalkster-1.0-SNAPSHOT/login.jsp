<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "component/css_js_bt.jsp"%> 
        <title>Login</title>
        <script type="text/javascript">
            function login()
            {
                $(".loader").show();
                $(".main").hide();
                var user = document.getElementById("user").value;
                var pwd = document.getElementById("pwd").value;
                if (user == "")
                {
                    alert("Please enter user id");
                    document.getElementById("name").focus();
                } else if (user == "")
                {
                    alert("Please enter password");
                    document.getElementById("pwd").focus();
                } else
                {
                    var s = new XMLHttpRequest();
                    var t = Math.random();
                    s.onreadystatechange = function ()
                    {
                        if (s.readyState == 4)
                        {
                            document.getElementById("user").value = "";
                            document.getElementById("pwd").value = "";
                            document.getElementById("user").focus();
                            if (s.responseText.trim() == "valid user") {
                                $(".loader").hide();
                                $(".main").show();
                                window.location = "index.jsp";
                            } else
                            {
                                $(".loader").hide();
                                $(".main").show();
                                document.getElementById("message").innerHTML = s.responseText;
                            }
                        }
                    };
                    s.open("post", "ajax/checkuser.jsp?t=" + t + "&user=" + user + "&pwd=" + pwd);
                    s.send();
                }
            }
        </script>
    </head>
    <body>
        <div class="contenar text-center"id="message"></div>
        <div class="container log">         
            <div class="header">
                <a href="Home.jsp"style="text-align: center"><i class="fa fa-home" style="color:white;font-size: 20px;cursor: pointer;" aria-hidden="true"></i></a>
                <h2>Welcome to Login Page</h2>
            </div>
            <div class="main">          
                <span>
                    <i class="fa fa-user"></i>
                    <input type="text" placeholder="Username" id="user">
                </span><br>
                <span>
                    <i class="fa fa-lock"></i>
                    <input type="password" placeholder="Password" id="pwd">
                </span><br>
                <button type="button"  class="btn btn-outline-warning logbtn"onclick="login()">Login</button> 
            </div> 
            <div class="loader" style="margin-top:  10px;text-align: center;padding-bottom:  30px; display: none; ">
                <div class="spinner-border text-warning" "role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <h5>Please wait...</h5>
            </div>
        </div>

    </body>
</html>
