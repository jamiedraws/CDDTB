<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var cacheBusterVersion = 15;
    var v = string.Format("?v={0}", cacheBusterVersion);
    var language = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"];
%>

<link rel="preload" href="/fonts/archia-regular-webfont.woff2" as="font" crossorigin="anonymous" type="font/woff2" />

<link rel="preload" href="https://use.typekit.net/erh0tiw.css" as="style">
<link rel="stylesheet" href="https://use.typekit.net/erh0tiw.css">

<link rel="preload" href="/css/16.0000/shell.css<%= v %>" as="style">
<link rel="stylesheet" href="/css/16.0000/shell.css<%= v %>">
<link href="/Shared/css/jquery-ui.custom.min.css?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>" rel="stylesheet" />

<% if (DtmContext.Page.IsStartPageType) { %>
    <link rel="preload" href="/css/16.0000/page.css<%= v %>" as="style">
    <link rel="stylesheet" href="/css/16.0000/page.css<%= v %>">  

    <% if (DtmContext.PageCode == "Index") { %>
        <link rel="preload" href="/css/16.0000/index.css<%= v %>" as="style">
        <link rel="stylesheet" href="/css/16.0000/index.css<%= v %>">
    <% } %>


    <% if (DtmContext.PageCode == "How-To-Use") { %>
        <link rel="preload" href="/css/16.0000/how-to-use.css<%= v %>" as="style">
        <link rel="stylesheet" href="/css/16.0000/how-to-use.css<%= v %>">
    <% } %>

    <% if (DtmContext.PageCode == "FAQ") { %>
        <link rel="preload" href="/css/16.0000/faq.css<%= v %>" as="style">
        <link rel="stylesheet" href="/css/16.0000/faq.css<%= v %>">
    <% } %>

    <script defer src="/js/16.0000/app.js<%= v %>"></script>

    <script defer src="/js/app.expando.js<%= v %>"></script>
    <script defer src="/js/dtm.js<%= v %>"></script>
    <script defer src="/js/express-checkout.js<%= v %>"></script>
<% } %>

<% if (!DtmContext.Page.IsStartPageType) { %>
    <link rel="preload" href="/css/16.0000/dtm.css<%= v %>" as="style"/>
    <link rel="stylesheet" href="/css/16.0000/dtm.css<%= v %>" />
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