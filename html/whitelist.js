$(function() {
	$('#whitelistScreen').hide();
	
	window.addEventListener('message', function(event) {
        var item = event.data;

        if (item.command && item.command == 'blockPlayer') {
            $('#whitelistScreen').show();
			$('#whitelistText').html('<span style="color:red;">Access denied.</span> You are not on the whitelist.');
        }
    }, false);
});