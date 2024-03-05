<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDT.Navigation" %>

<%
    var isStartPage = DtmContext.Page.IsStartPageType;

    var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    var productName = productAttributeName;

    var sitemap = new Sitemap();
    var sitemapList = sitemap.SitemapList;
    var homeLink = sitemapList.GetItemById("home");

    var logoLink = isStartPage ? homeLink.Page : "#main";
    var logoTemplate = @"<a href=""{0}"" class=""logo-text__group"">
        <svg class=""logo-text__logo"" aria-label=""Toppik""><use href=""#logo"" /></svg>
        <span class=""logo-text__text"">Conceals. Enhances. Perfects.</span>
    </a>";
    var logo = string.Format(logoTemplate, logoLink);
%>

<svg class="svg-symbols">
	<symbol id="logo" viewBox="0 0 232.6 124.6">
		<polygon points="221.7,96.5 220.9,96.5 220.9,90 218.4,90 218.4,89.3 224.1,89.3 224.1,90 221.7,90 "/>
		<polygon points="231.8,89.3 229.1,93.2 226.5,89.3 225.6,89.3 225.6,96.5 226.4,96.5 226.4,90.7 229.1,94.5 229.1,94.5 231.8,90.7 
			231.8,96.5 232.6,96.5 232.6,89.3 "/>
		<path d="M163,25.9c0.2-6.4,4.1-19.2,11.4-25.9l0.4,0.4c-6.2,8.9-6.8,17.3-7.1,25.5H163z"/>
		<path d="M35.6,31.7c0,3.1,0,10.2,0,10.2h-1.4c0,0,0-4.9-0.8-6c-0.8-1.1-2-1.8-3.4-2c-3-0.4-6.1-0.6-9.2-0.5v62l4.4,0.1V97H10.5v-1.5
			l4.5-0.1v-62c-2.6,0-7.5-0.2-9.4,0.4c-1.1,0.2-2,0.8-2.6,1.7c-1.3,1.4-1.5,6.5-1.5,6.5H0V31.7H35.6"/>
		<path d="M168.9,31.1v64.2l4.4,0.1v1.5h-14.6v-1.4l4.3-0.2V33.2h-3.8v-1.5C159.1,31.7,165.8,31.8,168.9,31.1"/>
		<path d="M53.6,30.5c15.7,0,19.1,25.4,19.1,34.6c0,7.9-2.9,33.2-19.5,33S33.7,71.6,33.7,63.7C33.7,54.3,37.5,30.5,53.6,30.5
				M53.4,32.3c-4.4,0-8.1,3.4-10,7.7c-3.2,7.5-3.2,16.2-3.3,24.1c-0.1,5.1,1.1,16.4,2.2,20.7c2.2,8.6,5.7,11.6,11.3,11.7
			c6.9,0.1,9.5-7.4,10.7-13.3c1.3-6.2,1.9-12.6,1.8-19c-0.2-8.6-0.3-15.5-3.1-24C61.5,35.7,58.1,32.3,53.4,32.3"/>
		<path d="M96.5,30.5c2,0,4,0.5,5.7,1.4c2,1.2,3.7,2.8,5,4.8c5.5,8.1,7.3,19.5,6.8,29.1c-0.6,10-2.4,20.6-9.6,28.5
			c-2.6,2.9-6.6,4.3-10.4,3.4c-5.6-1.4-7.8-7.7-9-13.2c0-0.1-0.2,0.1-0.2,0c0.1,1.4,0.3,2.9,0.2,4.6c-0.1,7.5,0.2,33.8,0.2,33.8
			l4.2,0.3v1.4H75.1v-1.4l4.3-0.2V33.2h-4.1v-1.5c2.8,0,6.7,0.1,9.5-0.6c0.1,2.7,0,8.9-0.4,13.4c0,0,0.2,0,0.2,0.2
			C86,37.3,89.6,30.7,96.5,30.5 M96.3,32.4c-4.7,0.1-7.5,5-8.6,8.1c-3.8,10.8-3.8,24.5-2.4,36.9c0.5,4.7,1.9,9.3,4,13.6
			c2.9,5.9,8.1,6,11,3.6c3.7-3,5.6-9.9,6.7-16.7c0.7-6.3,1-12.5,1-18.8c-0.3-7.4-1-13.9-3.4-20.6C103.4,34.9,100.1,32.4,96.3,32.4"/>
		<path d="M138.2,30.5c2,0,4,0.5,5.7,1.4c2,1.2,3.7,2.8,5,4.8c5.5,8.1,7.3,19.5,6.8,29.1c-0.6,10-2.4,20.6-9.6,28.5
			c-2.6,2.9-6.6,4.3-10.4,3.4c-5.6-1.4-7.8-7.7-9-13.2c0-0.1-0.2,0.1-0.2,0c0.1,1.4,0.3,2.9,0.3,4.6c-0.1,7.5,0.2,33.8,0.2,33.8
			l4.2,0.3v1.4h-14.3v-1.4l4.2-0.2V33.2h-4v-1.5c2.8,0,6.7,0.1,9.5-0.6c0.1,2.7,0,8.9-0.4,13.4c0,0,0.2,0,0.2,0.2
			C127.7,37.3,131.4,30.7,138.2,30.5 M138,32.4c-4.7,0.1-7.5,5-8.6,8.1c-3.8,10.8-3.8,24.5-2.4,36.9c0.5,4.7,1.9,9.3,4,13.5
			c2.9,5.9,8.1,6,11,3.6c3.7-3,5.6-9.9,6.7-16.7c0.6-6.3,1-12.5,0.9-18.8c-0.4-7.4-1-13.9-3.4-20.6C145.1,34.9,141.8,32.4,138,32.4"/>
		<path d="M178.1,97v-1.5l4.5-0.2v-62l-4.5-0.2v-1.5h14.7v1.5l-4.5,0.2v28.4c0,0-0.1,2.9-0.2,3.4l0.3,0.2c0,0,1-2,1.4-2.8
			s13.5-24.8,13.9-25.8c0.3-1,0.2-2-0.3-2.9c-0.6-0.6-3.7-0.7-3.9-0.7v-1.5h12.9v1.5c-0.9,0-1.7,0-2.6,0.1c-1,0.3-1.9,0.9-2.4,1.8
			c-0.6,1-10.8,19.4-11,19.6l-0.4,0.4c0.1,0.1,0.1,0.3,0.2,0.4c0.1,0.2,15.2,39.8,15.2,39.8l4.1,0.2V97h-15.3v-1.5l4.5-0.2L193,63.8
			c-0.2-0.5-0.3-0.9-0.4-1.4l-0.2-0.2l-0.2,0.6c-0.1,0.4-4,7.1-4,7.1v25.3l4.7,0.3V97H178.1z"/>
	</symbol>
</svg>

<%
    var navClassList = "nav";
    
    if (!DtmContext.Page.IsStartPageType)
    {
        navClassList = string.Format("{0} nav--is-end-page", navClassList);
    }
%>

<header id="nav" class="view <%= navClassList %> section @print-only-hide">
    <span class="skip-link">
        <a href="#main" class="skip-link__button" id="skip-link"><span>Skip To Main Content?</span></a>
    </span>
    <% if (isStartPage) { %>
    <div class="promo-banner">
        <div class="view__in section__in">
            <div class="promo-banner__text">
                Buy More, Save More is here! 
                <button type="button" data-modal-dialog-id="promo-disclaimer-container" data-modal-dialog-actor="open" class="promo-banner__link" aria-haspopup="true">See details</button>
            </div>
        </div>
    </div>
    <% } %>
    <div class="view__in nav__group nav__in section__in">
        <div class="nav__logo logo-text">
            <%= logo %>
        </div>
        <% if (isStartPage) { %>
        <button type="button" class="nav__label" aria-label="Toggle Menu">
            <span></span>
        </button>
        <div class="nav__underlay nav__underlay--for-drawer" role="presentation"></div>
        <nav aria-label="Website page links" class="nav__pane">
            <div class="nav__group">
                <div class="nav__list nav__tier-first">
                    <div class="nav__logo logo-text logo-text--stack">
                        <%= logo.Replace("navbar-logo", "navbar-header-logo") %>
                    </div>
                    <%
                        var navLinks = sitemapList.GetItemsByIdRange(new List<string> { 
                            "home", 
                            "how-to-use", 
                            "customer-reviews",
                            "technology",
                            "order-now"
                        });

                        foreach (var navLink in navLinks)
                        {
                            %>
                            <a class="nav__link" href="<%= navLink.Page %>" id="nav-<%= navLink.Id %>">
                                <span><%= navLink.Name %></span>
                            </a>
                            <%
                        }
                    %>
                </div>
            </div>
        </nav>
        <% } %>
    </div>
</header>

<template data-modal-dialog-template>
    <section id="promo-disclaimer-container" aria-labelledby="promo-disclaimer-title" data-modal-dialog-title="Disclaimer for free spray Promotion" data-modal-dialog-container class="view content section">
        <div id="promo-disclaimer" class="view__anchor"></div>
        <div class="view__in content__text section__in">
            <h2 id="promo-disclaimer-title" class="content__title">OFFER DETAILS</h2>
            <p>*Offer valid through May 30, 2023 (11:59pm EST) while supplies last. Spend $20 and use code MAY10 to save 10%, spend $40 and use code MAY15 to save 15%, spend $60 and use code MAY20 to save 20% on your order. Valid on first payment of subscriptions, standard pricing resumes on second shipment. Cannot be combined with other offers. Free shipping. Can be redeemed at GetToppik.com. Offer not valid where other Toppik products are sold.</p>
        </div>
    </section>
</template>