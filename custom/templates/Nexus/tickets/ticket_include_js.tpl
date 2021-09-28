<script>
    {if (isset($PERMISSIONS['assign'] || isset($PERMISSIONS['categories'])) && ($PERMISSIONS['assign'] || $PERMISSIONS['categories']))}
        function initSelect2(el, datas) {
            if (el.data('select2'))
            {
                el.select2('destroy');
            }
            el.html('').select2({
                width: '100%',
                placeholder: '{$CONTENT_TO_ADD}',
                data: datas,
                closeOnSelect: false
            });
        }
    {/if}

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

    function redirectTo(place) {
        window.location.replace(place);
    }

    $(document).ready(function () {
        handleErrors({$ERRORS});

        // Answers init
        $.ajax({
            type: 'POST',
            data: {
                ajax: 1,
                token: userToken,
                action: 'getAnswers',
                parameters: JSON.stringify({

                }),
            }
        }).done(function (result) {
            if(result && (answers = handleErrors(JSON.parse(result)))) {
                $.each(answers, function(index, value) {
                    reactive.answers.push(value);
                });
            } else {
                redirectTo("/tickets/")
            }
        }).fail(function () {
            redirectTo("/tickets/")
        });

        $('#answerContainer').on('click', '.addAnswer', function() {
            $(this).addClass('loading disabled');
            $.ajax({
                type: 'POST',
                data: {
                    ajax: 1,
                    token: userToken,
                    action: 'addAnswer',
                    parameters: JSON.stringify({
                        content: $('#answerContent').val(),
                    }),
                }
            }).done(function (result) {
                answers = handleErrors(JSON.parse(result));
                if(result && answers) {
                    $.each(answers, function(index, value) {
                        reactive.answers.push(value);
                    });
                }
            }).fail(function () {

            });
            $('#answerContent').val('');
            $(this).removeClass('loading disabled');
        });

        {if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories']}
            initSelect2($('#notAssignedCategories'),reactive.naCategs);
            // Add and Remove Categs
            $('#assignedCategories').on('click', '.removeCateg', function() {
                $(this).addClass('loading disabled');
                $.ajax({
                    type: 'POST',
                    data: {
                        ajax: 1,
                        token: userToken,
                        action: 'unassignCategory',
                        parameters: JSON.stringify({
                            category: $(this).attr('id'),
                        }),
                    },
                    id: $(this).attr('id'),
                    el: $(this)
                }).done(function (result) {
                    if (result && handleErrors(JSON.parse(result))) {
                        index = reactive.aCategs.map(function(item) { return item.id; }).indexOf(this.id);
                        reactive.naCategs.push(reactive.aCategs[index]);
                        reactive.aCategs.splice(index, 1);
                        initSelect2($('#notAssignedCategories'),reactive.naCategs);
                    }
                }).fail(function () {

                });
                $(this).removeClass('loading disabled');
            });

            // Add Categ
            $('#addCateg').on('click', function() {
                $('#notAssignedCategories').prop("disabled", true);
                console.log($('#notAssignedCategories').val());
                $(this).addClass('loading disabled');
                $.ajax({
                    type: 'POST',
                    data: {
                        ajax: 1,
                        token: userToken,
                        action: 'assignCategories',
                        parameters: JSON.stringify({
                            categories: $('#notAssignedCategories').val(),
                        }),
                    },
                    ids: $('#notAssignedCategories').val()
                }).done(function (result) {
                    if (result && handleErrors(JSON.parse(result))) {
                        $.each(this.ids, function(index, value) {
                            index = reactive.naCategs.map(function(item) { return item.id; }).indexOf(value);
                            reactive.aCategs.push(reactive.naCategs[index]);
                            reactive.naCategs.splice(index, 1);
                        });
                        initSelect2($('#notAssignedCategories'),reactive.naCategs);
                    }
                }).fail(function () {

                });
                $('#notAssignedCategories').prop("disabled", false);
                $(this).removeClass('loading disabled');
            });
        {/if}

        {if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign']}
            initSelect2($('#notAssignedGroups'),reactive.naGroups);
            <!-- VueJS Assigned and Not assigned Groups -->

            // Add Group
            $('#assignGroups').on('click', function() {
                $('#notAssignedGroups').prop("disabled", true);
                $(this).addClass('loading disabled');
                $.ajax({
                    type: 'POST',
                    data: {
                        ajax: 1,
                        token: userToken,
                        action: 'assignTicket',
                        parameters: JSON.stringify({
                            groups_id: $('#notAssignedGroups').val(),
                        }),
                    },
                    ids: $('#notAssignedGroups').val()
                }).done(function (result) {
                    if (result && handleErrors(JSON.parse(result))) {
                        $.each(this.ids, function(index, value) {
                            index = reactive.naGroups.map(function(item) { return item.id; }).indexOf(value);
                            reactive.aGroups.push(reactive.naGroups[index]);
                            reactive.naGroups.splice(index, 1);
                        });
                        initSelect2($('#notAssignedGroups'),reactive.naGroups);
                    }
                }).fail(function () {

                });
                $('#notAssignedGroups').prop("disabled", false);
                $(this).removeClass('loading disabled');
            });

            // Remove Groups
            $('#assignedGroups').on('click', '.removeGroup', function() {
                $('#notAssignedGroups').prop("disabled", true);
                $(this).addClass('loading disabled');
                $.ajax({
                    type: 'POST',
                    data: {
                        ajax: 1,
                        token: userToken,
                        action: 'unassignTicket',
                        parameters: JSON.stringify({
                            group_id: $(this).attr('id'),
                        }),
                    },
                    id: $(this).attr('id'),
                    el: $(this)
                }).done(function (result) {
                    if (result && handleErrors(JSON.parse(result))) {
                        index = reactive.aGroups.map(function(item) { return item.id; }).indexOf(this.id);
                        reactive.naGroups.push(reactive.aGroups[index]);
                        reactive.aGroups.splice(index, 1);
                        initSelect2($('#notAssignedGroups'),reactive.naGroups);
                    }
                }).fail(function () {

                });
                $(this).removeClass('loading disabled');
                $('#notAssignedGroups').prop("disabled", false);
            });
        {/if}

        {if isset($PERMISSIONS['status']) && $PERMISSIONS['status']}
            $('#editStatus').on('click', function() {
                $(this).addClass('loading disabled');
                newStatus = $('input[name="status"]:checked').val();
                if (newStatus != reactive.status) {
                    $.ajax({
                        type: 'POST',
                        data: {
                            ajax: 1,
                            token: userToken,
                            action: 'editStatus',
                            parameters: JSON.stringify({
                                status: newStatus,
                            }),
                        },
                        newStatus: newStatus,
                    }).done(function (result) {
                        if (result && handleErrors(JSON.parse(result))) {
                            reactive.status = this.newStatus;
                        }
                    }).fail(function () {

                    });
                }
                $(this).removeClass('loading disabled');
            });
        {/if}

        {if isset($PERMISSIONS['delete']) && $PERMISSIONS['delete']}
            $('#deleteTicket').on('click', function() {
                $(this).addClass('loading disabled');
                $.ajax({
                    type: 'POST',
                    data: {
                        ajax: 1,
                        token: userToken,
                        action: 'deleteTicket',
                        parameters: JSON.stringify({

                        }),
                    }
                }).done(function (result) {
                    if (result && handleErrors(JSON.parse(result))) {
                        window.location.replace("/tickets/");
                    }
                }).fail(function () {

                });
                $(this).removeClass('loading disabled');
            });
        {/if}
    });
</script>