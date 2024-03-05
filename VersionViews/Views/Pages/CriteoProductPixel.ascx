<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    //edited mainItemid to use the productId in catalog sheet
    string itemId = "11817903";
    string price = (string)ViewData["price"];
    string midCsv = (string)ViewData["midCsv"];
    string accountId = (string)ViewData["accountId"] ?? "24869";
    string sendItemId = (string)ViewData["sendItemId"] ?? "true";
    string preConversion = (string)ViewData["isPreConversion"] ?? "false";
    string showViewItemOnly = (string)ViewData["showViewItemOnly"] ?? "false";

    bool passItem = true;
    bool isPreConversion = false;
    bool treatAsUpsell = false;

    Boolean.TryParse(sendItemId, out passItem);
    Boolean.TryParse(preConversion, out isPreConversion);
    Boolean.TryParse(showViewItemOnly, out treatAsUpsell);

    if (String.IsNullOrWhiteSpace(itemId))
    {
        new SiteExceptionHandler("Pixel is missing Item ID parameter");
        return;
    }
    if (String.IsNullOrWhiteSpace(price))
    {
        new SiteExceptionHandler("Pixel is missing Price parameter");
        return;
    }
    if (String.IsNullOrWhiteSpace(midCsv))
    {
        new SiteExceptionHandler("Pixel is missing MID parameter");
        return;
    }

    if (String.IsNullOrWhiteSpace(accountId))
    {
        new SiteExceptionHandler("Pixel is missing Account ID parameter");
        return;
    }

    var isUpsell = DtmContext.Page.PageType.ToUpper() == "UPSELL" || treatAsUpsell;

    var conversionOrderStatus = new[] { 2, 3 };
    var fireLanding = DtmContext.Page.IsStartPageType && !treatAsUpsell;
    var fireConversion = !DtmContext.Page.IsStartPageType
        && DtmContext.PageCode.ToUpper().Contains("CONFIRMATION")
        && conversionOrderStatus.Contains(DtmContext.Order.OrderStatusId);
    if (fireConversion)
    {
        const string conversionLabel = "CriteoConversion";
        var vsRepo = new Dtm.Framework.Models.Ecommerce.Repositories.VisitorSessionRepository();
        var conversionValue = vsRepo.GetVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel);
        const string coversionExpectedValue = "1";
        var hasAlreadyConverted = conversionValue == coversionExpectedValue;
        if (hasAlreadyConverted)
        {
            fireConversion = false;
        }
        else
        {
            vsRepo.SaveVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel, coversionExpectedValue);
        }
    }



    if (isPreConversion) {
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewBasket", item: [{ id: "<%= itemId %>", price: "<%= DtmContext.Order.OrderTotal %>", quantity: 1 }] }

    );
</script>
<!-- End Impression -->


<%}
    else if (fireLanding)
    {
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
    { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewHome" }

        <%if (passItem)
    {%>,
        { event: "viewItem", item: "<%= itemId %>" }
        <%}%>

    );
</script>
<!-- End Impression -->
<%
    }
    else if (isUpsell)
    { %>
       <!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewItem", item: "<%= itemId %>" }

    );
</script>
<!-- End Impression -->
   <% }
    else if (fireConversion)
    {
%>
<!-- Begin Conversion -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
    { event: "setAccount", account: <%= accountId %> },
    { event: "setSiteType", type: deviceType },
    {
        event: "trackTransaction", id: "<%= DtmContext.Order.OrderID%>",
        item: [
           <%foreach (var item in DtmContext.Order.OrderItems.Where(x => x.CachedProductInfo.PropertyIndexer["CriteoId"] != null).ToList())
    {
        if (item.CachedProductInfo.PropertyIndexer["CriteoId"] != null)
        {
        %>
            { id: "<%= item.CachedProductInfo.PropertyIndexer["CriteoId"] %>", price: "<%=item.Price %>", quantity: <%=item.Quantity%> }
            <%
    if(item != DtmContext.Order.OrderItems.Where(x => x.CachedProductInfo.PropertyIndexer["CriteoId"] != null).ToList().Last())
    {%>
            ,
   <% }
    %>
        <%}
    }%>

    
        ]
    }
);
</script>
<!-- End Conversion -->
<%
    }%>
