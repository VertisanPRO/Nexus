<!-- Connections Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$CONNECTIONS_PAGE}</h3>
    <div class="card-body">
        <h3 class="text-center">{$DISCORD_LABEL}</h3>
        <form action="" method="POST">
            <div class="form-group">
                <label for="discordView">{$ENABLE_DISCORD_LABEL}</label>
                <select id="inputDiscordView" class="form-control mr-sm-2" name="discordView">
                    <option value="0" {if $DISCORDVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $DISCORDVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="discordID">{$DISCORD_ID_LABEL}</label>
                <input type="text" class="form-control" id="inputDiscordID" name="discordID"
                    placeholder="760945720470667294" value="{$DISCORDID}">
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
        <hr />
        <h3 class="text-center">Minecraft</h3>
        <form action="" method="POST">
            <div class="form-group">
                <label for="minecraftView">{$ENABLE_DISCORD_LABEL}</label>
                <select id="inputMinecraftView" class="form-control mr-sm-2" name="minecraftView">
                    <option value="0" {if $MINECRAFTVIEW eq '0' } selected{/if}>{$DISABLED}</option>
                    <option value="1" {if $MINECRAFTVIEW eq '1' } selected{/if}>{$ENABLED}</option>
                </select>
            </div>
            <div class="form-group">
                <label for="minecraftDomain">{$SERVER_DOMAIN_LABEL}</label>
                <input type="text" class="form-control" id="inputMinecraftDomain" name="minecraftDomain"
                    placeholder="mc.hypixel.net" value="{$MINECRAFTDOMAIN}">
            </div>
            <div class="form-group">
                <label for="minecraftIP">{$IP_ADDRESS_LABEL}</label>
                <input type="text" class="form-control" id="inputMinecraftIP" name="minecraftIP"
                    placeholder="mc.hypixel.net" value="{$MINECRAFTIP}">
            </div>
            <div class="form-group">
                <label for="minecraftPort">{$SERVER_PORT_LABEL}</label>
                <input type="text" class="form-control" id="inputMinecraftPort" name="minecraftPort" placeholder="25565"
                    value="{$MINECRAFTPORT}">
            </div>
            <div class="form-group">
                <label for="minecraftStyle">{$STYLE_LABEL}</label>
                <select id="inputMinecraftStyle" class="form-control mr-sm-2" name="minecraftStyle">
                    <option value="0" {if $MINECRAFTSTYLE eq '0' } selected{/if}>{$SIMPLE_LABEL}</option>
                    <option value="1" {if $MINECRAFTSTYLE eq '1' } selected{/if}>{$ADVANCED_LABEL}</option>
                </select>
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%; margin-top:20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>