<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
    var version = DtmContext.Version;
    var isIndex = DtmContext.PageCode == "Index";
    var isMobile = DtmContext.IsMobile;
    var isDesktop = !isMobile;
    var isStartPage = DtmContext.Page.IsStartPageType && DtmContext.PageCode != "PaymentForm";
    var isPaymentPage = DtmContext.PageCode == "PaymentForm" || DtmContext.PageCode == "ProcessPayment";
    var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    var productName = productAttributeName;

    var hashReviews = "#results";
    var hashTech = "#durable";
    var hashHow = "#how-to-use";

		var linkIndex = "Index" + Model.Extension;
    var linkHow = isIndex ? hashHow : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashHow);
    var linkReviews = isIndex ? hashReviews : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashReviews);
    var linkTech = isIndex ? hashTech : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashTech);
    var linkOrder = "#order";

    if (!isStartPage) {
        linkIndex = "#";
    }

    var displayBanner = false;

    var logoPath = "/images/logo.svg";
    var altHeader = DtmContext.Version == 3;

    var altClasses = "theme";
    if (altHeader) {
      logoPath = "/images/logo-white.svg";
      altClasses = "header--alt nav nav--alt";
    }
    var logo = String.Format(@"<a href='{0}' id='header-logo' class='header__logo logo__picture' aria-label='{1}'>

          <img src='{2}' alt='{1}'>

      </a>", linkIndex, productAttributeName, logoPath);

    var headerTitle = String.Format(@"#1 Instant Solution for thinning hair <span class='title--sub'>Everything you need to transform fine, thinning hair in seconds.</span>
    ", productAttributeName);
    var headerClasses = "header__group";

    if (!isStartPage)
    {
        headerTitle = string.Empty;
        headerClasses = String.Format("{0} header__center", headerClasses);
    }
%>

<header aria-labelledby="header-title" class="view header <%= altClasses %> section">
  <div class="view__in section__in">
    <div class="<%= headerClasses %>">
      <%= logo %>
      <div class="header__tagline">Full Hair Instantly</div>
      <% if (altHeader) {
       Html.RenderPartial("Nav", Model, new ViewDataDictionary {
            { "altHeader", "alt" }
        });
      } else { %>
      <h1 id="header-title" class="header__title title"><%= headerTitle %></h1>
      <% } %>
    </div>
  </div>
</header>

<% if (!altHeader) {
 Html.RenderPartial("Nav", Model);
} %>