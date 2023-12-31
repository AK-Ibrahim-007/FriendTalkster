<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FriendGalaxy : Home</title>
        <%@include file = "component/css_js_bt.jsp"%>
        <style>
            *{
                padding: 0;
                margin: 0;
            }
            .heading{
                /*position: relative;*/
                animation: head 4s 1;
            }
            .para{
                animation:para  4s 1;
            }
            @keyframes head{
                0%{
                    color: grey;
                    margin-bottom:100px;
                }
                30%{
                    letter-spacing:20px;

                }
            }
            @keyframes para{
                0%{
                    color: grey;
                    /*margin-top:100px;*/
                }
                30%{
                    letter-spacing:3px;

                }
            }

        </style>
    </head>
    <body class="bg text-center">
        <div class="container">
            <h1 class="heading" style='padding-top: 100px;'>Welcome to Friend Galaxy</h1>
            <p class='para'style='font-size: 19px; letter-spacing: 1px'>In This Galaxy You Can search your friend if he/she register here and<br> you can communicate to each other this galaxy provide you best zone to talk to your friend</p>
            <br>
            <br>
            <a type="button" href="login.jsp"class="btn btn-outline-warning" style="width: 110px;">Login</a>&nbsp;

            <a href="signup.jsp" type="button" class="btn btn-outline-info" style="width: 110px;">Register</a>
        </div>
    </body>
</html>
