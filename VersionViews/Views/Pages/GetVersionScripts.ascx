<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
    var isIndex = DtmContext.PageCode == "Index";
    var isFAQ = DtmContext.PageCode == "FAQ";
    var isPaymentPage = DtmContext.PageCode == "PaymentForm";
    var v = String.Format("?v={0}", 2);
%>

<% if (isIndex) { %>
    <script src="https://player.vimeo.com/api/player.js"></script>
    <script defer src="/js/slide/js/slide.js<%= v %>"></script>
    <script defer src="/js/slide/js/components/slide.a11y.js<%= v %>"></script>
    <script defer src="/js/slide/js/components/slide.thumbnails.js<%= v %>"></script>
    <script defer src="/js/index.js<%= v %>"></script>
    <script defer src="/js/carousel.js<%= v %>"></script>
<% } %>

<% if (isFAQ) { %>
    <script defer src="/js/card.js<%= v %>"></script>
<% } %>