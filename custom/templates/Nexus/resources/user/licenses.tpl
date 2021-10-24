{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$TITLE}
</h2>

<div class="ui stackable grid" id="user">
    <div class="ui centered row">
        <div class="ui six wide tablet four wide computer column">
            {include file='user/navigation.tpl'}
        </div>
        <div class="ui ten wide tablet twelve wide computer column">
            <div class="ui segment">
                <h3 class="ui header" style="display:inline">{$MANAGING_LICENSES}</h3>

                <div class="ui button right floated" data-toggle="modal" data-target="#add-license-modal" style="margin-top: -5px">
                    {$ADD_LICENSE}
                </div>

                <div class="ui divider"></div>

                {if isset($SUCCESS)}
                    <div class="ui positive message">
                        {$SUCCESS}
                    </div>
                {/if}
                {if isset($ERROR)}
                    <div class="ui negative message">
                        {$ERROR}
                    </div>
                {/if}

                {if count($LICENSES)}
                    <table id="resourceLicenses" class="ui table dataTables-users" style="width:100%">
                        <thead>
                        <tr>
                            <th>{$USER}</th>
                            <th>{$PURCHASED}</th>
                            <th>{$STATUS}</th>
                            <th>{$ACTIONS}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach from=$LICENSES item=license}
                            <tr>
                                <td>
                                    <a href="{$license.profile}" style="{$license.style}"><img src="{$license.avatar}" class="ui avatar image" style="max-height:25px;max-width:25px;" alt="{$license.username}"/> {$license.username}</a>
                                    <br />
                                    <small style="margin-left: 32px">{$license.transaction_id}</small>
                                </td>
                                <td>
                                    {$license.date}
                                </td>
                                <td>
                                    <span class="ui label {if $license.status eq '0'}yellow{elseif $license.status eq '1'}green{else}red{/if}">{$license.status_text}</span>
                                </td>
                                <td>
                                    {if $license.can_revoke}
                                        <form action="" method="post">
                                            <input type="hidden" name="action" value="revoke" />
                                            <input type="hidden" name="token" value="{$TOKEN}" />
                                            <input type="hidden" name="license" value="{$license.id}" />
                                            <input type="submit" class="ui button" value="{$REVOKE}" />
                                        </form>
                                    {/if}
                                    {if $license.can_reinstate}
                                        <form action="" method="post">
                                            <input type="hidden" name="action" value="reinstate" />
                                            <input type="hidden" name="token" value="{$TOKEN}" />
                                            <input type="hidden" name="license" value="{$license.id}" />
                                            <input type="submit" class="ui button" value="{$REINSTATE}" />
                                        </form>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                {else}
                    <div class="ui blue message">{$NO_LICENSES}</div>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="ui small modal" id="add-license-modal">
    <div class="header">
        {$ADD_LICENSE}
    </div>
    <div class="content">
        <form id="addLicense" action="" method="post">
            <div class="ui fluid search selection dropdown">
                <input type="hidden" name="user" />
                <i class="dropdown icon"></i>
                <div class="default text">{$FIND_USER}</div>
                <div class="menu"></div>
            </div>
            <input type="hidden" name="action" value="add" />
            <input type="hidden" name="token" value="{$TOKEN}" />
        </form>
    </div>
    <div class="actions">
        <div class="ui approve button" onClick='document.getElementById("addLicense").submit();'>{$SUBMIT}</div>
        <div class="ui cancel button">{$CANCEL}</div>
    </div>
</div>

{include file='footer.tpl' EXCLUDE_END_BODY=true}

{literal}
    <script type="text/javascript">
      $('#addLicense .ui.dropdown').dropdown({
        apiSettings: {
          url: '{/literal}{$ADD_LICENSE_USERS_ENDPOINT}{literal}{query}',
          onResponse: function (apiResponse) {
            let response = {
              success: !apiResponse.error,
              results: []
            };

            $.each(apiResponse.results, function(index, item) {
              if (index >= 10) { // only return 10
                return false;
              }

              response.results.push({
                name: item.nickname,
                title: item.username,
                value: item.id,
              });
            });

            return response;
          },
        },
        minCharacters: 3
      })
    </script>
{/literal}

</body>
</html>