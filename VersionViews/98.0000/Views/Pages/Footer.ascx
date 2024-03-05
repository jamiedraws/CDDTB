<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var isFrontPage = DtmContext.Page.IsStartPageType;
    var isShoppingCartPage = string.Equals("shoppingcart", DtmContext.PageCode, StringComparison.InvariantCultureIgnoreCase);
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
%>

<footer aria-labelledby="footer-title" class="view footer section bg bg--dark @print-only-hide">
    <div id="footer" class="view__anchor"></div>
    <div class="view__in section__in footer__in">
        <% 
            if (isFrontPage)
            {
                Html.RenderPartial("SitemapList");
            }
        %>
        <address class="section__block">
            &copy; <%= DateTime.Now.ToString("yyyy") %> <%= productName %>. All Rights Reserved.
        </address>
        <% if (isFrontPage) { %>
        <nav aria-label="Social media" class="section__block">
            <div class="social-icons">
                <div class="social-icons__group">
                    <a href="http://facebook.com/ToppikHair" target="_blank" aria-label="Facebook" id="footer-social-facebook">
                        <svg><use href="#icon-facebook"></use></svg>
                    </a>
                    <a href="http://twitter.com/toppik" target="_blank" aria-label="Twitter" id="footer-social-twitter">
                        <svg><use href="#icon-twitter"></use></svg>
                    </a>
                    <a href="http://youtube.com/toppikinc" target="_blank" aria-label="YouTube" id="footer-social-youtube">
                        <svg><use href="#icon-youtube"></use></svg>
                    </a>
                    <a href="http://pinterest.com/toppikhair" target="_blank" aria-label="Pinterest" id="footer-social-pinterest">
                        <svg><use href="#icon-pinterest"></use></svg>
                    </a>
                    <a href="https://www.instagram.com/toppik/?hl=en" target="_blank" aria-label="Instagram" id="footer-social-instagram">
                        <svg><use href="#icon-instagram"></use></svg>
                    </a>
                    <a href="https://www.tiktok.com/@toppik?" target="_blank" aria-label="TikTok" id="footer-social-tiktok">
                        <svg><use href="#icon-tiktok"></use></svg>
                    </a>
                </div>
            </div>
        </nav>
        <% } %>
        <address class="section__block">
            <% Html.RenderSnippet("COMMON-FOOTER"); %>
        </address>
    </div>
</footer>

<%-- // @JS-FOOTER --%>
<% if ( DtmContext.Page.IsStartPageType ) { %>

      
        <script src="/shared/js/jquery.min.js"></script>
        <script src="/shared/js/jquery-ui-1.12.1.min.js"></script>
        <script defer src="/shared/facebox/facebox.js"></script>
        <link rel="stylesheet" href="/shared/facebox/facebox.css"  media="print" onload="this.media='all'; this.onload=null;"/>
        <script>const loadFWSnippets = false; const loadFacebox = false;</script>
        <script type="text/javascript" src="/js/common.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>&language=<%=Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"] %>&cb=1"></script>
		
       <%-- <% Html.RenderSnippet("ORDERFORMSCRIPT"); %>--%>
<script type="text/javascript">
    $(document).ready(function () {
      //  $('#AcceptOfferButton').bind("click", validateForm);
        $('#ShippingIsDifferentThanBilling').bind("click", toggleShipping);
        toggleShipping();
        assembleProductCode();
        $('#Terms').bind("click", handleCartChange);
        $('#PayPalGender').bind("click", handleCartChange);
        $("input:radio[name='shadeOption'], input:radio[name='offerOption'], input:radio[name='offer']").bind("click", assembleProductCode);
    });
    $(window).on('load', function () {
        if (typeof gender != "undefined" && gender != "0" && gender.length > 1) {
            $('#Gender option:contains("' + gender + '")').prop('selected', 'true');
        }
        if (typeof emailOptVD != "undefined" && emailOptVD == "True") {
            $('#EmailOptInCbx').prop('checked', 'true');
        }
        if (typeof termsVD != "undefined" && termsVD == "True") {
            $('#Terms').prop('checked', 'true');
        }
        /*	_dtm.automateSteps = false;
            var allowAutomateSteps = false;*/

    });

    var item = document.getElementById('additionalInformation');

    $(document).on('click', '#otPayPal-braintree', function () {
        setTimeout(function () {
            item.scrollIntoView();
        }, 100);
    });

    $("[name=offer]").click(function () {
        if ($("#subscriptionStep1").is(":checked")) {
            $('.subscriptionOptions').show();
            $('.colorStep').html('STEP 3: Select your color');
            $('.reviewOrderTitle').html('STEP 4: Review Your Order');
            $('.paymentFormTitle').html('STEP 5: Select your payment method');
            $('.billingTitle').html('STEP 6: Enter your billing information');
            $('.shippingTitle').html('STEP 7: Enter your shipping information');
            if ($("#oneTimeOption").is(":checked")) {
                $('#oneTimeOption').prop('checked', false);
                assembleProductCode();
            }
        } else {
            $('.subscriptionOptions').hide();
            $('.colorStep').html('STEP 2: Select your color');
            $('.reviewOrderTitle').html('STEP 3: Review Your Order');
            $('.paymentFormTitle').html('STEP 4: Select your payment method');
            $('.billingTitle').html('STEP 5: Enter your billing information');
            $('.shippingTitle').html('STEP 6: Enter your shipping information');
        }
    });
    function assembleProductCode() {
        if ($("#oneTimeOption").is(":checked")) {
            if ($("#subscriptionStep1").is(":checked")) {
                $('#subscriptionStep1').prop('checked', false);
                $('.subscriptionOptions').hide();
                $('.colorStep').html('STEP 2: Select your color');
                $('.reviewOrderTitle').html('STEP 3: Review Your Order');
                $('.paymentFormTitle').html('STEP 4: Enter your billing information');
                $('.billingTitle').html('STEP 5: Enter your billing information');
                $('.shippingTitle').html('STEP 6: Enter your shipping information');

            }
        }
        if ($("input:radio[name='shadeOption']").is(":checked") && $("input:radio[name='offerOption']").is(":checked") && !$("#oneTimeOption").is(":checked")) {
            var productCode = $('[name=shadeOption]:checked').val() + $('[name=offerOption]:checked').val();
            $('#ActionCode1').val(productCode);
            $('#ActionQuantity1').val(1);
        } else if ($("input:radio[name='shadeOption']").is(":checked") && $('#oneTimeOption').is(':checked')) {
            var productCode = $('[name=shadeOption]:checked').val() + "1";
            $('#ActionCode1').val(productCode);
            $('#ActionQuantity1').val(1);
        }

        else {
            $('#ActionQuantity1').val(0);
        }
        handleCartChange();
    }
    function onFormPreValidation(event) {
        var errors = [];
        // T&C validation
        if (!$('#Terms').is(':checked')) {
            errors.push("Please agree to the terms & conditions before placing your order. Thank you!");
        }
        //Selected Item validation
        if ($("[name='shadeOption']:checked").val() == undefined) {
            errors.push("Please select your color");
        }
        if ($('#Gender').val() == "0") {
            errors.push("Please select a gender in step 6.");
        }

        return errors;
    }
    function validateFullName(fullName) {
        var fullNameRegex = new RegExp("([A-z.-]+\\s[A-z.-]+)");
        if (!fullNameRegex.test(fullName) || fullName.length < 1) {
            return false;
        } else {
            return true;
        }
    }
    function customBraintreeValidation() {
        var isValid = true;
        var errors = [];
        if (!validateTerms()) {
            errors.push("Please agree to the terms & conditions before placing your order. Thank you!");
            isValid = false;
        }
        if (!validateGender()) {
            errors.push("Please select a gender.");
            isValid = false;
        }
        if (!validateProducts()) {
            errors.push("Please select a product.");
            isValid = false;
        }
        _dtmShoppingCart.RemoveErrors(_dtmShoppingCart.CurrentErrors);
        if (!isValid) {
            _dtmShoppingCart.AddErrors(errors);
        }
        return isValid;
    }
    function customBraintreeToggleButton(hasProducts, actions) {
        return hasProducts && validateTerms() && validateGender() ? actions.enable() : actions.disable();
    }
    function validateTerms() {
        return $('#Terms').is(':checked');
    }
    function validateGender() {
        var gender = document.getElementById("Gender");
        if (gender && gender.value == "0") {
            return false;
        }
        return true;
    }
    function validateProducts() {
        var shoppingCart = typeof (_dtmShoppingCart) != "object" ? null : _dtmShoppingCart;

        if (shoppingCart != null && shoppingCart.Count() > 0) {
            var total = 0;
            $.each(shoppingCart.Items(), function (i, v) { total += v.qty; });
            return total > 0;
        } else if (shoppingCart != null) {
            return false;
        }
    }

    function customLoadItemState(productCode, qty) {
        if (!productCode.includes('SHIP')) {
            var offer = productCode.substr(5, 1);
            var color = productCode.substr(0, 5);
            $('#' + color).prop('checked', true);
            switch (offer) {
                case "3":
                    $('#subscriptionStep1').prop('checked', true);
                    $('#subscriptionOption30').prop('checked', true);
                    break;
                case "6":
                    $('#subscriptionStep1').prop('checked', true);
                    $('#subscriptionOption60').prop('checked', true);
                    break;
                case "1":
                    $('#subscriptionStep1').prop('checked', false);
                    $('#oneTimeOption').prop('checked', true);
                    break;
            }
        }
    }



       </script>

        <script>
            const setBraintreeHostedFieldsStyles = function () {
                return {
                    'font-size': '1em',
                    'font-family': 'Helvetica, Arial, sans-serif',
                    'font-weight': 'normal',
                    'line-height': 'normal',
                    'color': '#333',
                };
            };

            (function () {
                let emailOptIn = document.getElementById("EmailOptIn");
                document.getElementById("EmailOptInCbx").addEventListener("click", function () {
                    if (this.checked) {
                        emailOptIn.value = "True";
                    } else {
                        emailOptIn.value = "False";
                    }
                });

                document.getElementById("PayPalGender").addEventListener("change", function () {
                    document.getElementById("Gender").value = this.value;
                });

                const fieldset = document.getElementById("paypalFieldset");

                const updateFieldsetByRenderState = function (fieldset, renderState) {
                    fieldset.style.display = renderState;
                }

                updateFieldsetByRenderState(fieldset, "none");

                addEventListener("PaymentOptionSelected", function (e) {
                    const renderState = e.detail && e.detail.indexOf("PayPal") > -1 ? "block" : "none";

                    updateFieldsetByRenderState(fieldset, renderState);
                });
            })();
        </script>

<% } %>

<%= Model.FrameworkVersion %>

<div class="l-controls" aria-hidden="true" role="none" style="display: none">
	<% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
	<% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
	<% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
</div>