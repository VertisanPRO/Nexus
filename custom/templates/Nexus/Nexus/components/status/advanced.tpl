<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	var url = "https://api.minetools.eu/ping/{if isset($OPAL_MCSERVER_IP)}{$OPAL_MCSERVER_IP}{else}mc.hypixel.net{/if}/{if isset($OPAL_MCSERVER_PORT)}{$OPAL_MCSERVER_PORT}{else}25565{/if}";

	$.getJSON(url, function(r) {
		//data is the JSON string
		if (r.error) {
			$('#rest').html('Server Offline');
			return false;
		}
		var pl = '';
		if (r.players.sample.length > 0) { pl = '<br>OP: ' + r.players.sample[0].name; }
		$('#rest').html(r.description.replace(/§(.+?)/gi, '') + '<br><b>Players Online:</b> ' + r.players.online + pl);
		$('#favicon').attr('src', r.favicon);

	});
</script>