<div class="ui basic modal feedback">
    <div class="ui icon header">
        <i class="comment icon"></i>
        {$REVIEWS_WRITE_NEW_PLACEHOLDER}
    </div>
    <form class="ui inverted form feedback">
        <div class="fields" style="align-items: center; justify-content: center;">
            <div class="field">
                <select name="type" class="ui selection dropdown select_type">
                    <option value="">{$REVIEWS_TYPE_PLACEHOLDER}</option>
                    {foreach from=$TYPES item=type}
                        <option value="{$type->id}">{$type->icon} <span
                                style="margin-left: .7em !important;">{$type->title}</span></option>
                    {/foreach}
                </select>
            </div>
            <div class="field">
                <div class="ui massive star rating" data-icon="star" data-rating="1" data-max-rating="5"></div>
            </div>
            <div class="field">
                <input name="title" id="title" placeholder="{$REVIEWS_TITLE_PLACEHOLDER}"></textarea>
            </div>
        </div>
        <div class="field">
            <label>{$REVIEWS_EXPAND_THOUGHTS_PLACEHOLDER}</label>
            <textarea name="textarea" id="textarea"></textarea>
        </div>
        <div class="ui container center aligned">
            <button class="ui button" type="submit" id="feedback_submit"
                name="feedback_submit">{$SUBMIT_PLACEHOLDER}</button>
        </div>
    </form>
</div>