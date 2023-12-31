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
        hr.open("get", "search.jsp?t=" + t + "&frName=" + frName);
        hr.send();
    }
</script>
