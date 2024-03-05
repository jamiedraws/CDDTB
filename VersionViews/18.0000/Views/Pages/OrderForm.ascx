<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var showPromo = SettingsManager.ContextSettings["OrderFormReview.ShowPromoCodeButton", false];
%>
<script>
    var gender = '<%=ViewData["Gender"]%>';
    var emailOptVD = '<%=ViewData["EmailOptInCbx"]%>';
    var termsVD = '<%=ViewData["Terms"]%>';
</script>
<section aria-label="Checkout" class="view form section">
    <div id="order" class="view__anchor"></div>
    <div class="ft">
        <div class="ft__first">THIS OFFER IS NOT AVAILABLE IN STORES</div>
        <div class="ft__second">Fill out the form below to order your <strong><%= productName %></strong> now!</div>
    </div>
    <form autcomplete="on" action="/<%=DtmContext.OfferCode %>/<%=DtmContext.Version %>/<%=DtmContext.PageCode %><%=DtmContext.ApplicationExtension %>" method="post">
        <div class="view__in section__in">


            <div class="form">
                <div class="form__group form__group-section">
                    <div class="form__span-item">
                        <div class="callout">EXCLUSIVE WEB ONLY OFFER!</div>
                    </div>
                    <div class="view form__span-item">
                        <script>_AdaErrors = true;</script>
                        <div id="vse-errors" class="view__anchor"></div>
                        <div role="alert" class="vse" data-vse-scroll>
                            <%= Html.ValidationSummary("The following errors have occurred:") %>
                        </div>
                    </div>

                    <input type="hidden" name="ActionCode1" id="ActionCode1" value="TDBRS30" />
                    <input type="hidden" name="ActionQuantity1" id="ActionQuantity1" value="1" />
                    <div class="form__span-item form form--frame">
                        <div class="form__fieldset">
                            <h2 class="form__title">STEP 1: Select your offer</h2>
                            <div class="form__frame">
                                <div class="offer-group">
                                    <div class="offer-group__group">
                                        <div class="option option--set">
                                            <span class="corner-callout">
                                                <span>Best</span> 
                                                <span>Value</span>
                                            </span>
                                            <div class="option__group">
                                                <div class="option__text">
                                                    <label for="subscriptionStep1" id="subscriptionOffers" class="form">
                                                        <span class="option__input form__checkbox-label">
                                                            <input type="radio" id="subscriptionStep1" value="full" name="offer" checked="checked">
                                                            <span class="form__label">
                                                                <span class="form__checkbox"></span>
                                                                <span class="form__label-text">
                                                                    <span class="option__title">Full Hair Essentials</span>
                                                                    <span class="option__gifts">Includes Free Gifts!</span>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </label>
                                                    <div class="option__copy">
                                                        <div class="option__includes">
                                                            <strong>Your Order Includes</strong>
                                                            <ul>
                                                                <li>Hair Building Fibers (12g) color of your choice</li>
                                                                <li>FREE Spray Applicator</li>
                                                                <li>FREE Hairline Optimizer</li>
                                                            </ul>
                                                        </div>
                                                        <span class="option__offer option__group">
                                                            <span class="option__price-desc">Price: <span class="option__strike">$45.00</span></span>
                                                            <span class="option__price">
                                                                <span class="sr">
                                                                    <span class="sr__text">$24.95</span>
                                                                    <span class="offer" aria-hidden="true" role="presentation">
                                                                        <span class="offer__group">
                                                                            <span class="offer__currency">$</span>
                                                                            <span class="offer__amt">24</span>
                                                                            <span class="offer__follow">
                                                                                <span class="offer__cent">95</span>
                                                                                <span class="offer__disclaimer"></span>
                                                                            </span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            <span class="option__shipping">+ FREE SHIPPING!</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="option__product-caption">
                                                    <picture class="option__product option__fibers" data-src-img="/images/products/fibers.png">
                                                        <img src="/shared/images/blank.png" width="120" height="202" alt="Hair Building Fibers (12g) plus a FREE Hair Perfecting Duo Kit. A $20 value.">
                                                    </picture>
                                                    <div class="option__organizer">
                                                        <span class="option__caption">Subscribe &amp; Save!</span>
                                                        <picture class="option__product" data-src-img="/images/products/hairstyle-organizer.png">
                                                            <img src="/shared/images/blank.png" width="340" height="199" alt="Hair Building Fibers (12g) plus a FREE Hair Perfecting Duo Kit. A $20 value.">
                                                        </picture>
                                                        <span class="option__bonus-caption-group">
                                                            <span class="option__bonus-caption">
                                                                <b>FREE</b> Spray Applicator
                                                            </span>
                                                            <span class="option__bonus-caption">
                                                                <b>FREE</b> Hairline Optimizer
                                                            </span>
                                                        </span>
                                                        <div class="burst burst--tv burst--text-wrap">
                                                            <div class="burst__wrap">
                                                                <div class="burst__text-wrap">
                                                                    <span class="char1">F</span>
                                                                    <span class="char2">R</span>
                                                                    <span class="char3">E</span>
                                                                    <span class="char4">E</span>
                                                                    <span class="char5"> </span>
                                                                    <span class="char6">G</span>
                                                                    <span class="char7">I</span>
                                                                    <span class="char8">F</span>
                                                                    <span class="char9">T</span>
                                                                    <span class="char10">S</span>
                                                                </div>
                                                            </div>
                                                            <small>Special</small> 
                                                            <span>TV</span> 
                                                            <small>Offer!</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="offer-group__burst">
                                            <span class="burst burst--option">OR</span>
                                        </div>

                                        <div class="option option--single">
                                            <div class="option__group">
                                                <div class="option__text">
                                                    <label for="oneTimeOption" id="singleOffers" class="form">
                                                        <span class="option__input form__checkbox-label">
                                                            <input type="radio" id="oneTimeOption" name="offer" value="1" onclick="assembleProductCode()">
                                                            <span class="form__label">
                                                                <span class="form__checkbox"></span>
                                                                <span class="form__label-text">
                                                                    <span class="option__title">1 Time Order</span>
                                                                    <span class="option__gifts">No Free Gifts</span>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </label>
                                                    <div class="option__copy">
                                                        <div class="option__includes">
                                                            <strong>Your Order Includes</strong>
                                                            <ul>
                                                                <li>Hair Building Fibers (12g) color of your choice</li>
                                                            </ul>
                                                        </div>
                                                        <span class="option__offer option__group option__one-time-offer">
                                                            <span class="option__price-desc">Price: </span>
                                                            <span class="option__price">
                                                                <span class="sr">
                                                                    <span class="sr__text">$24.95</span>
                                                                    <span class="offer" aria-hidden="true" role="presentation">
                                                                        <span class="offer__group">
                                                                            <span class="offer__currency">$</span>
                                                                            <span class="offer__amt">24</span>
                                                                            <span class="offer__follow">
                                                                                <span class="offer__cent">95</span>
                                                                                <span class="offer__disclaimer"></span>
                                                                            </span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            <span class="option__shipping">+ $4.95 S&H</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="option__product-caption">
                                                    <picture class="option__product" data-src-img="/images/14.0000/products/fibers-12g.png">
                                                        <img src="/shared/images/blank.png" alt="Hair Building Fibers (12g)" width="120" height="202">
                                                    </picture>
                                                    <span class="option__caption">One time purchase
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form__span-item form form--frame subscriptionOptions">
                        <div class="form__fieldset">
                            <h2 class="form__title">STEP 2: Select your subscription type</h2>
                            <div class="form__frame">
                                <div class="offer-group">
                                    <div class="offer-group__group">
                                        <label for="subscriptionOption30" class="form option option--subscription">
                                            <span class="form__checkbox-label">
                                                <input
                                                    type="radio"
                                                    id="subscriptionOption30"
                                                    name="offerOption"
                                                    value="30"
                                                    aria-labelledby="subscriptionOption30Label" 
                                                    checked="checked"/>
                                                <span class="form__label">
                                                    <span class="form__checkbox"></span>
                                                    <span id="subscriptionOption30Label">Ship Every 30 Days</span>
                                                </span>
                                            </span>
                                        </label>
                                        <label for="subscriptionOption60" class="form option option--subscription">
                                            <span class="form__checkbox-label">
                                                <input
                                                    type="radio"
                                                    id="subscriptionOption60"
                                                    name="offerOption"
                                                    value="60"
                                                    aria-labelledby="subscriptionOption60Label" />
                                                <span class="form__label">
                                                    <span class="form__checkbox"></span>
                                                    <span id="subscriptionOption60Label">Ship Every 60 Days</span>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% if (showPromo) { %>
                    <div class="form__span-item form form--frame promoCode">
                        <div class="form__fieldset">
                            <h2 class="form__title">STEP 3: Enter Promo Code</h2>
                            <div class="form__frame">
                                <div data-validate-promo-code class="form form--field-button message message--promo-code">
                                    <div class="message__select">
                                        <div class="form__contain form__field-button">
                                            <input type="text" name="promoCode" id="promoCode" placeholder="Enter promo code" class="form__field ddlPromo dtm__restyle" data-required="true" aria-labelledby="promoCodeHeader" >
                                            <button type="button" onclick="submitEmailLead(); return false;" id="emailSubscribeButton" data-validate-form-type="submit" data-validate-form-page-code="Checkout" class="button form__button ddlPromoButton" onclick="_firstRun = false; handleCartChange();">
                                                <span>Apply</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="message__group" role="alert">
                                        <span class="message__invalid">Please enter a valid promo code.</span>
                                        <div id="promo-code-validation-status" class="message__valid"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                     <% } %>
                    <div class="form__span-item bg bg--shade form form--frame">
                        <div class="form__fieldset">
                            <h2 class="form__title colorStep">STEP 3: Select your color</h2>
                            <div class="form__frame">
                                <%= Html.Partial("Shades", Model, new ViewDataDictionary { { "isRadioGroup", true } }) %>
                            </div>
                        </div>
                    </div>
                    <div class="form__span-item form form--frame">
                        <div class="form__fieldset">
                            <h2 class="form__title reviewOrderTitle">STEP 4: Review Your Order</h2>
                            <div class="c-brand--form order-table reviewTable form__frame">
                                <% Html.RenderPartial("OrderFormReviewTable"); %>
                            </div>
                        </div>
                    </div>
                    <div class="form__span-item form__message"><span class="form__error">*</span> Indicates Required Field</div>
                    <div class="form__item">
                        <div class="form__group-section">
                            <div class="form__item form__section" data-viewport>
                                <div class="view__scroll form form--frame">
                                    <fieldset class="form__fieldset">
                                        <h2 class="form__title paymentFormTitle">STEP 5: Select your payment method</h2>
                                        <div class="form__frame">
                                            <!-- Card Type -->
                                            <div class="form__span-item form message">
                                                <div class="form__group">
                                                    <div id="cc" class="form__group form__payment-icons"></div>
                                                </div>
                                                <%
                                                    var cardTypeMessage = Html.ValidationMessageFor(m => m.CardType);
                                                    var cardTypeIsInvalid = cardTypeMessage != null;
                                                %>
                                                <div id="CardTypeCt" class="form__field-label">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <%= Html.DropDownList("CardType", new[]
                                                                {
                                                                    new SelectListItem { Text = "Visa", Value = "V"},
                                                                    new SelectListItem { Text = "Mastercard", Value = "M"},
                                                                    new SelectListItem { Text = "Discover", Value = "D"},
                                                                    new SelectListItem { Text = "American Express", Value= "AX"}
                                                                }, new { @class = "form__field dtm__restyle" })
                                                            %>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-chevron"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <label class="message__group" for="CardType" role="alert">
                                                        <span class="message__label">
                                                            <span class="form__error">* </span>Card Type
                                                        </span>
                                                        <span class="message__invalid">
                                                            <% if (cardTypeIsInvalid)
                                                            { %>
                                                            <%= cardTypeMessage %>
                                                            <% }
                                                            else
                                                            { %>
                                                                Please choose a card type.
                                                            <% } %>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="CardNumberCt" class="form__span-item">
                                                <div class="form__group" id="paymentInformation">
                                                    <div role="alert" id="vse-payment" data-vse-scroll></div>
                                                    <!-- Card Number -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var cardNumberMessage = Html.ValidationMessageFor(m => m.CardNumber);
                                                            var cardNumberIsInvalid = cardNumberMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="tel" name="CardNumber" id="CardNumber" placeholder="Card Number" data-required="true" data-validationtype="card" class="dtm__restyle form__field <%= cardNumberIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardNumber"] %>" autocomplete="cc-number">
                                                            <label for="CardNumber" class="message__label">
                                                                <span class="form__error">* </span>Card Number
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (cardNumberIsInvalid)
                                                                    { %>
                                                                    <%= cardNumberMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter a valid card number.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Card Expiration Month -->
                                                    <div id="CardExpirationCt" class="form message">
                                                        <%
                                                            var cardExpirationMonthMessage = Html.ValidationMessageFor(m => m.CardExpirationMonth);
                                                            var cardExpirationMonthIsInvalid = cardExpirationMonthMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.CardExpirationMonth("CardExpirationMonth", new { @id="CardExpirationMonth", @class = "form__field dtm__restyle", @data_required="true", @data_validationtype="cardExp", @data_parent="CardExpirationCt", @autocomplete = "cc-exp-month" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="CardExpirationMonth" class="message__label">
                                                                <span class="form__error">* </span>Card Expiration Month
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (cardExpirationMonthIsInvalid)
                                                                    { %>
                                                                    <%= cardExpirationMonthMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please choose an expiration month.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Card Expiration Year -->
                                                    <div id="CardExpirationYearCt" class="form message">
                                                        <%
                                                            var cardExpirationYearMessage = Html.ValidationMessageFor(m => m.CardExpirationYear);
                                                            var cardExpirationYearIsInvalid = cardExpirationYearMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @id="CardExpirationYear", @class = "form__field dtm__restyle", @autocomplete = "cc-exp-year" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="CardExpirationYear" class="message__label">
                                                                <span class="form__error">* </span>Card Expiration Year
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (cardExpirationYearIsInvalid)
                                                                    { %>
                                                                    <%= cardExpirationYearMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter an expiration year.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Card CVV2 -->
                                                    <div id="CardCVV2Ct" class="form__span-item form message">
                                                        <%
                                                            var cardCVV2Message = Html.ValidationMessageFor(m => m.CardCvv2);
                                                            var cardCVV2IsInvalid = cardCVV2Message != null;
                                                        %>
                                                        <div class="form__field-label form__cvv">
                                                            <input type="text" name="CardCvv2" id="CardCvv2" placeholder="CVV2" data-required="true" data-validationtype="cvv" class="dtm__restyle form__field <%= cardCVV2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardCvv2"] %>" autocomplete="cc-csc">
                                                            <label for="CardCvv2" class="message__label">
                                                                <span class="form__error">* </span>CVV2
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (cardCVV2IsInvalid)
                                                                    { %>
                                                                    <%= cardCVV2Message %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter a CVV number.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                            <a data-fancybox="" data-type="ajax" href="/shared/cvv.html" title="Learn What is CVV2" id="cvv2" class="account__link form__link">What is CVV2?</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="form__item form__section form__info-accordion view__scroll">
                                <div id="billingInformation" class="form__copy">
                                    <div class="form form--frame">
                                        <fieldset class="form__fieldset">
                                            <h2 class="form__title billingTitle">STEP 6: Enter your billing information</h2>

                                            <div class="form__span-item form__frame">
                                                <div class="form__group">

                                                    <!-- Full Name -->
                                                    <div class="form message">
                                                        <%
                                                            var billingFullNameMessage = Html.ValidationMessageFor(m => m.BillingFullName);
                                                            var billingFullNameIsInvalid = billingFullNameMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingFullName" id="BillingFullName" autocomplete="section-bill billing name" placeholder="Full Name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" class="dtm__restyle form__field <%= billingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingFullName"] %>" autocomplete="section-bill billing name">
                                                            <label for="BillingFullName" class="message__label">
                                                                <span class="form__error">* </span>Full Name
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingFullNameIsInvalid)
                                                                        { %>
                                                                    <%= billingFullNameMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter Full name.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <!-- Street -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var billingStreetMessage = Html.ValidationMessageFor(m => m.BillingStreet);
                                                            var billingStreetIsInvalid = billingStreetMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingStreet" id="BillingStreet" autocomplete="section-bill billing address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field <%= billingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet"] %>" autocomplete="section-bill billing address-line1">
                                                            <label for="BillingStreet" class="message__label">
                                                                <span class="form__error">* </span>Address
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStreetIsInvalid)
                                                                        { %>
                                                                    <%= billingStreetMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Street 2 -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var billingStreet2Message = Html.ValidationMessageFor(m => m.BillingStreet2);
                                                            var billingStreet2IsInvalid = billingStreet2Message != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingStreet2" id="BillingStreet2" autocomplete="section-bill billing address-line2" placeholder="Address 2" class="dtm__restyle form__field <%= billingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet2"] %>" autocomplete="section-bill billing address-line2">
                                                            <label for="BillingStreet2" class="message__label">
                                                                Address 2
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStreet2IsInvalid)
                                                                        { %>
                                                                    <%= billingStreet2Message %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- City -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingCityMessage = Html.ValidationMessageFor(m => m.BillingCity);
                                                            var billingCityIsInvalid = billingCityMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingCity" id="BillingCity" placeholder="City" autocomplete="section-bill billing address-level2" data-required="true" class="dtm__restyle form__field <%= billingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingCity"] %>" autocomplete="section-bill billing address-level2">
                                                            <label for="BillingCity" class="message__label">
                                                                <span class="form__error">* </span>City
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingCityIsInvalid)
                                                                        { %>
                                                                    <%= billingCityMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter a city.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- State -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingStateMessage = Html.ValidationMessageFor(m => m.BillingState);
                                                            var billingStateIsInvalid = billingStateMessage != null;
                                                        %>
                                                        <div class="form__field-label" id="billStateParent">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                               <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Labels["StatePlaceholder"], new { @class="dtm__restyle form__field", @data_required="true", @data_parent="billStateParent", @autocomplete="section-bill billing address-level1" }) %>
                                                                    
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="BillingState" class="message__label">
                                                                <span class="form__error">* </span>State
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStateIsInvalid)
                                                                        { %>
                                                                    <%= billingStateMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please choose a state.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Zip Code -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingZipMessage = Html.ValidationMessageFor(m => m.BillingZip);
                                                            var billingZipIsInvalid = billingZipMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingZip" id="BillingZip" placeholder="Zip Code" autocomplete="section-bill billing postal-code" data-required="true" class="ui-autocomplete-input dtm__restyle form__field <%= billingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingZip"] %>" autocomplete="section-bill billing postal-code">
                                                            <label for="BillingZip" class="message__label">
                                                                <span class="form__error">* </span>Zip Code
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingZipIsInvalid)
                                                                        { %>
                                                                    <%= billingZipMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter a zip code.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Country -->
                                                    <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                        <%
                                                            var billingCountryMessage = Html.ValidationMessageFor(m => m.BillingCountry);
                                                            var billingCountryIsInvalid = billingCountryMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["BillingCountry"]), new { @class="dtm__restyle form__field", @autocomplete = "section-bill billing country" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="BillingCountry" class="message__label">
                                                                <span class="form__error">* </span>Country
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingCountryIsInvalid)
                                                                        { %>
                                                                    <%= billingCountryMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please choose a country.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Phone -->
                                                    <div class="form message">
                                                        <%
                                                            var phoneMessage = Html.ValidationMessageFor(m => m.Phone);
                                                            var phoneIsInvalid = phoneMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="tel" name="Phone" id="Phone" autocomplete="section-bill billing tel" placeholder="Phone" data-required="true" data-validationtype="phone" class="dtm__restyle form__field <%= phoneIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Phone"] %>" autocomplete="section-bill billing phone">
                                                            <label for="Phone" class="message__label">
                                                                <span class="form__error">* </span>Phone
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (phoneIsInvalid)
                                                                        { %>
                                                                    <%= phoneMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter a phone number.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Email -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var emailMessage = Html.ValidationMessageFor(m => m.Email);
                                                            var emailIsInvalid = emailMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="email" name="Email" id="Email" autocomplete="section-bill billing email" title="Format example: someone@someplace.com" data-required="true" data-pattern="^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$" placeholder="Email" class="dtm__restyle form__field <%= emailIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Email"] %>" autocomplete="section-bill billing email">
                                                            <label for="Email" class="message__label">
                                                                <span class="form__error">* </span>Email
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (emailIsInvalid)
                                                                        { %>
                                                                    <%= emailMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter an email address.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Gender -->
                                                    <div class="form__span-item form message">
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <select name="Gender" id="Gender" autocomplete="section-bill billing sex" class="form__field" data-required="true">
                                                                        <option value="0">Choose an option</option>
                                                                        <option value="Female">Female</option>
                                                                        <option value="Male">Male</option>
                                                                        <option value="Other">Other</option>
                                                                    </select>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron" />
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label class="message__group" for="Gender" role="alert">
                                                                <span class="message__label">
                                                                    <span class="form__error">* </span>Who will be using the product?
                                                                </span>
                                                                <span class="message__invalid">Please choose a gender
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="form__span-item form message" id="ShippingIsSameDiv">
                                                        <div class="form__checkbox-label form__copy">
                                                            <input
                                                                type="checkbox"
                                                                id="ShippingIsDifferentThanBilling"
                                                                value="true"
                                                                aria-labelledby="ShippingIsDifferentThanBillingLabel"
                                                                onclick="if (this.checked) { $('#shippingInformation').show(); $('[name=ShippingIsDifferentThanBilling]').val('true'); } else { $('#shippingInformation').hide(); $('[name=ShippingIsDifferentThanBilling]').val('false'); }" />
                                                            <input name="ShippingIsDifferentThanBilling" type="hidden" value="false">
                                                            <label for="ShippingIsDifferentThanBilling" class="form__label">
                                                                <span class="form__checkbox"></span>
                                                                <span id="ShippingIsDifferentThanBillingLabel">Check if your shipping address is different than your billing address.</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>

                                    <div class="form form--frame message shipping" id="shippingInformation">
                                        <fieldset class="form__fieldset form__expando shipping__required">
                                            <h2 class="form__title shippingTitle">STEP 7: Enter your shipping information</h2>
                                            <div class="form__span-item form__frame">
                                                <div class="form__group">
                                                    <!-- Full Name -->
                                                    <div class="form message">
                                                        <%
                                                            var shippingFullNameMessage = Html.ValidationMessageFor(m => m.ShippingFullName);
                                                            var shippingFullNameIsInvalid = shippingFullNameMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" title="Name can only contain letters" autocomplete="section-ship shipping name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" name="ShippingFullName" id="ShippingFullName" placeholder="Full Name" class="dtm__restyle form__field shipping__required shipping__field <%= shippingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingFullName"] %>" autocomplete="section-ship shipping name">
                                                            <label for="ShippingFullName" class="message__label">
                                                                <span class="form__error">* </span>Full Name
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingFullNameIsInvalid)
                                                                    { %>
                                                                    <%= shippingFullNameMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter a Full name.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Street -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var shippingStreetMessage = Html.ValidationMessageFor(m => m.ShippingStreet);
                                                            var shippingStreetIsInvalid = shippingStreetMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingStreet" id="ShippingStreet"  autocomplete="section-ship shipping address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet"] %>" autocomplete="section-ship shipping address-line1">
                                                            <label for="ShippingStreet" class="message__label">
                                                                <span class="form__error">* </span>Address
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingStreetIsInvalid)
                                                                    { %>
                                                                    <%= shippingStreetMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter an address.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Street 2 -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var shippingStreet2Message = Html.ValidationMessageFor(m => m.ShippingStreet2);
                                                            var shippingStreet2IsInvalid = shippingStreet2Message != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingStreet2" id="ShippingStreet2" autocomplete="section-ship shipping address-line2" placeholder="Address 2" class="dtm__restyle form__field shipping__field <%= shippingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet2"] %>" autocomplete="section-ship shipping address-line2">
                                                            <label for="ShippingStreet2" class="message__label">
                                                                Address 2
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingStreet2IsInvalid)
                                                                    { %>
                                                                    <%= shippingStreet2Message %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter an address.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- City -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingCityMessage = Html.ValidationMessageFor(m => m.ShippingCity);
                                                            var shippingCityIsInvalid = shippingCityMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingCity" id="ShippingCity" autocomplete="section-ship shipping address-level2" placeholder="City" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingCity"] %>" autocomplete="section-ship shipping address-level2">
                                                            <label for="ShippingCity" class="message__label">
                                                                <span class="form__error">* </span>City
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingCityIsInvalid)
                                                                    { %>
                                                                    <%= shippingCityMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter a city.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- State -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingStateMessage = Html.ValidationMessageFor(m => m.ShippingState);
                                                            var shippingStateIsInvalid = shippingStateMessage != null;
                                                        %>
                                                        <div class="form__field-label" id="billStateParent">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Context["StatePlaceholder"], new { @class="dtm__restyle form__field shipping__required shipping__field", @autocomplete="section-ship shipping address-level1" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="ShippingState" class="message__label">
                                                                <span class="form__error">* </span>State
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingStateIsInvalid)
                                                                    { %>
                                                                    <%= shippingStateMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please choose a state.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Zip Code -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var shippingZipMessage = Html.ValidationMessageFor(m => m.ShippingZip);
                                                            var shippingZipIsInvalid = shippingZipMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="ShippingZip" id="ShippingZip" autocomplete="section-ship shipping postal-code" placeholder="Zip Code" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingZip"] %>" autocomplete="section-ship shipping postal-code">
                                                            <label for="ShippingZip" class="message__label">
                                                                <span class="form__error">* </span>Zip Code
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingZipIsInvalid)
                                                                    { %>
                                                                    <%= shippingZipMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please enter a zip code.
                                                                    <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Country -->
                                                    <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                        <%
                                                            var shippingCountryMessage = Html.ValidationMessageFor(m => m.ShippingCountry);
                                                            var shippingCountryIsInvalid = shippingCountryMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["ShippingCountry"]), new { @class="dtm__restyle form__field", @autocomplete = "section-ship shipping country" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="ShippingCountry" class="message__label">
                                                                <span class="form__error">* </span>Country
                                                            </label>
                                                            <label class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (shippingCountryIsInvalid)
                                                                    { %>
                                                                    <%= shippingCountryMessage %>
                                                                    <% }
                                                                    else
                                                                    { %>
                                                                        Please choose a country.
                                                                    <% } %>
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="view form form--frame">
                                    <div id="additionalInformation" class="view__anchor"></div>
                                    <div class="form__copy">
                                        <fieldset class="form__fieldset">
                                            <h2 class="form__title">Additional Information</h2>

                                            <div class="form__copy form__frame">
                                                <!-- Gender -->
                                                <div id="paypalFieldset" class="form__span-item form message">
                                                    <div class="form__field-label">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <select name="PayPalGender" id="PayPalGender" class="form__field">
                                                                    <option value="0">Choose an option</option>
                                                                    <option value="Female">Female</option>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Other">Other</option>
                                                                </select>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-chevron" />
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label class="message__group" for="PayPalGender" role="alert">
                                                            <span class="message__label">
                                                                <span class="form__error">* </span>Who will be using the product?
                                                            </span>
                                                            <span class="message__invalid">Please choose a gender
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="form__span-item form message">
                                                    <div class="form__checkbox-label">
                                                        <input type="hidden" name="EmailOptIn" id="EmailOptIn" value="False" />
                                                        <input
                                                            type="checkbox"
                                                            id="EmailOptInCbx"
                                                            name="EmailOptInCbx"
                                                            aria-labelledby="EmailOptInCbxLabel" />
                                                        <label for="EmailOptInCbx" class="form__label">
                                                            <span class="form__checkbox"></span>
                                                            <span id="EmailOptInCbxLabel">Yes, I'd like to receive promotional communications from Toppik. Please review Church & Dwight's <a id="emailoptin-privacy-policy" href="https://churchdwight.com/privacy-policy.aspx" target="_blank">Privacy Policy</a> to understand how Church & Dwight collects and uses personal information.</span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="form__span-item form message">
                                                    <div class="form__checkbox-label">
                                                        <input
                                                            type="checkbox"
                                                            id="Terms"
                                                            name="Terms"
                                                            required
                                                            aria-labelledby="TermsLabel" />
                                                        <label for="Terms" class="form__label">
                                                            <span class="form__checkbox"></span>
                                                            <span id="TermsLabel">
                                                                <span class="form__error">*</span> By checking this box, you are electronically signing your order, agreeing to the terms and to our general <a id="dyn-tos-pp-link2" href="Terms<%= DtmContext.ApplicationExtension %>" target="_blank">Terms and Conditions</a>, including our no-commitment auto-replenishment program, and authorizing us to charge this payment to the credit card you have provided.</span>
                                                        </label>
                                                        <div class="message__group" role="alert">
                                                            <span class="message__invalid">Please accept the terms and conditions</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form__copy form__action-text">
                    <div class="form__action">
                        <button type="submit" id="AcceptOfferButton" name="acceptOffer" class="button button--second button--express-checkout orderbtn form_validation_required" data-state="card" data-order-type='{ "PayPalEC" : "Continue with PayPal", "CARD" : "Process Order" }'>
                            <span>Process Order</span>
                        </button>
                    </div>
                    <p id="disclaimerText">By clicking Process Order, your credit card will be charged the amount above. Click only once.</p>

                    <div class="offer-details">
                        <% Html.RenderSnippet("OFFERDETAILS"); %>
                    </div>
                </div>
            </div>

        </div>
    </form>
</section>

<section aria-labelledby="mbg-title" id="offer-details-more" class="view content content--mbg section">
    <div class="view__in section__contain">
        <picture class="mbg" data-src-img="/images/mbg.svg">
            <img src="/shared/images/blank.png" width="100" height="100" alt="30 Day Money Back Guarantee">
        </picture>
        <div class="content__text">
            <h2 id="mbg-title" class="content__title">MONEY-BACK GUARANTEE</h2>
            <p>If you are not completely satisfied with your order, simply return your product within 30 days of receipt of your order to receive a full refund, less shipping and handling charges.</p>

            <p>If you wish to return your product, please call Customer Service at <strong>1-800-THICKEN (844-2536)</strong> within 30 days of receiving your shipment. Once you have received your Return Merchandise Authorization Number (RMA), you will need to write it on your return label. Shipments without a RMA will not be accepted for returns. Shipping charges are non-refundable. Other conditions may apply.</p>
        </div>
    </div>
    <noscript>
        <style>
            .content--mbg {
                display: block;
            }
        </style>
    </noscript>

</section>
