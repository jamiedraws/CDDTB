<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<% var language = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"]; %>

<script src="/shared/js/jquery.min.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>"></script>
<script src="/shared/js/select2.min.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>"></script>
<link rel="stylesheet" href="/shared/css/select2.css">
<script src="/js/common.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>&language=<%=language %>&cb=1"></script>
<% Html.RenderPartial("FrameworkJs", Model); %>
