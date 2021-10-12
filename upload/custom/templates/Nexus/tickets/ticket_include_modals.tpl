<!-- Modals Categories -->
{if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories'] === true}
    <div class="ui dimmer modals page transition hidden">
        <div class="ui small modal transition hidden" id="modal-edit-categ">
            <div class="header">
                {$EDIT_CATEG}
            </div>
            <div class="content">
                <!-- Vue not assigned category list -->
                <div class="ui horizontal divider">
                    {$REMOVE} {$CATEGORIES}
                </div>
                <a-categ></a-categ>
                <div class="ui horizontal divider">
                    {$ADD} {$CATEGORIES}
                </div>
                <select class="select-2" name="assignCateg[]" id="notAssignedCategories" multiple=""></select>
                <div class="ui right aligned">
                    <button class="ui positive button assignCateg" style="margin-top:0.5rem;" id="addCateg">{$ADD}</button>
                </div>
            </div>
            <div class="actions">
                <a class="ui negative button">{$CLOSE}</a>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Status -->
{if isset($PERMISSIONS['status']) && $PERMISSIONS['status'] === true}
    <div class="ui dimmer modals page transition hidden">
        <div class="ui small modal transition hidden" id="modal-edit-status">
            <div class="header">
                {$EDIT_STATUS}
            </div>
            <div class="content">
                <!-- Vue not assigned category list -->
                <div class="ui horizontal divider">
                    {$STATUS}
                </div>
                <status-modal></status-modal>
                <div class="ui right aligned">
                    <button class="ui positive button assignCateg" style="margin-top:0.5rem;" id="editStatus">{$SAVE}</button>
                </div>
            </div>
            <div class="actions">
                <a class="ui negative button">{$CLOSE}</a>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Assign -->
{if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign'] === true}
    <div class="ui dimmer modals page transition hidden">
        <div class="ui small modal transition hidden" id="modal-assign">
            <div class="header">
                {$ASSIGN_TICKET}
            </div>
            <div class="content">
                <!-- Vue not assigned category list -->
                <div class="ui horizontal divider">
                    {$REMOVE} {$GROUPS}
                </div>
                <a-groups></a-groups>
                <div class="ui horizontal divider">
                    {$ASSIGN} {$GROUPS}
                </div>
                <select class="select-2" name="assignGroups[]" id="notAssignedGroups" multiple=""></select>
                <div class="ui right aligned">
                    <button class="ui positive button assignCateg" style="margin-top:0.5rem;" id="assignGroups">{$ADD}</button>
                </div>
            </div>
            <div class="actions">
                <a class="ui negative button">{$CLOSE}</a>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Delete -->
{if isset($PERMISSIONS['delete']) && $PERMISSIONS['delete'] === true}
    <div class="ui dimmer modals page transition hidden">
        <div class="ui small modal transition hidden" id="modal-delete">
            <div class="header">
                {$DELETE}
            </div>
            <div class="content">
                {$ARE_YOU_SURE}
                <div class="ui right aligned">
                    <button class="ui primary button assignCateg" style="margin-top:0.5rem;" id="deleteTicket">{$DELETE}</button>
                </div>
            </div>
            <div class="actions">
                <a class="ui negative button">{$CLOSE}</a>
            </div>
        </div>
    </div>
{/if}