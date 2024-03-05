<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%@ Import Namespace="Dtm.Framework.Models.Ecommerce" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Enums" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.IO" %>

<%
	// Directory
	var dir = "/shared/customers/" + DtmContext.CustomerId + "/images/store/";
	var ns = (String)ViewData["LayoutNamespace"] ?? DtmContext.CampaignCode;
	if ( !String.IsNullOrEmpty(ns) ) {
		dir = dir + ns.ToLower();
	}

  

// Redirect Url & Banner Image
	var redirectUrl = SettingsManager.ContextSettings["ConfirmationBanner.Url", String.Empty];
	var getDesktopImage = SettingsManager.ContextSettings["ConfirmationBanner.ImagePath", dir + "/banner-top.png"];
	var getMobileImage = SettingsManager.ContextSettings["ConfirmationBanner.MobileImagePath", dir + "/banner-top-sm.png"];
	var getBannerImage = DtmContext.IsMobile ? getMobileImage : getDesktopImage;

	// Attributes
	String title = SettingsManager.ContextSettings["ConfirmationBanner.LinkTitle", "Check out our store for other exclusive products"];
	String alt = SettingsManager.ContextSettings["ConfirmationBanner.ImageAlt", "Visit our store for other items you might like"];
%>

<% if ( !String.IsNullOrEmpty(getBannerImage) ) { %>

	<% if ( File.Exists(Server.MapPath(getBannerImage)) ) { %>

		<% switch ( !String.IsNullOrEmpty(redirectUrl) ) { %>

			<% case true: %>
				<a class="block center-text" href="<%= redirectUrl %>" target="_blank" title="<%= title %>">
					<img class="responsive-img" src="<%= getBannerImage %>?v=<%= DtmContext.ApplicationVersion %>" alt="<%= alt %>">
				</a>
				<% break; %>

			<% default: %>
				<img class="responsive-img" src="<%= getBannerImage %>?v=<%= DtmContext.ApplicationVersion %>" alt="<%= alt %>">
				<% break; %>

		<% } %>

	<% } %>
	
<% } %>



<%

	// Redirect Url & Banner Image
	var redirectUrlSecondary = SettingsManager.ContextSettings["ConfirmationBanner.SecondaryBannerUrl", 
		SettingsManager.ContextSettings["ConfirmationBanner.Url", String.Empty]];
	var getDesktopImageSecondary = SettingsManager.ContextSettings["ConfirmationBanner.SecondaryImagePath", dir + "/banner-bottom.png"];
	var getMobileImageSecondary = SettingsManager.ContextSettings["ConfirmationBanner.SecondaryMobileImagePath", dir + "/banner-bottom-sm.png"];
	var getBannerImageSecondary = DtmContext.IsMobile ? getMobileImageSecondary : getDesktopImageSecondary;

	// Attributes
	String titleSecondary = SettingsManager.ContextSettings["ConfirmationBanner.LinkTitle", "Check out our store for other exclusive products"];
	String altSecondary = SettingsManager.ContextSettings["ConfirmationBanner.ImageAlt", "Visit our store for other items you might like"];
%>


<% if ( !String.IsNullOrEmpty(getBannerImageSecondary) ) { %>

	<% if ( File.Exists(Server.MapPath(getBannerImageSecondary)) ) { %>

		<% switch ( !String.IsNullOrEmpty(redirectUrlSecondary) ) { %>

			<% case true: %>
				<a class="block center-text" href="<%= redirectUrlSecondary %>" target="_blank" title="<%= titleSecondary %>">
					<img class="responsive-img top-padding" src="<%= getBannerImageSecondary %>?v=<%= DtmContext.ApplicationVersion %>" alt="<%= altSecondary %>">
				</a>
				<% break; %>

			<% default: %>
				<img class="responsive-img top-padding" src="<%= getBannerImageSecondary %>?v=<%= DtmContext.ApplicationVersion %>" alt="<%= altSecondary %>">
				<% break; %>

		<% } %>

	<% } %>
	
<% } %>