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
        <script type="text/javascript" src="/shared/js/common.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>&language=<%=Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"] %>&cb=1"></script>
		
        <% Html.RenderSnippet("ORDERFORMSCRIPT"); %>
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