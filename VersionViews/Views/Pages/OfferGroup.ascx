<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var version = DtmContext.Version;
    var modifier = ViewData["modifier"] as string ?? string.Empty;
    var id = ViewData["id"] as string ?? string.Empty;
    var standfirst = ViewData["standfirst"] as string ?? string.Empty;
    var paymentInstallment = ViewData["paymentInstallment"] as int? ?? 1;
    var excludeList = ViewData["exclude"] as List<string> ?? new List<string>();

    var productCodeMulti = "TBLKS";

    // exclude components from rendering
    var excludeBanner = excludeList.Any(el => el.Equals("banner"));

    var excludeOfferMulti = excludeList.Any(el => el.Equals("offerMulti"));
    var excludeOrderMulti = excludeList.Any(el => el.Equals("orderMulti"));
    var excludeDiscountOfMulti = excludeList.Any(el => el.Equals("discountOfMulti"));

    var excludeOfferSingle = excludeList.Any(el => el.Equals("offerSingle"));
    var excludeOrderSingle = excludeList.Any(el => el.Equals("orderSingle"));
    var excludeDiscountOfSingle = excludeList.Any(el => el.Equals("discountOfSingle"));

    var multiPaymentInstallment = 4;

    var offerMulti = new ViewDataDictionary
    {
        { "productCode", productCodeMulti },
        { "id", id },
        { "excludeDiscountOf", excludeDiscountOfMulti },
        { "standfirst", String.Format("{0} interest-free payments of", multiPaymentInstallment) },
        { "paymentInstallment", multiPaymentInstallment }
    };
%>

<div class="deal <%= modifier %>">
    <div class="deal__group">
        <% if (!excludeOfferMulti) { %>
        <div class="deal__item">
            <div class="deal__offer">
                <%= Html.Partial("OfferSingle", offerMulti) %>
            </div>
        </div>
        <% } %>
    </div>
</div>