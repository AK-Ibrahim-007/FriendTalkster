<%@include file="connection/myconnection.jsp"%>
<%    String image = "";
    String name = "";
    int count = 0;
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    String email = session.getAttribute("email") + "";
    try {
        PreparedStatement ps = con.prepareStatement("select * from signup where email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            image = rs.getString("image");
            name = rs.getString("name");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file = "component/css_js_bt.jsp"%> 
        <title>Friend Galaxy</title>
        <script type="text/javascript">
            function loadFriend() {
                var frName = document.getElementById("frName").value;
                var hr = new XMLHttpRequest();
                var t = Math.random();
                hr.onreadystatechange = function () {
                    if (hr.readyState === 4) {
                        document.getElementById("frList").innerHTML = hr.responseText;
                    }
                };
                hr.open("get", "ajax/search.jsp?t=" + t + "&frName=" + frName);
                hr.send();
            }
            function sendRequest(fremail) {

                var t = Math.random();
                var r = new XMLHttpRequest();
                r.onreadystatechange = function () {
                    if (r.readyState === 4) {
                        loadFriend();
                        alert(r.responseText);
                    }
                };
                r.open("post", "ajax/SendRequest.jsp?=" + t + "&fremail=" + fremail);
                r.send();
            }
            function friendRequestList() {
                var t = Math.random();
                var r = new XMLHttpRequest();
                r.onreadystatechange = function () {
                    if (r.readyState === 4) {
                        document.getElementById("cnfrFriend").innerHTML = r.responseText;
                    }
                };
                r.open("post", "ajax/ConfirmFriendList.jsp?=" + t);
                r.send();
            }
            function confirmFriend(friendrequestid) {

                var t = Math.random();
                var r = new XMLHttpRequest();
                r.onreadystatechange = function () {
                    if (r.readyState === 4) {
                        alert(r.responseText);
                        deleteFriendRequest(friendrequestid);
                        reloadCount();
                        window.location.reload(true);
                    }
                };
                r.open("post", "ajax/AcceptFriend.jsp?=" + t + "&friendrequestid=" + friendrequestid);
                r.send();
            }
            function deleteFriendRequest(friendrequestid) {
                var t = Math.random();
                var r = new XMLHttpRequest();
                r.onreadystatechange = function () {
                    if (r.readyState === 4) {
                        friendRequestList();
                    }
                };
                r.open("post", "ajax/deleteFriendRequest.jsp?=" + t + "&friendrequestid=" + friendrequestid);
                r.send();
            }
            function friendList() {
                var hr = new XMLHttpRequest();
                var t = Math.random();
                hr.onreadystatechange = function () {
                    if (hr.readyState === 4) {
                        document.getElementById("friendList").innerHTML = hr.responseText;
                    }
                };
                hr.open("post", "ajax/FriendList.jsp?t=" + t);
                hr.send();
            }
            function reloadCount() {
            <%
                PreparedStatement ps1 = con.prepareStatement("Select COUNT(*) from friendrequestlist where requestto=?");
                ps1.setString(1, email);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    count = rs1.getInt(1);
                }

            %>
            }
        </script>
    </head>
    <body onload="friendList(), reloadCount()">      
        <%@include file = "component/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <!--left section-->
                <div class="col-md-3 leftsectionhide mt-1">
                    <div style="position: fixed;"><%@include file="component/leftsectionofindex.jsp"%></div>             
                </div>
                <!--end left section-->
                <!--middle section-->
                <div class="col-md-6" style="border-right: 1px solid gray; border-left:  1px solid gray">
                    <%@include file="component/middlsectionindex.jsp"%></div>
                <!--end middle section-->

                <!--right section-->
                <div class="col-md-3 rightsectionhide">
                    <div style="position: fixed"><h3>Friends List</h3> 
                        <div class="rightsidebar" id="friendList">                   

                        </div> 
                    </div>
                </div>
                <!--end right section-->
                <%@include file="component/modal.jsp"%> 
                </body>
                </html>
                <%   
                    con.close();
                %>