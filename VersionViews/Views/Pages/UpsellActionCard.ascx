<%@ Control Language="C#" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>


<%
    var product = Model as Dtm.Framework.Base.Models.CampaignProductView;
    var layoutMode = ViewData["layoutMode"] as string ?? "inline";

    if (product != null)
    {

        var price = string.Format("${0}<sup>{1:00}{2}</sup>", 
            (int)product.Price, (product.Price % (int)product.Price) * 100,
            string.Empty );
        var minQty = product.MinQuantity == 0 ? 1 : product.MinQuantity;

%>
<% if (layoutMode == "inline")
    { %>
<div class="upsell-card__action">

    <% if (product.MaxQuantity > 1) { %>
    <label class="upsell__qty c-brand--form">
        <span>Qty:</span>
        <select name="<%=product.ProductCode %>Qty" id="<%=product.ProductCode %>Qty">
            <option value="1">1</option>
            <% for (int i = 2; i <= product.MaxQuantity; i++) { %>
            <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>
    </label>
    <% } else { %>
    <input type="hidden" name="<%=product.ProductCode %>Qty" id="<%=product.ProductCode %>Qty" value="1">
    <% } %>
</div>

<div class="vse"></div>

<nav class="upsell__nav">
    <button type="button" id="<%=product.ProductCode %>Btn" data-product="<%=product.ProductCode %>" onclick="event.preventDefault();_upsellEngine.AddToCart(this);"  class="upsell__link upsellItem upsell__link--contrast">Add To Cart</button>
</nav>
<% } %>

<% if (layoutMode == "snackbar" && DtmContext.IsMobile)
    { %>
<div class="upsell-card__action-item upsell-snackbar">
    <div class="upsell-snackbar__group">
    <div class="upsell-snackbar__offer upsell-offer">
        <div class="upsell-offer__price c-brand__headline">
            <%= price %>
        </div>
    </div>
    <nav class="upsell-snackbar__actions">
        <button type="button" id="snackbar-<%=product.ProductCode %>Btn" data-product="<%=product.ProductCode %>" onclick="event.preventDefault();_upsellEngine.AddToCart(this);"  class="upsell__link upsellItem upsell__link--contrast">Add To Cart</button>
    </nav>
    </div>
</div>
<% } %>

<%
    }

%>

