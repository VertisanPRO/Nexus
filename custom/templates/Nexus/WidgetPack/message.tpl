<!-- Widgets Content -->
<div class="card mb-3">
    <h3 class="card-header mb-3 text-center">WIDGETS_PAGE</h3>
    <div class="card-body">
        <h3 class="text-center">MESSAGEWIDGET_LABEL</h3>
        <form action="" method="POST">
            <input type="hidden" name="sel_btn_session" value="widgets" />
            <div class="form-group">
                <label for="messageTitle">MESSAGETITLE_LABEL</label>
                <input type="text" class="form-control" id="inputMessageTitle" name="messageTitle" placeholder="About"
                    value="MESSAGETITLE">
            </div>
            <div class="form-group">
                <label for="messageText">MESSAGETEXT_LABEL</label>
                <textarea type="text" class="form-control" id="inputMessageText" name="messageText"
                    value="MESSAGETEXT"></textarea>
            </div>
            <div class="form-group">
                <label for="messageIcon">MESSAGEICON_LABEL <span class="badge badge-info">
                        <i class="fas fa-question-circle" data-container="body" data-toggle="popover"
                            data-placement="top" data-content="MESSAGEICON_INFO_LABEL"
                            data-original-title="INFO"></i>
                    </span></label>
                <input type="text" class="form-control" id="inputMessageIcon" name="messageIcon"
                    placeholder="fas fa-hand-holding-usd" value="MESSAGEICON">
            </div>
            <div class="form-group">
                <input type="hidden" name="token" value="TOKEN">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i>SUBMIT</button>
            </div>
        </form>
    </div>
</div>