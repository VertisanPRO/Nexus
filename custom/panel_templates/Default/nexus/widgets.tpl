<!-- Widgets Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$WIDGETS_PAGE}</h3>
    <div class="card-body">
        <!-- Donation Widget Content -->
        <h4 class="text-center">{$DONATE_WIDGET_LABEL}</h4>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="widgets" />

            <div class="form-group">
                <label for="donate_email3">{$DONATE_EMAIL_LABEL}</label>
                <input type="text" class="form-control" id="donate_email3" name="donate_email" value="{$DONATE_EMAIL}" />
            </div>

            <div class="form-group">
                <label for="widget_first_amount">{$FIRST_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="widget_first_amount" name="widget_first_amount" placeholder="5" value="{$WIDGET_FIRST_AMOUNT}" />
            </div>

            <div class="form-group">
                <label for="widget_second_amount">{$SECOND_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="widget_second_amount" name="widget_second_amount" placeholder="10" value="{$WIDGET_SECOND_AMOUNT}" />
            </div>

            <div class="form-group">
                <label for="widget_third_amount">{$THIRD_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="widget_third_amount" name="widget_third_amount" placeholder="20" value="{$WIDGET_THIRD_AMOUNT}" />
            </div>

            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}" />
                <button style="width: 100%; margin-top: 20px;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i> {$SUBMIT}</button>
            </div>
        </form>
        <!-- Message Widget Content -->
        <hr />

        <h4 class="text-center">{$MESSAGE_WIDGET_LABEL}</h4>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="widgets" />

            <div class="form-group">
                <label for="message_widget_title">{$MESSAGE_TITLE_LABEL}</label>
                <input type="text" class="form-control" id="message_widget_title" name="message_widget_title" value="{$MESSAGE_WIDGET_TITLE}" />
            </div>

            <div class="form-group">
                <label for="widget_text">{$MESSAGE_TEXT_LABEL}</label>
                <textarea type="text" class="form-control" id="widget_text" name="widget_text" rows="6" style="height: 100%;">{$WIDGET_TEXT}</textarea>
            </div>

            <div class="form-group">
                <label for="message_widget_icon">{$MESSAGE_ICON_LABEL}</label>
                <input type="text" class="form-control" id="message_widget_icon" name="message_widget_icon" placeholder='<i class="fas fa-hand-holding-usd"></i>' value="{$MESSAGE_WIDGET_ICON}" />
            </div>

            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}" />
                <button style="width: 100%; margin-top: 20px;" type="submit" class="btn btn-primary"><i class="fas fa-save"></i> {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>
