<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	var url = "https://api.minetools.eu/ping/{$MINECRAFTIP}/{$MINECRAFTPORT}";

	$.getJSON(url, function (r) {
		if (r.error) {
			$('#minecraftplayers').html('Server Offline');
			return false;
		}
		$('#minecraftplayers').html((/§(.+?)/gi, '') + 'Players Online: ' + r.players.online);
	});
</script>