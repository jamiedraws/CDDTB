<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    bool showFilledPromo = ViewData["showFilledPromo"] as bool? ?? false;
    var bannerType = (String)ViewData["bannerType"] ?? "";
    var promoCode = "TDM21A";
    if (DtmContext.Version == 5) {
        promoCode = "TDM21B";
    }
%>

<% if (showFilledPromo) { %>
<div class="nav__banner banner banner--promo banner--more-text">
    <em class="banner__time">Limited Time!</em>
    <span><strong>SUBSCRIBE AND SAVE TODAY</strong> &ndash; Use Code: <strong><%= promoCode %></strong> <em><a href="#promo-disclaimer" class="has-fancybox">see details</a></em></span>
</div>
<div class="hide banner-disclaimer" id="promo-disclaimer">*Offer valid through February 20, 2021 (11:59pm EST) while supplies last. Promo code <%= promoCode %> automatically applied to save 15% off your order when subscription is selected. Cannot be combined with other offers. Free shipping. Can be redeemed at Toppik.com or by calling 1-(800)-844-2536. Offer not valid where other Toppik products are sold.</div>
<% } else if (bannerType == "summer") { %>
<div class="nav__banner banner banner--promo">
    <span class="banner__title">Summer SALE!</span>
    <span><b>SAVE 10%</b> with code: <strong>SUNFUN10</strong> <em><a href="#promo-disclaimer" data-fancybox>see details</a></em></span>
</div>
<div class="hide banner-disclaimer" id="promo-disclaimer">*Offer valid through July 11, 2022 (11:59pm EST) while supplies last. Use code SUNFUN10 to save 10%, Valid on first payment of subscriptions, standard pricing resumes on second shipment. Cannot be combined with other offers. Free shipping. Can be redeemed at Gettoppik.com. Offer not valid where other Toppik products are sold.</div>
<% } else { %>
    <% if (DtmContext.Version >= 6) { %>
    <div class="nav__banner banner banner--promo"><em class="banner__time">Limited Time!</em> <strong>save 15%</strong> &ndash; Use Code: <strong>LOVE15</strong> <em><a href="#promo-disclaimer" class="has-fancybox">see details</a></em></div>
    <div class="hide banner-disclaimer" id="promo-disclaimer">*Offer valid through February 21, 2021 (11:59pm EST) while supplies last. Use code LOVE15 to save 15%. Valid on first payment of subscriptions, standard pricing resumes on second shipment. Cannot be combined with other offers. Free shipping. Can be redeemed at GetToppik.com. Offer not valid where other Toppik products are sold.</div>
    <% } else { %>
    <div class="nav__banner banner banner--promo"><em class="banner__time">Limited Time!</em> <strong>15% off sitewide</strong> &ndash; Use Code: <strong>JOY2021</strong> <em><a href="#promo-disclaimer" class="has-fancybox">see details</a></em></div>
    <div class="hide banner-disclaimer" id="promo-disclaimer">*Offer valid through January 20, 2021 (11:59pm EST) while supplies last. Use code JOY2021 to save 15% off your order. Cannot be combined with other offers. Free shipping. Can be redeemed at Toppik.com or by calling 1-(800)-844-2536. Offer not valid where other Toppik products are sold.</div>
    <% } %>
<% } %>