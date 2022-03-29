<!-- Widgets Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">{$WIDGETS_PAGE}</h3>
    <div class="card-body">
        <h3 class="text-center">{$DONATE_WIDGET_LABEL}</h3>
        <form action="" method="POST">
            <div class="form-group">
                <label for="donateEmail">{$DONATE_EMAIL_LABEL}</label>
                <input type="text" class="form-control" id="inputDonateEmail" name="donateEmail"
                    placeholder="mubeenullah323@gmail.com" value="{$DONATEEMAIL}">
            </div>
            <div class="form-group">
                <label for="donateFirstAmount">{$FIRST_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="inputDonateFirstAmount" name="donateFirstAmount"
                    placeholder="5" value="{$DONATEFIRSTAMOUNT}">
            </div>
            <div class="form-group">
                <label for="donateSecondAmount">{$SECOND_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="inputDonateSecondAmount" name="donateSecondAmount"
                    placeholder="10" value="{$DONATESECONDAMOUNT}">
            </div>
            <div class="form-group">
                <label for="donateThirdAmount">{$THIRD_AMOUNT_LABEL}</label>
                <input type="text" class="form-control" id="inputDonateThirdAmount" name="donateThirdAmount"
                    placeholder="20" value="{$DONATETHIRDAMOUNT}">
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%;margin-top:20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
        <hr />
        <h3 class="text-center">{$MESSAGE_WIDGET_LABEL}</h3>
        <form action="" method="POST">
            <div class="form-group">
                <label for="messageTitle">{$MESSAGE_TITLE_LABEL}</label>
                <input type="text" class="form-control" id="inputMessageTitle" name="messageTitle" placeholder="About"
                    value="{$MESSAGETITLE}">
            </div>
            <div class="form-group">
                <label for="messageText">{$MESSAGE_TEXT_LABEL}</label>
                <textarea type="text" class="form-control" id="inputMessageText" name="messageText"
                    value="{$MESSAGETEXT}"></textarea>
            </div>
            <div class="form-group">
                <label for="messageIcon">{$MESSAGE_ICON_LABEL}</label>
                <input type="text" class="form-control" id="inputMessageIcon" name="messageIcon"
                    placeholder="fas fa-hand-holding-usd" value="{$MESSAGEICON}">
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button style="width: 100%;margin-top:20px;" type="submit" class="btn btn-primary"><i
                        class="fas fa-save"></i>
                    {$SUBMIT}</button>
            </div>
        </form>
    </div>
</div>