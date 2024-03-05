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

    // all variables for tweaking the header / nav design for v3 (alternative header)
    var altHeader = (String)ViewData["altHeader"] ?? "default";
    var altClasses = "";
    var navOrderClasses = "";
    var navClass = "nav";
    if (altHeader == "alt") {
      logoPath = "/images/logo-white.svg";
      navOrderClasses = "button button--header";
      navClass = "no-margin";
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

    var showPromo = DtmContext.Version == 2 || DtmContext.Version == 6;

    bool showFilledPromo = false;

%>

<nav id="nav" aria-label="Website pages links" class="view <%= navClass %>">
  <% logo = logo.Replace("header__logo", "nav__logo").Replace("header-logo", "nav-logo"); %>
  <%= logo %>
    <div class="header__tagline nav__tagline">FULL HAIR INSTANTLY</div>
  <% if (isStartPage)
      { %>
  <input class="nav__toggle" type="checkbox" id="nav__toggle" aria-label="Toggle Menu">
  <label class="nav__label" for="nav__toggle" aria-label="Toggle Menu">
    <span></span>
  </label>
  <div class="nav__underlay" role="presentation" aria-label="Hide Menu"></div>
  <% }
    else
    { %>
    <h1 class="nav__title title"><%= headerTitle %></h1>
    <% } %>
  <% if (isStartPage) { %>
  <div class="nav__pane">
    <div class="nav__group view__in">
      <% if (displayBanner)
        { %>
      <div class="nav__promo">
        <%= Html.Partial("Offer", new ViewDataDictionary {
              { "dollar", "24" },
              { "cent", "95<span class='offer__asterisk'>&dagger;</span>" }
          }) %>
      </div>
      <% } %>
      <div class="nav__list">
        <% logo = logo.Replace("nav-logo", "nav-list-logo"); %>
        <%= logo %>
        <h1 class="nav__title title">
          <%= headerTitle %>
        </h1>
        <% if (altHeader != "alt") { %>
        <a class="nav__link" href="<%= linkIndex %>" id="nav-home" aria-label="Home">
          <span>Home</span>
        </a>
        <% } %>
        <a class="nav__link" href="How-To-Use<%= Model.Extension %>" id="nav-how" aria-label="How To Use">
          <span>How To Use</span>
        </a>
        <a class="nav__link" href="<%= linkReviews %>" id="nav-results" aria-label="Real Results">
          <span>Real Results</span>
        </a>
        <a class="nav__link" href="<%= linkTech %>" id="nav-how" aria-label="Technology">
          <span>Technology</span>
        </a>
        <a class="nav__link nav__order" href="<%= linkOrder %>" id="nav-order" aria-label="Order Now">
          <span class="<%= navOrderClasses %>">Order Now</span>
        </a>
        <% if (altHeader != "alt") { %>
        <div class="nav__deal">
            <%= Html.Partial("Offer", new ViewDataDictionary {
              { "dollar", "24" },
              { "cent", "95<span class='offer__asterisk'>&dagger;</span>" }
          }) %>
        <% } %>
        </div>
      </div>
    </div>
  </div>
    <% if (showPromo) { %>
        <%= Html.Partial("Promo-Banner", new ViewDataDictionary {
            { "showFilledPromo", showFilledPromo }
        }) %>
    <% } %>
  <% } %>
</nav>