<div class="ui fluid card" id="widget-latest-posts">
    <div class="content">
        <a class="ui {if isset($WIDGET_LABEL_COLOR)} {$WIDGET_LABEL_COLOR}{/if} ribbon label">
            {if isset($DONATE_WG['donate_widget_icon'])}{$DONATE_WG['donate_widget_icon']}
            {else}<i class="fas fa-donate"></i>
            {/if}

            {if isset($DONATE_WG['donate_title_label'])}{$DONATE_WG['donate_title_label']}
            {else}Donate
            {/if}
        </a>
        <div class="description">

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post">

                            <div class="fixed-values mb-2">
                                <div class="mb-2" style="margin-top: 8px; margin-bottom: 8px;">Choose amount</div>
                                <a href="#" class="ui primary button"
                                    data-value="{if isset($DONATE_WG['donate_first_amount'])}{$DONATE_WG['donate_first_amount']}{else}5{/if}"
                                    style="padding: .78571429em 1.2em .78571429em;margin-bottom:15px;">{if isset($DONATE_WG['donate_first_amount'])}{$DONATE_WG['donate_first_amount']}
                                    {else}5
                                    {/if}€</a>
                                <a href="#" class="ui primary button"
                                    data-value="{if isset($DONATE_WG['donate_second_amount'])}{$DONATE_WG['donate_second_amount']}{else}10{/if}"
                                    style="padding: .78571429em 1.2em .78571429em;">{if isset($DONATE_WG['donate_second_amount'])}{$DONATE_WG['donate_second_amount']}
                                    {else}10
                                    {/if}€</a>
                                <a href="#" class="ui primary button"
                                    data-value="{if isset($DONATE_WG['donate_third_amount'])}{$DONATE_WG['donate_third_amount']}{else}20{/if}"
                                    style="padding: .78571429em 1.2em .78571429em;">{if isset($DONATE_WG['donate_third_amount'])}{$DONATE_WG['donate_third_amount']}
                                    {else}20
                                    {/if}€</a>
                            </div>


                            <div class="ui right labeled input">
                                <label for="amount" class="ui label">€</label>
                                <input type="number" name="value-custom" placeholder="amount" id="amount"
                                    style="width: 120px;">
                                <div class="ui basic label">.00</div>
                            </div>

                            <div class="mb-4">

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="cmd" value="_xclick" checked>
                                    <label class="form-check-label" for="exampleRadios1" style="margin-top: 5px;">
                                        one-time
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="cmd" value="_xclick">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Subscribe
                                    </label>
                                </div>
                            </div>

                            <input type="hidden" name="business"
                                value="{if isset($DONATE_WG['donate_widget_email'])}{$DONATE_WG['donate_widget_email']}{else}lectrichost@gmail.com{/if}">
                            <input type="hidden" name="a3" value="10" id="a3">
                            <input type="hidden" name="amount" value="10" id="amount">
                            <input type="hidden" name="currency_code" value="EUR">
                            <input type="hidden" name="item_name" value="Donazione di test">
                            <input type="hidden" name="no_shipping" value="1">
                            <input type="hidden" name="p3" value="1">
                            <input type="hidden" name="t3" value="M">
                            <input type="hidden" name="src" value="1">
                            <input type="hidden" name="sra" value="1">

                            <button class="ui primary right labeled icon button" type="submit" formtarget="blank"
                                style="margin-top: 15px; background:{if isset($TEMPLATE_COLOR)} {$TEMPLATE_COLOR}{/if}">
                                <i class="right arrow icon"></i>
                                Donate using PayPal
                            </button>

                    </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                function setValue(value) {
                    $("input[name='amount'], input[name='a3']").val(value);
                    console.log(value);
                }
                $(".fixed-values a").on("click", function(e) {
                    let value = $(this).data("value");
                    $(".fixed-values a").removeClass("btn-primary").addClass("btn-secondary");
                    $(this).removeClass("btn-secondary").addClass("btn-primary");
                    setValue(value);
                    $("input[name='value-custom']").val(value);
                    e.preventDefault();
                });
                $("input[name='value-custom']").on("keyup", function(e) {
                    $(".fixed-values a").removeClass("btn-primary").addClass("btn-secondary");
                    setValue($(this).val());
                });
            });
        </script>
    </div>
</div>