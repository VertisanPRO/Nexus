<!-- VueJS Script -->
<script src="https://unpkg.com/vue@next"></script>
<script>
    // Needed const
    const userToken = '{$TOKEN}';
    const ticketId = '{$TICKET_ID}';
    const ticketApp = Vue.createApp({
        el: '#ticket',
    });

    // Answers reactive init
    const reactive = Vue.reactive({
        answers: [],
        status: parseInt('{$TICKET[0]->status}'),
    });

    // Status component
    ticketApp.component('status', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <i v-if="status == 1" class="fas fa-sync-alt status-icon" style="background:#FAE800;color:#FFF;"> </i>
        <i v-if="status == 2" class="fas fa-exclamation status-icon" style="background:#FAB513;color:#FFF;"> </i>
        <i v-if="status == 3" class="fas fa-question status-icon" style="background:#7AAEFA;color:#FFF;"> </i>
        <i v-if="status == 4" class="fas fa-times status-icon" style="background:#FA533D;color:#FFF;"> </i>
        <i v-if="status == 5" class="fas fa-check status-icon" style="background:#6BDB4A;color:#FFF;"> </i>`
    });

    // Answers component
    ticketApp.component('answers', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div v-for="answer in answers" id="topic-post" class="ui segments scale-in-center">
            <div class="ui attached padded segment">
                <div class="ui stackable grid">
                    <div class="ui row">
                        <div id="post-sidebar" class="ui five wide tablet three wide computer column" id="post-sidebar">
                            <center>
                                <a v-bind:href="'/profile/' + answer.username + '/'"><img class="ui small circular image" v-bind:src="'https://cravatar.eu/helmavatar/' + answer.username + '/500.png'"
                                v-bind:alt="answer.username"></a>
                                <h3 class="ui header">
                                <a v-bind:href="'/profile/' + answer.username + '/'" v-bind:style="'color:' + answer.group_username_color + ';'">%% answer.username %%</a>
                                <div class="sub header"></div>
                                </h3>
                                <span v-html="answer.group_html"></span>
                            </center>
                            <div class="ui list">
                                <div class="ui divider"></div>
                                    <div class="item">
                                        <div class="content">
                                            <div class="header">{$IGN}</div>
                                            <div class="res right floated description">%% answer.username %%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="ui eleven wide tablet thirteen wide computer column" id="post-content">
                            <div class="forum_post"><p>%% answer.content %%</p></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui bottom attached secondary segment" id="post-meta">
                <a v-bind:href="'/profile/' + answer.username + '/'" v-bind:style="'color:' + answer.group_username_color + ';'">%% answer.username %%</a> · %% answer.date %%
            </div>
        </div>`,
    });

    ticketApp.component('reply', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div class="ui form" v-if="status < 4" id="answerContainer">
            <div class="field">
                <label>Answer</label>
                <textarea rows="2" style="height: 100px;" maxlength="1024" id="answerContent"></textarea>
            </div>
            <div>
                <button type="submit" class="ui primary button addAnswer" value="{$ANSWER}" id="addAnswer">{$ANSWER}</button>
            </div>
        </div>`
    });

    // -- VueJS assigned & not assigned categories --

    // Assigned categories list init
    reactive.aCategs = JSON.parse('{$ASSIGNED_CATEGORIES}');

    // Assigned categories component for users
    ticketApp.component('assigned-categs', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div v-for="categ in aCategs" class="ui label scale-in-center" v-bind:style="'background:#' + categ.color + ';color:#F0F0F0;margin-bottom:0.2rem'">
            %% categ.text %%
        </div>`
    });

    {if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories']}
        // Not assigned categories list init
        reactive.naCategs = {$NOT_ASSIGNED_CATEGORIES};

        // Assigned categories component
        ticketApp.component('a-categ', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div id="assignedCategories" class="ui segments" style="max-height:50vh;overflow:hidden scroll;">
                <div v-if="aCategs.length < 1" class="ui segment">
                    {$NO} {$CATEGORIES} {$ASSIGNED}
                </div>
                <div v-for="categ in aCategs" class="ui segment">
                    <div class="ui two column grid">
                        <div class="column middle aligned"><i class="tag middle aligned icon"></i><span>%% categ.text %%</span></div>
                        <div class="column right aligned">
                            <div v-bind:id="categ.id" class="ui negative right aligned icon button removeCateg">
                                <i class="trash icon"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`
        });
    {/if}

    {if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign']}
        // -- VueJS assigned & not assigned groups --

        // Assigned categories list init
        reactive.aGroups = {$ASSIGNED_GROUPS};
        // Not assigned categories list init
        reactive.naGroups = {$NOT_ASSIGNED_GROUPS};

        // Assigned categories component
        ticketApp.component('a-groups', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div id="assignedGroups" class="ui segments" style="max-height:50vh;overflow:hidden scroll;">
                <div v-if="aGroups.length < 1" class="ui segment">
                    {$NO} {$GROUPS} {$ASSIGNED}
                </div>
                <div v-for="group in aGroups" class="ui segment">
                    <div class="ui two column grid">
                        <div class="column middle aligned"><i class="users middle aligned icon"></i><span>%% group.text %%</span></div>
                        <div class="column right aligned">
                            <div v-bind:id="group.id" class="ui negative right aligned icon button removeGroup">
                                <i class="trash icon"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`
        });
    {/if}

    {if isset($PERMISSIONS['status']) && $PERMISSIONS['status']}
        // Status modal component
        ticketApp.component('status-modal', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div class="ui form">
                <div class="ui segments">
                    <div class="ui segment">
                        <div class="ui checkbox">
                            <input id="in-progress" type="radio" name="status" value="1" v-bind:checked="status == 1">
                            <label for="in-progress"><i class="fas fa-sync-alt status-icon" style="background:#FAE800;color:#FFF;margin-right:0.8rem;"> </i>{$IN_PROGRESS}</label>
                        </div>
                    </div>
                    <div class="ui segment">
                        <div class="ui checkbox">
                            <input id="important" type="radio" name="status" value="2" v-bind:checked="status == 2">
                            <label for="important"><i class="fas fa-exclamation status-icon" style="background:#FAB513;color:#FFF;margin-right:0.8rem;"> </i>{$IMPORTANT}</label>
                        </div>
                    </div>
                    <div class="ui segment">
                        <div class="ui checkbox">
                            <input id="pending" type="radio" name="status" value="3" v-bind:checked="status == 3">
                            <label for="pending"><i class="fas fa-question status-icon" style="background:#7AAEFA;color:#FFF;margin-right:0.8rem;"> </i>{$PENDING}</label>
                        </div>
                    </div>
                    <div class="ui segment">
                        <div class="ui checkbox">
                            <input id="closed" type="radio" name="status" value="4" v-bind:checked="status == 4">
                            <label for="closed"><i class="fas fa-times status-icon" style="background:#FA533D;color:#FFF;margin-right:0.8rem;"> </i>{$CLOSED}</label>
                        </div>
                    </div>
                    <div class="ui segment">
                        <div class="ui checkbox">
                            <input id="solved" type="radio" name="status" value="5" v-bind:checked="status == 5">
                            <label for="solved"><i class="fas fa-check status-icon" style="background:#6BDB4A;color:#FFF;margin-right:0.8rem;"> </i>{$SOLVED}</label>
                        </div>
                    </div>
                </div>
            </div>`
        });
    {/if}

    ticketApp.mount('#ticket');
</script>