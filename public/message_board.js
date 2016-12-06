$(document).ready(function () {
    create_message = function (ev, url) {
        var content = $('#new_message').val();
        var user_id = $('#user_id').val();
        url = "/messages?content=" + encodeURIComponent(content) + "&user_id=" + encodeURIComponent(user_id)
        $.post( url, refresh_log);
    }
    $("#create_message").click(create_message);
    $('#new_message').keypress(function (e) {
        if (e.which == 13 && this.value.length > 0) {
            $("#create_message").click();
            return false;
        }
    });
    refresh_log = function (ev) {
        url = "/messages"
        $("#message_log").load(url, function (responseTxt, statusTxt, xhr) {
            if (statusTxt == "error")
                alert("Error: " + xhr.status + ": " + xhr.statusText);
        });
    }
    
    setInterval(refresh_log,1000);
});