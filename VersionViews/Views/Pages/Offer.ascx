<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>


<%
    var label = ViewData["label"] as string ?? "This will be announced by screen readers.";
    var standfirst = ViewData["standfirst"] as string ?? string.Empty;
    var paymentInstallment = ViewData["paymentInstallment"] as int? ?? 1;
    var dollar = ViewData["dollar"] as string ?? "XX";
    var cent = ViewData["cent"] as string ?? string.Empty;
    var disclaimer = ViewData["disclaimer"] as string ?? string.Empty;
    var cssClasses = ViewData["cssClasses"] as string ?? string.Empty;
    var hasCrossout = ViewData["hasCrossout"] as string ?? string.Empty;
    var hasMore = ViewData["hasMore"] as string ?? string.Empty;

    var discountOf = ViewData["discountOf"] as ViewDataDictionary ?? new ViewDataDictionary();
    var hasDiscountOf = discountOf.Count() > 0;

    var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    var productName = productAttributeName.Replace("�", "<sup>&trade;</sup>");
    var productNameNoLegal = productAttributeName.Replace("�", "");
%>

<div class="offer offer--product <%= cssClasses %>">
    <% if (!String.IsNullOrEmpty(standfirst)) { %>
    <div class="offer__txt <%= hasCrossout %>">
      <%= standfirst %>
    </div>
    <% } %>
    <% if (hasDiscountOf) {
            var dollarDiscountOf = discountOf["dollar"] as string ?? "XX";
            var centDiscountOf = discountOf["cent"] as string ?? string.Empty;

    %>
    <div class="offer__price offer__is-discount-of">
        <span class="offer__currency">$</span>
        <span class="offer__amt"><%= dollarDiscountOf %></span>
        <span class="offer__follow">
            <% if (!String.IsNullOrEmpty(cent))
                { %>
            <span class="offer__cent"><%= centDiscountOf %></span>
            <% } %>
        </span>
    </div>
    <% } %>
    <div class="offer__price">
        <span class="offer__currency">$</span>
        <span class="offer__amt"><%= dollar %></span>
        <span class="offer__follow">
            <% if (!String.IsNullOrEmpty(cent))
                { %>
            <span class="offer__cent"><%= cent %></span>
            <% } %>
            <% if (!String.IsNullOrEmpty(disclaimer)) { %>
                <span class="offer__disclaimer"><%= disclaimer %></span>
            <% } %>
        </span>
    </div>
    <% if (hasMore == "true") { %>
    <div class="badge badge--save">SAVE <span>50%</span></div>
    <div class="hero__mbg">
      <picture class="mbg">
        <img src="/images/mbg.svg" alt="30 Day Money Back Guarantee">
      </picture>
    </div>
    <a href="#order" id="offer-order-btn" aria-label="Purchase <%= productAttributeName %> products" class="button">Order Now</a>
    <% Html.RenderPartial("GetPaymentIcons"); %>
    <strong class="hero__shipping hero__shipping--alt">FREE SHIPPING! <span>on all orders!</span></strong>
    <% } %>
</div>