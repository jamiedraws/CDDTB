<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<div class="c-brand--form load-item__progress">
    <% using (Html.BeginForm())
        { %>

    <%
        var renderOfferDetailsAboveAcceptOffer = SettingsManager.ContextSettings["Order.RenderOfferDetailsAboveAcceptOffer", false];
        var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
        var productName = productAttributeName.Replace("�", "<sup>&trade;</sup>");
        var productNameNoLegal = productAttributeName.Replace("�", "");

        var showPromo = SettingsManager.ContextSettings["OrderFormReview.ShowPromoCodeButton", false];
    %>

    <script>
        var gender = '<%=ViewData["Gender"]%>';
        var emailOptVD = '<%=ViewData["EmailOptInCbx"]%>';
        var termsVD = '<%=ViewData["Terms"]%>';

    </script>

    <link rel="stylesheet" href="/css/13.0000/form.css?v=4">

    <div class="form__group">

        <div class="form__row">
            <div class="vse" data-vse-scroll><%= Html.ValidationSummary("The following errors have occurred:") %></div>

            <div>

                <div class="offer-title">SPECIAL TV OFFER</div>

                <div class="c-brand--form__fieldset">
                    <div class="FormHeadlineL c-brand--form__headline c-brand--form__legend"><strong>STEP 1:</strong> Select Your Offer</div>

                    <div class="options">

                        <label class="option"  for="subscriptionOption" id="subscriptionOffers">
                            <div class="option__input">
                                <input type="radio" id="subscriptionOption" name="offerOption"  value="true" data-eflex="draw">
                            </div>
                            <div class="option__text">
                                <div class="option__title">Full Hair Essentials</div>
                                <div class="option__gifts">Includes Free Gifts!</div>
                                <div class="option__includes">
                                    <strong>Your Order Includes</strong>
                                    <ul>
                                        <li>Hair Building Fibers (27.5g) Color of your choice</li>
                                        <li>Travel Cosmetic Bag</li>
                                        <li>Hair Building Fibers (Travel Size)</li>
                                        <li>FiberHold Spray (Travel Size)</li>
                                        <li>Hair Fattener Advanced Thickening Serum (Travel Size)</li>
                                    </ul>
                                </div>
                                <div class="option__offer">
                                    <span>Regular Price: </span>
                                    <span class="offer__strike">$80.00</span> 
                                    <span class="offer__price">$39.99</span> 
                                    <span class="offer__savings">SAVE 50%</span>
                                </div>
                            </div>
                            <figure class="option__image">
                                <picture class="option__set-image" data-src-img="/images/products/full-hair-essentials.jpg" data-tag='{ "img" : [{ "src" : "/images/products/full-hair-essentials.jpg", "alt" : "<%= productName %> Set - Full Hair Essentials" }]}'>
                                    <noscript>
                                        <img src="/images/products/full-hair-essentials.jpg" alt="<%= productName %> Set - Full Hair Essentials">
                                    </noscript>
                                </picture>
                                <figcaption>Subscribe &amp; Save!</figcaption>
                            </figure>
                        </label>

                        <div class="or">OR</div>

                        <label for="oneTimeOption" class="option option--single" id="singleOffers">
                            <div class="option__input">
                                <input type="radio"  id="oneTimeOption" name="offerOption"  value="false"  data-eflex="draw">
                            </div>
                            <div class="option__text">
                                <div class="option__title">1 Time Order</div>
                                <div class="option__gifts">No Free Gifts</div>
                                <div class="option__includes">
                                    <strong>Your Order Includes</strong>
                                    <ul>
                                        <li>Hair Building Fibers (27.5g) Color of your choice</li>
                                    </ul>
                                </div>
                                <div class="option__offer">
                                    <span>Price: </span>
                                    <span class="offer__price">$46.95</span> 
                                </div>
                         </div>
                         <figure class="option__image">
                                <picture class="option__single-image" data-src-img="/images/products/one-time-purchase.jpg" data-tag='{ "img" : [{ "src" : "/images/products/one-time-purchase.jpg", "alt" : "<%= productName %>" }]}'>
                                    <noscript>
                                        <img src="/images/products/one-time-purchase.jpg" alt="<%= productName %>">
                                    </noscript>
                                </picture>
                                <figcaption>
                                    One time purchase
                                </figcaption>
                          </figure>
                        </label>
                        
                    </div>
                </div>

                <div class="c-brand--form__fieldset">
                    <div class="FormHeadlineL c-brand--form__headline c-brand--form__legend"><strong>STEP 2:</strong> Choose Your Color</div>
                    <%= Html.Partial("Shades", Model, new ViewDataDictionary { { "productType", "step2Shades" } }) %>
                </div>

            </div>

        </div>

        <% if (showPromo) { %>

        <div class="promo success-message-container form__row" id="promo">

        <label class="promo__label" for="promoCode">
            <strong>PROMO CODE:</strong>
        </label>

        <input type="text" class="ddlPromo u-vw--100 c-brand--form__input o-box o-shadow fx--animate" name="promoCode" id="promoCode">


        <input type="button" class="confirm-button ddlPromoButton u-vw--100" value="Apply Code" onclick="_firstRun = false; handleCartChange();">


        <!-- // Promo Validation Message -->
        <div class="promo-message hide center-text top-margin">
            <div class="container bg--white u-vw--100 no-margin">
                    <i class="icon-checkmark"></i> <p class="message__in column-block no-margin">Thank you! Your promo code was applied.</p>
                </div>
            </div>


        </div>
        <% } %>

        <div class="form__row">
            <div class="form__border reviewTable">
                <%= Html.Partial("OrderFormReviewTable", Model) %>
            </div>
        </div>

        <div class="form__row">

            <p data-required class="u-mar--bottom fn--center"><%= LabelsManager.Labels["RequiredFieldDisclaimer"] %></p>

            <div class="form__group">
                <div class="form__section">

                    <div class="view__scroll">
                        <%-- // BEGIN #paymentForm --%>
                        <fieldset id="paymentForm" class="form__border">

                            <%-- // @PAYMENT HEADLINE --%>
                            <div class="c-brand--form__legend u-vw--100">
                                <h3 class="c-brand--form__headline"><strong>STEP 3:</strong> Select Your Payment Method
                                </h3>
                            </div>

                            <div class="form__payment">
                                <ul class="form__fieldset">

                                    <%-- // @PAYMENT ICONS --%>
                                    <li class="c-brand--form__item o-grid--vert--center u-vw--100">
                                        <div id="cc" class="c-brand--form__field o-grid__col @xs-u-bs--reset @xs-u-vw--100"></div>
                                    </li>

                                    <%-- // @PAYMENT TYPE --%>
                                    <li id="CardTypeCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                        <label for="CardType" data-required class="c-brand--form__label">Type</label>
                                        <%= Html.DropDownList("CardType", new[]
                                                    {
                                                    new SelectListItem { Text = "Visa", Value = "V"},
                                                    new SelectListItem { Text = "Mastercard", Value = "M"},
                                                    new SelectListItem { Text = "Discover", Value = "D"},
                                                    new SelectListItem { Text = "American Express", Value= "AX"}
                                                }, new { @class = "c-brand--form__select o-box o-shadow u-vw--100 fx--animate" })
                                        %>
                                    </li>

                                    <%-- // @PAYMENT NUMBER --%>
                                    <li id="CardNumberCt" class="c-brand--form__item o-grid--vert--center u-vw--100 form__field">
                                        <label id="CardNumberLabel" for="CardNumber" data-required class="c-brand--form__label"><%= LabelsManager.Labels["CardNumber"] %></label>
                                        <input id="CardNumber" name="CardNumber" type="tel" value="<%= ViewData["CardNumber"] %>" placeholder="<%= LabelsManager.Labels["CardNumberPlaceholder"] %>" aria-labelledby="CardNumberLabel" aria-required="true" class="c-brand--form__input o-grid__col o-box o-shadow @mv-u-vw--100 fx--animate">
                                    </li>

                                    <%-- // @PAYMENT EXP. DATE --%>
                                    <li id="CardExpirationCt" class="c-brand--form__item o-grid--vert--center u-vw--100 form__field">
                                        <label for="CardExpirationMonth" data-required class="c-brand--form__label"><%= LabelsManager.Labels["ExpirationDate"] %></label>
                                        <div class="form__group form__group--item">
                                            <div class="form__item">
                                                <%= Html.CardExpirationMonth("CardExpirationMonth", new { @class = "c-brand--form__select o-box o-shadow u-vw--100 fx--animate" }) %>
                                            </div>
                                            <div class="form__item">
                                                <%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @class = "c-brand--form__select o-box o-shadow u-vw--100 fx--animate" }) %>
                                            </div>
                                        </div>
                                    </li>

                                    <%-- // @PAYMENT CVV2 --%>
                                    <li id="CardCvv2Ct" class="c-brand--form__item o-grid--vert--center u-vw--100 form__field">
                                        <label id="CardCvv2Label" for="CardCvv2" data-required class="c-brand--form__label"><%= LabelsManager.Labels["CVV2"] %></label>
                                        <div class="form__group form__group--item">
                                            <div class="form__item">
                                                <input id="CardCvv2" name="CardCvv2" type="tel" value="<%= ViewData["CardCvv2"] %>" maxlength="5" placeholder="<%= LabelsManager.Labels["CVV2Placeholder"] %>" aria-labelledby="CardCvv2Label" aria-required="true" class="c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </div>
                                            <div class="form__item">
                                                <a href="<%= LabelsManager.Labels["CVV2DisclaimerLink"] %>" title="<%= LabelsManager.Labels["CVV2DisclaimerLinkTitle"] %>" id="cvv2" class="c-brand--form__hint o-grid__col @xs-u-vw--100 has-fancybox fancybox.ajax"><%= LabelsManager.Labels["CVV2Disclaimer"] %></a>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>

                        </fieldset>
                        <%-- // END #paymentForm --%>
                    </div>

                </div>

                <div class="form__section">
                    <div id="billingInformation">
                        <div class="view__scroll">
                            <div class="form__border">

                                <%-- // @BILLING HEADLINE --%>
                                <div class="c-brand--form__legend u-vw--100">
                                    <h3 class="c-brand--form__headline">
                                        <strong>STEP 4:</strong> Enter Your Billing Information
                                </h3>
                                </div>

                                <div class="form__billing">

                                    <%-- // BEGIN #billingInformation --%>
                                    <fieldset>
                                        <ul class="form__fieldset">

                                            <%-- // @BILLING FULL NAME --%>
                                            <li id="BillingFullNameCt" class="form__field">
                                                <label id="BillingFullNameLabel" for="BillingFullName" data-required class="c-brand--form__label"><%= LabelsManager.Labels["FullName"] %></label>
                                                <input id="BillingFullName" maxlength="50" name="BillingFullName" type="text" value="<%= ViewData["BillingFullName"] %>" placeholder="<%= LabelsManager.Labels["FullNamePlaceholder"] %>" aria-labelledby="BillingFullNameLabel" aria-required="true" class="c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @BILLING STREET --%>
                                            <li id="BillingStreetCt" class="form__field">
                                                <label id="BillingStreetLabel" for="BillingStreet" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Address"] %></label>
                                                <div class=" @xs-u-bs--reset fld">
                                                    <input id="BillingStreet" name="BillingStreet" type="text" value="<%= ViewData["BillingStreet"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["AddressPlaceholder"] %>" aria-labelledby="BillingStreetLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                                </div>
                                            </li>

                                            <%-- // @BILLING STREET 2 --%>
                                            <li id="BillingStreet2Ct" class="form__field">
                                                <label id="BillingStreet2Label" for="BillingStreet2" class="c-brand--form__label"><%= LabelsManager.Labels["Address2"] %></label>
                                                <input id="BillingStreet2" name="BillingStreet2" type="text" value="<%= ViewData["BillingStreet2"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["Address2Placeholder"] %>" aria-labelledby="BillingStreet2Label" aria-required="false" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @BILLING CITY --%>
                                            <li id="BillingCityCt" class="form__field">
                                                <label id="BillingCityLabel" for="BillingCity" data-required class="c-brand--form__label"><%= LabelsManager.Labels["City"] %></label>
                                                <input id="BillingCity" name="BillingCity" type="text" value="<%= ViewData["BillingCity"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["CityPlaceholder"] %>" aria-labelledby="BillingCityLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @BILLING COUNTRY --%>
                                            <li id="BillingCountryCt" class="form__field">
                                                <label id="BillingCountryLabel" for="BillingCountry" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Country"] %></label>
                                                <%= Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName"), LabelsManager.Labels["CountryPlaceholder"], new { @class = "c-brand--form__select o-box o-shadow @xs-u-vw--100 fx--animate" }) %>
                                        </li>

                                            <%-- // @BILLING STATE --%>
                                            <li id="BillingStateCt" class="form__field">
                                                <label id="BillingStateLabel" for="BillingState" data-required class="c-brand--form__label"><%= LabelsManager.Labels["State"] %></label>
                                                <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Labels["StatePlaceholder"], new { @class = "c-brand--form__select o-box o-shadow @xs-u-vw--100 fx--animate" }) %>
                                        </li>

                                            <%-- // @BILLING ZIP --%>
                                            <li id="BillingZipCt" class="form__field">
                                                <label id="BillingZipLabel" for="BillingZip" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Zip"] %></label>
                                                <input id="BillingZip" name="BillingZip" type="tel" value="<%= ViewData["BillingZip"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["ZipPlaceholder"] %>" aria-labelledby="BillingZipLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @PHONE --%>
                                            <li id="PhoneCt" class="form__field">
                                                <label id="PhoneLabel" for="Phone" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Phone"] %></label>
                                                <input id="Phone" name="Phone" type="tel" value="<%= ViewData["Phone"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["PhonePlaceholder"] %>" aria-labelledby="PhoneLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @EMAIL --%>
                                            <li id="EmailCt" class="form__field">
                                                <label id="EmailLabel" for="Email" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Email"] %></label>
                                                <input id="Email" name="Email" type="email" value="<%= ViewData["Email"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["EmailPlaceholder"] %>" aria-labelledby="EmailLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <li id="GenderCt" class="form__field">
                                                <label id="GenderLabel" for="Gender" data-required class="c-brand--form__label">Who will be using the product?</label>
                                                <select id="Gender" name="Gender">
                                                    <option value="0">Choose an option</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Male">Male</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </li>

                                            <% if (SettingsManager.ContextSettings["OrderFormReview.ShowPrivacyPolicy", false])
                                                { %>
                                            <%-- // @PRIVACY POLICY --%>
                                            <li id="PrivacyCt" class="form__field">
                                                <a href="<%= SettingsManager.ContextSettings["OrderFormReview.PrivacyPolicyLink"] %><%= Model.Extension %>" title="<%= SettingsManager.ContextSettings["Label.ProductName"] %> | <%= LabelsManager.Labels["PrivacyPolicyText"] %>">
                                                    <%= LabelsManager.Labels["PrivacyPolicyText"] %>
                                            </a>
                                            </li>
                                            <% } %>
                                        </ul>
                                    </fieldset>

                                    <div class="form__fieldset">
                                        <hr>

                                        <%-- // BEGIN #ShippingIsSame --%>
                                        <label id="ShippingIsSame" for="ShippingIsDifferentThanBilling" class="o-grid--vert--center">
                                            <div class="o-grid__col u-pad"><%= Html.CheckBoxFor(m => m.ShippingIsDifferentThanBilling) %></div>
                                            <p class="o-grid__col u-pad"><%= LabelsManager.Labels["IsShippingDifferentFromBillingDisclaimer"] %></p>
                                        </label>
                                        <%-- // END #ShippingIsSame --%>
                                    </div>

                                    <%-- // BEGIN #shippingInformation --%>
                                    <fieldset id="shippingInformation" class="u-mar--top">

                                        <ul class="form__fieldset">

                                            <%-- // @SHIPPING FULL NAME --%>
                                            <li id="ShippingFullNameCt" class="form__field">
                                                <label id="ShippingFullNameLabel" for="ShippingFullName" data-required class="c-brand--form__label"><%= LabelsManager.Labels["FullName"] %></label>
                                                <input id="ShippingFullName" name="ShippingFullName" type="text" value="<%= ViewData["ShippingFullName"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["FullNamePlaceholder"] %>" aria-labelledby="ShippingFullNameLabel" aria-required="true" class="c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @SHIPPING STREET --%>
                                            <li id="ShippingStreetCt" class="form__field">
                                                <label id="ShippingStreetLabel" for="ShippingStreet" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Address"] %></label>
                                                <input id="ShippingStreet" name="ShippingStreet" type="text" value="<%= ViewData["ShippingStreet"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["AddressPlaceholder"] %>" aria-labelledby="ShippingStreetLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @SHIPPING STREET 2 --%>
                                            <li id="ShippingStreet2Ct" class="form__field">
                                                <label id="ShippingStreet2Label" for="ShippingStreet2" class="c-brand--form__label"><%= LabelsManager.Labels["Address2"] %></label>
                                                <input id="ShippingStreet2" name="ShippingStreet2" type="text" value="<%= ViewData["ShippingStreet2"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["Address2Placeholder"] %>" aria-labelledby="ShippingStreet2Label" aria-required="false" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @SHIPPING CITY --%>
                                            <li id="ShippingCityCt" class="form__field">
                                                <label id="ShippingCityLabel" for="ShippingCity" data-required class="c-brand--form__label"><%= LabelsManager.Labels["City"] %></label>
                                                <input id="ShippingCity" name="ShippingCity" type="text" value="<%= ViewData["ShippingCity"] %>" maxlength="50" placeholder="<%= LabelsManager.Labels["CityPlaceholder"] %>" aria-labelledby="ShippingCityLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                            <%-- // @SHIPPING COUNTRY --%>
                                            <li id="ShippingCountryCt" class="form__field">
                                                <label for="ShippingCountry" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Country"] %></label>
                                                <%= Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName"), LabelsManager.Labels["CountryPlaceholder"], new { @class = "c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 fx--animate" })%>
                                        </li>

                                            <%-- // @SHIPPING STATE --%>
                                            <li id="ShippingStateCt" class="form__field">
                                                <label for="ShippingState" data-required class="c-brand--form__label"><%= LabelsManager.Labels["State"] %></label>
                                                <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Labels["StatePlaceholder"], new { @class = "c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 fx--animate" })%>
                                        </li>

                                            <%-- // @SHIPPING ZIP --%>
                                            <li id="ShippingZipCt" class="form__field">
                                                <label id="ShippingZipLabel" for="ShippingZip" data-required class="c-brand--form__label"><%= LabelsManager.Labels["Zip"] %></label>
                                                <input id="ShippingZip" name="ShippingZip" type="tel" value="<%= ViewData["ShippingZip"] %>" maxlength="10" placeholder="<%= LabelsManager.Labels["ZipPlaceholder"] %>" aria-labelledby="ShippingZipLabel" aria-required="true" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 fx--animate">
                                            </li>

                                        </ul>

                                    </fieldset>
                                    <%-- // END #shippingInformation --%>
                                </div>

                            </div>

                        </div>
                    </div>
                    <fieldset id="paypalFieldset" style="display:none">
                        <ul class="form__fieldset">
                            <li id="PayPalGenderCt" class="form__field">
                                <label id="PayPalGenderLabel" for="PayPalGender" data-required class="c-brand--form__label">Who will be using the product?</label>
                                <select id="PayPalGender">
                                    <option value="0">Choose an option</option>
                                    <option value="Female">Female</option>
                                    <option value="Male">Male</option>
                                    <option value="Other">Other</option>
                                </select>
                            </li>
                        </ul>
                    </fieldset>
                    <label id="EmailOptInLabel" for="EmailOptInCbx" class="o-grid terms-checkbox">
                        <div class="o-grid__col u-pad eflex-checkmark">
                            <input id="EmailOptInCbx" name="EmailOptInCbx" type="checkbox" data-eflex="draw" data-eflex-icon="checkmark" value="True" style="display: none;">
                            <svg tabindex="0" class="eflex-checkmark__svg " viewBox="0 0 52 52" role="checkbox">
                                <circle class="eflex-checkmark__circle" cx="26" cy="26" r="25" fill="none"></circle>
                                <path class="eflex-checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"></path>
                            </svg>
                        </div>
                        <p class="o-grid__col u-pad">Yes, I'd like to receive promotional communications from Toppik. <span style="font-weight: normal; color: #666;">Please review Church & Dwight's <a id="emailoptin-privacy-policy" href="https://churchdwight.com/privacy-policy.aspx" target="_blank">Privacy Policy</a> to understand how Church & Dwight collects and uses personal information.</span></p>
                    </label>
                    <input type="hidden" name="EmailOptIn" id="EmailOptIn" value="False" />
                    <label id="TermsLabel" for="Terms" class="o-grid terms-checkbox">
                        <div class="o-grid__col u-pad eflex-checkmark">
                            <input id="Terms" name="Terms" type="checkbox" data-eflex="draw" data-eflex-icon="checkmark" value="True" style="display: none;">
                            <svg tabindex="0" class="eflex-checkmark__svg " viewBox="0 0 52 52" role="checkbox">
                                <circle class="eflex-checkmark__circle" cx="26" cy="26" r="25" fill="none"></circle>
                                <path class="eflex-checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"></path>
                            </svg>
                        </div>
                        <p class="o-grid__col u-pad" data-required>By checking this box, you are electronically signing your order, agreeing to the terms and to our general <a id="dyn-tos-pp-link2" href="Terms.dtm" target="_blank">Terms and Conditions</a>, including our no-commitment auto-replenishment program, and authorizing us to charge this payment to the credit card you have provided.</p>
                    </label>
                </div>
            </div>
        </div>
        <script>
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

            })();
        </script>

        <div class="form__row">

            <%-- // BEGIN #calltoAction --%>
            <fieldset id="calltoAction" class="c-brand--form__fieldset--borderless">

                <ul class="form__fieldset">
                    <%-- // @PROCESS ORDER BUTTON --%>
                    <li class="form__field form__submit">
                        <button id="AcceptOfferButton" name="acceptOffer" type="submit" class="button button--order">
                            Process Order

                        </button>
                    </li>

                    <%-- // @PROCESS ORDER TEXT --%>
                    <li class="c-brand--form__submission o-grid--vert--center u-vw--100 fn--center u-mar--top" tabindex="0">
                        <p><%= LabelsManager.Labels["SubmissionDisclaimer"] %></p>
                        <% Html.RenderSiteControl("InsureShipCheckbox"); %>
                    </li>

                    <%-- // @SSL BADGE --%>
                    <li class="form__field u-mar--vert @x2-mar">
                        <picture data-src-img="/shared/images/PositiveSSL_tl_trans.png" data-attr='{ "alt" : "Secure Site. SSL Encryption" }'>
                            <noscript>
                                <img src="/shared/images/PositiveSSL_tl_trans.png" alt="Secure Site. SSL Encryption">
                            </noscript>
                        </picture>
                    </li>
                </ul>

                <div class="l-disclaimer o-box @mv-u-vw--80 u-mar--center">
                    <% Html.RenderSnippet("OFFERDETAILS"); %>
                </div>

            </fieldset>
            <%-- // END #calltoAction --%>
        </div>

    </div>
    <% } %>
</div>
