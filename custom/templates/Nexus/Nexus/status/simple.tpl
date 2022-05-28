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