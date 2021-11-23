<!-- Connections Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$CONNECTIONS_PAGE}</h3>
    <div class="card-body">
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="connections" />

            <div class="form-group">
                <label for="minecraft">{$ENABLE_MINECRAFT_LABEL}</label>
                <select class="form-control mr-sm-2" id="discord" name="minecraft">
                    <option {if $MINECRAFT=='true' }selected{/if} value="true">{$TRUE_LABEL}</option>
					<option {if $MINECRAFT=='false' }selected {/if}value="false">{$FALSE_LABEL}</option>
                </select>
            </div>

            <div class="form-group">
                <label for="opal_mcserver_name" style="margin-top: 5px;">{$SERVER_DOMAIN_LABEL}</label>
                <div class="input-group">
                    <input type="text-area" class="form-control" id="opal_mcserver_name" name="opal_mcserver_name" value="{$OPAL_MCSERVER_NAME}" placeholder="MC.HYPIXEL.NET" />
                    <div class="input-group-append">
                        <input type="hidden" name="token" value="{$TOKEN}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="opal_mcserver_ip" style="margin-top: 10px;">{$IP_ADDRESS_LABEL}</label>
                <div class="input-group">
                    <input type="text-area" class="form-control" id="opal_mcserver_ip" name="opal_mcserver_ip" value="{$OPAL_MCSERVER_IP}" placeholder="MC.HYPIXEL.NET" />
                    <div class="input-group-append">
                        <input type="hidden" name="token" value="{$TOKEN}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="opal_mcserver_port" style="margin-top: 10px;">{$SERVER_PORT_LABEL}</label>
                <div class="input-group">
                    <input type="text-area" class="form-control" id="opal_mcserver_port" name="opal_mcserver_port" value="{$OPAL_MCSERVER_PORT}" placeholder="25565" />
                    <div class="input-group-append">
                        <input type="hidden" name="token" value="{$TOKEN}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="opal_mcserver_style" style="margin-top: 10px;">{$STYLE_LABEL}</label>
                <select class="form-control mr-sm-2" id="opal_mcserver_style" name="opal_mcserver_style">
                    <option {if $OPAL_MCSERVER_STYLE=='true' }selected {/if}value="true">{$SIMPLE_LABEL}</option>
					<option {if $OPAL_MCSERVER_STYLE=='false' }selected {/if}value="false">{$ADVANCED_LABEL}</option>
                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px; margin-bottom: 20px;"><i class="fas fa-save"></i> {$SUBMIT}</button>
            </div>

            <hr />
            <h3 style="text-align: center;">{$DISCORD_LABEL}</h3>

            <div class="form-group">
                <label for="discord">{$ENABLE_DISCORD_LABEL}</label>
                <select class="form-control mr-sm-2" id="discord" name="discord">
                    <option {if $DISCORD=='true' }selected{/if} value="true">{$TRUE_LABEL}</option>
					<option {if $DISCORD=='false' }selected {/if}value="false">{$FALSE_LABEL}</option>
                </select>
            </div>

            <div class="form-group">
                <label for="discord_id" style="margin-top: 10px;">{$DISCORD_ID_LABEL}</label>
                <div class="input-group">
                    <input type="text-area" class="form-control" id="discord_id" name="discord_id" value="{$DISCORD_ID}" placeholder="760945720470667294" />
                    <div class="input-group-append">
                        <input type="hidden" name="token" value="{$TOKEN}" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px; margin-bottom: 20px;"><i class="fas fa-save"></i> {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>
