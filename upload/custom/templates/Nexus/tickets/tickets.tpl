{include file='header.tpl'}
{include file='navbar.tpl'}
<style>
    .scale-in-center{ -webkit-animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both;animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both }
    @-webkit-keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }@keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }
    .status-icon{
        border-radius: 100%;
        width: 1.5rem !important;
        font-size: 0.92rem;
        height: 1.5rem;
        line-height: 1.65;
        text-align: center;
        margin-right: 0.5rem;
    }
</style>

<!-- Core page -->
<div class="ui container" id="tickets">
    <h2 class="ui header">
        <div class="topic title">
            <i class="ticket alternate icon"></i> {$TICKETS}
            {if $CAN_OPEN}
            <div class="res right floated">
                <a class="ui primary button" href="{$URL}new">
                    {$OPEN_TICKET}
                </a>
            </div>
            {/if}
        </div>
    </h2>

    <tickets-page></tickets-page>

</div>

{include file='footer.tpl'}
<!-- VueJS Script -->
<script src="https://unpkg.com/vue@next"></script>
<script>
    // Needed const
    const userToken = '{$TOKEN}';
    const ticketsUrl = '{$URL}';
    const ticketsApp = Vue.createApp({
        el: '#tickets',
    });

    let searchParams = new URLSearchParams(window.location.search);
    // let param = searchParams.get('p')
    // param.split('/')[0]
    // window.history.pushState('page2', 'Title', searchParams.get('route'));

    // Answers reactive init
    const reactive = Vue.reactive({
        tickets: [],
        ticketsCount: parseInt('{$COUNT}'),
    });

    reactive.page = 1;
    if (searchParams.has('p') && Number.isInteger(parseInt(searchParams.get('p')))) {
        reactive.page = parseInt(searchParams.get('p'));
    }

    // Page component
    ticketsApp.component('tickets-page', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div v-if="tickets.length > 0">
            <pagination></pagination>
            <tickets></tickets>
            <pagination></pagination>
        </div>
        <div v-else>
            <div class="ui segment align middle">
                {$EMPTY}
            </div>
        </div>`,
    });

    // Tickets component
    ticketsApp.component('tickets', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div class="ui segments">
            <div v-for="ticket in tickets" class="ui segment">
                <div class="ui two column grid">
                    <div class="column middle aligned">
                         <a v-bind:href="'{$TICKET_URL}' + ticket.id">
                            <i v-if="ticket.status === '1'" class="fas fa-sync-alt status-icon" style="background:#FAE800;color:#FFF;"> </i>
                            <i v-if="ticket.status === '2'" class="fas fa-exclamation status-icon" style="background:#FAB513;color:#FFF;"> </i>
                            <i v-if="ticket.status === '3'" class="fas fa-question status-icon" style="background:#7AAEFA;color:#FFF;"> </i>
                            <i v-if="ticket.status === '4'" class="fas fa-times status-icon" style="background:#FA533D;color:#FFF;"> </i>
                            <i v-if="ticket.status === '5'" class="fas fa-check status-icon" style="background:#6BDB4A;color:#FFF;"> </i>
                            <span>%% ticket.title %%</span>
                        </a>
                    </div>
                    <div class="column right aligned">
                        <a v-bind:href="'/profile/' + ticket.username + '/'">%% ticket.username %%</a> - %% ticket.date %%
                    </div>
                </div>
            </div>
        </div>`,
    });

    // Pagination component
    ticketsApp.component('pagination', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div class="ui mini pagination menu">
            <a v-bind:class="'item pageChange ' + (page < 2 ? 'disabled' : '')" v-bind:data-page="page-1" href="#" id="previous-page">«</a>
            <a v-if="page == ticketsCount && ticketsCount > 2" class="item pageChange" v-bind:data-page="page-2" href="#">%% page-2 %%</a>
            <a v-if="page > 1" class="item pageChange" v-bind:data-page="page-1" href="#">%% page-1 %%</a>
            <a class="active item pageChange" v-bind:data-page="page" href="#">%% page %%</a>
            <a v-if="page < ticketsCount" class="item pageChange" v-bind:data-page="page+1" href="#">%% page+1 %%</a>
            <a v-if="page == 1 && ticketsCount > 2" class="item pageChange" v-bind:data-page="page+2" href="#">%% page+2 %%</a>
            <a v-bind:class="'item pageChange ' + (ticketsCount == page ? 'disabled' : '')" v-bind:data-page="page+1" href="#" id="next-page">»</a>
        </div>`,
    });

    ticketsApp.mount('#tickets');

    function handleErrors(queryResult) {
        if (queryResult.errors && queryResult.errors.length > 0) {
            $.each(queryResult.errors, function(index, value) {
                toastr["error"](value, "{$ERROR_OCCURED}");
            });
        } else {
            return queryResult.content;
        }
        return null;
    }

    $(document).ready(function () {
        handleErrors({$ERRORS});

        getTickets(reactive.page);

        $('#tickets').on('click', '.pageChange:not(.disabled):not(.active)', function() {
            getTickets($(this).attr('data-page'));
            window.history.pushState('Tickets', 'Tickets', '?p=' + reactive.page);
        });
    });

    function getTickets(page) {
        reactive.page = parseInt(page);
        $.ajax({
            type: 'POST',
            data: {
                ajax: 1,
                token: userToken,
                action: 'getTickets',
                parameters: JSON.stringify({
                    page: page,
                }),
            }
        }).done(function (result) {
            if(result && (tickets = handleErrors(JSON.parse(result)))) {
                reactive.tickets = tickets;
            } else {

            }
        }).fail(function () {

        });
    }

</script>