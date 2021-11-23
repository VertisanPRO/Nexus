<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	var url = "https://api.minetools.eu/ping/{if isset($OPAL_MCSERVER_IP)}{$OPAL_MCSERVER_IP}{else}mc.hypixel.net{/if}/{if isset($OPAL_MCSERVER_PORT)}{$OPAL_MCSERVER_PORT}{else}25565{/if}";

	$.getJSON(url, function (r) {
		//data is the JSON string
		if (r.error) {
			$('#playercounter').html('Server Offline');
			return false;
		}
		$('#playercounter').html((/§(.+?)/gi, '') + 'Players Online: ' + r.players.online);
		$('#favicon').attr('src', r.favicon);

	});
</script>