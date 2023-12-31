<%--<%@include file="../component/FriendCount.jsp"%>--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">    
        <a class="navbar-brand" href="#">Friend Galaxy</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"><i class='fas fa-home' style='font-size:24px'></i></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="friendRequestList()" data-bs-toggle="modal" data-bs-target="#confirmNewFriend">Request List ( <%=count%> )</a>
                </li>
            </ul>         
            <form class="d-flex">
                <input class="form-control me-2" id="frName" type="search" placeholder="Search" aria-label="Search" >
                <button class="btn btn-outline-warning" type="button" onclick="loadFriend()" data-bs-toggle="modal" data-bs-target="#addNewFriend">Search</button>&nbsp;
                <a href="logout.jsp"><button class="btn btn-primary" type="button">LogOut</button></a>
            </form>
        </div>
    </div>
</nav>
