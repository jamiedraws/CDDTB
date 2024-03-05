<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var isIndex = DtmContext.PageCode == "Index";
    var isPaymentPage = DtmContext.PageCode == "PaymentForm" || DtmContext.PageCode == "ProcessPayment";
    var isFrontPage = DtmContext.Page.IsStartPageType && !isPaymentPage;
    var isUpsell = DtmContext.Page.PageType.Equals("Upsell", StringComparison.InvariantCultureIgnoreCase);
    var v = String.Format("?v={0}", 0);

    var productName = SettingsManager.ContextSettings["Label.ProductName", string.Empty];
%>

<!-- footer -->
<footer aria-label="Copyrights and policies" class="view l-footer footer section theme theme--contrast">
    <div class="view__in section__in footer__group">

        <% if (isFrontPage)
            {
                Html.RenderPartial("SitemapList");
            }
        %>
        <address class="footer__copyright">
            <% Html.RenderSnippet("COMMON-FOOTER"); %>
        </address>

    </div>

    <%
        if (isFrontPage)
        {
            Html.RenderPartial("Scripts");
            Html.RenderSnippet("ORDERFORMSCRIPT");

            %>
            <script>
                addEventListener("ECDrawFormComplete", function () {
                    if ("_dtm" in window) {
                        _dtm.expressCheckout({
                            addPayPalButton: false
                        });
                    }
                });
            </script>
            <%

            if(DtmContext.IsMobile)
            {
                %>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        $("[data-code]").on("click", function () {
                            $.scrollTo($("#reviewOrder"), { top: _dtmShoppingCart.scrollToTopPosition });
                        });
                    });
                </script>
    <%
            }

        }

    %>

    <div class="l-controls top-absolute">
        <% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
        <% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
        <% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
    </div>
</footer>
