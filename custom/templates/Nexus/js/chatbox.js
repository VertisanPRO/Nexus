/**
 *    CHATBOX MODULE
 *    By Xemah | https://xemah.com
 *
**/

chatbox.templates = {
    container: `
        <br/>
        <div class="ui segments" id="chatbox" data-position="{position}">
            <div class="ui padded segment">
                <h2 class="ui dividing header">{title}</h2>
                <div class="ui comments" id="chatLog">
                    {loading}
                </div>
            </div>
            <div class="ui secondary segment">
                <form class="disabled" id="chatForm" autocomplete="off">
                    <div class="ui fluid right action left icon input">
                        <i class="comment icon chatbox"></i>
                        <input type="text" id="chatInput" placeholder="{messagePlaceholder}" />
                        <button type="submit" class="ui primary icon button">
                            <i class="share icon"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    `,
    item: `
        <div class="comment" id="chatMessage-{messageId}">
            <a class="avatar" href="{authorProfile}">
                <img src="{authorAvatar}">
            </a>
            <div class="content">
                <span class="badge badge-pill badge-primary role_icon" style=" background-color: {authorColor} !important;" >{authorGroupFirstLetter}</span>
                <a class="author" href="{authorProfile}" style="{authorStyle}">{authorUsername}</a>
                <div class="metadata">
                    <span class="date">{messageTime}</span>
                </div>
                <div class="text">
                    {messageContent}
                </div>
                <div class="actions">
                    {messageActions}
                </div>
            </div>
        </div>
    `
};

chatbox.elements = {
    containerTop: '#wrapper > .ui.container',
    containerBottom: '#wrapper > .ui.container',
    root: '#chatbox',
    log: '#chatbox #chatLog',
    form: '#chatbox #chatForm',
    input: '#chatbox #chatInput'
};

chatbox.style = `
    #chatbox[data-position="top"] {
        margin-bottom: 1.5rem;
    }
    #chatbox[data-position="bottom"] {
        margin-top: 1.5rem;
    }
    #chatbox #chatLog {
        height: 250px;
        max-width: 100%;
        overflow-y: scroll;
    }
    #chatbox #chatForm.disabled {
        opacity: 0.75;
    }
    #chatbox #chatForm.disabled * {
        pointer-events: none;
    }
`;

document.addEventListener('DOMContentLoaded', () => {
    chatbox.instance = new Chatbox(chatbox);
});