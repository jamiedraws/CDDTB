<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
  var EnableOrderForm = SettingsManager.ContextSettings["Order.EnableOrderform", true];
  var ShowMobileOrderForm = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.ShowOrderFormOnMobile", false];
  var renderOfferDetailsAboveAcceptOffer = SettingsManager.ContextSettings["Order.RenderOfferDetailsAboveAcceptOffer", false];
  var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    var productName = productAttributeName.Replace("&trade;", "<sup>&trade;</sup>");
    var productNameNoLegal = productAttributeName.Replace("&trade;", "");
  var isDesktop = !DtmContext.IsMobile;
  var showInstafeed = DtmContext.Version >= 12 && DtmContext.Page.IsStartPageType;
%>


<%= Html.Partial("Instafeed") %>

<section aria-label="Order <%= productAttributeName %>" class="view defer section">
  <div id="order" class="view__anchor"></div>
  <div class="view advertise theme theme--contrast">
    <div class="advertise__in view__in">
            <%
                var callToOrderGroup = new Dictionary<string, string>()
                {
                    { "www.BuyKenmore.com", "1-800-592-5122" },
                    { "www.GetKenmore.com", "1-800-592-7064" }
                };

                var callToOrderLink = string.Empty;

                foreach (var callToOrder in callToOrderGroup)
                {
                    if (String.Equals(callToOrder.Key, DtmContext.Domain.Domain, StringComparison.InvariantCultureIgnoreCase))
                    {
                        callToOrderLink = String.Format(" Or Call <a id=\"form-title-call-to-order\" href=\"tel:{0}\">{0}</a>", callToOrder.Value);
                    }
                }

                var formTitle = String.Format("Fill out the form below{1} to order your <strong>{0}</strong> now.", productName, callToOrderLink);
            %>
      <div class="advertise__group">
        <span class="advertise__title">THIS OFFER IS NOT AVAILABLE IN STORES</span>
        <span class="advertise__description"><%= formTitle %></span>
      </div>
    </div>
    </div>

  <% if ( EnableOrderForm ) { %>

    <div class="view form load-item">
        <div class="view__in form__in dtm__in dtm__in--mv">
            <div id="vse-error" class="view__anchor"></div>
            <%-- // Displays the order form --%>
            <% Html.RenderPartial("OrderForm", Model); %>
        </div>

        <noscript>
          <style>
            .form::after {
              display: none;
            }

            .form .load-item__progress {
              visibility: visible;
              opacity: 1;
            }
          </style>
        </noscript>
    </div>

  <% } %>

</section>