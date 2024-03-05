<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var cacheBusterVersion = 1;
    var v = string.Format("?v={0}", cacheBusterVersion);
    var language = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"];
%>

<link rel="preload" href="/fonts/archia-regular-webfont.woff2" as="font" crossorigin="anonymous" type="font/woff2" />

<link rel="preload" href="https://use.typekit.net/erh0tiw.css" as="style">
<link rel="stylesheet" href="https://use.typekit.net/erh0tiw.css">

<link rel="preload" href="/css/Site25/shell.css" as="style">
<link rel="stylesheet" href="/css/Site25/shell.css">
<link href="/Shared/css/jquery-ui.custom.min.css?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>" rel="stylesheet" />

<% if (DtmContext.Page.IsStartPageType) { %>
    <link rel="preload" href="/css/Site25/page.css" as="style">
    <link rel="stylesheet" href="/css/Site25/page.css">  

    <% if (DtmContext.PageCode == "Index") { %>
        <link rel="preload" href="/css/Site25/index.css" as="style">
        <link rel="stylesheet" href="/css/Site25/index.css">
    <% } %>


    <% if (DtmContext.PageCode == "How-To-Use") { %>
        <link rel="preload" href="/css/Site25/how-to-use.css" as="style">
        <link rel="stylesheet" href="/css/Site25/how-to-use.css">
    <% } %>

    <% if (DtmContext.PageCode == "FAQ") { %>
        <link rel="preload" href="/css/Site25/faq.css" as="style">
        <link rel="stylesheet" href="/css/Site25/faq.css">
    <% } %>

    <script defer src="/js/Site25/app.es5.js"></script>

    <script defer src="/js/app.expando.js"></script>
    <script defer src="/js/dtm.js"></script>
    <script defer src="/js/express-checkout.js"></script>
<% } %>

<% if (!DtmContext.Page.IsStartPageType) { %>
    <link rel="preload" href="/css/Site25/dtm.css" as="style"/>
    <link rel="stylesheet" href="/css/Site25/dtm.css" />
<% } %>



<% 
    var lightboxScript = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Script"];
    var lightboxStylesheet = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Stylesheet"];

    if (!string.IsNullOrEmpty(lightboxScript))
    {
        %>
        <script defer src="<%= lightboxScript %>"></script>
        <%
    }

    if (!string.IsNullOrEmpty(lightboxStylesheet))
    {
        %>
        <link rel="stylesheet" href="<%= lightboxStylesheet %>"  media="print" onload="this.media='all'; this.onload=null;"/>
        <%
    }
%>