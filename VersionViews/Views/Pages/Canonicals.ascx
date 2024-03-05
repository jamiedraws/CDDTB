<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
  var page = DtmContext.PageCode;
  // full url
  string url = HttpContext.Current.Request.Url.AbsoluteUri;
  // just the path
  string path = HttpContext.Current.Request.Url.AbsolutePath;
%>

<%--

#results -> https://www.toppik.com/before-and-afters/
#durable -> https://www.toppik.com/technology

--%>

<% if (page == "Index") { %>
<link rel="canonical" href="https://www.toppik.com/">
<% } else if (page == "How-To-Use") { %>
<link rel="canonical" href="https://www.toppik.com/application/">
<% } else if (page == "FAQ") { %>
<link rel="canonical" href="https://www.toppik.com/faqs">
<% } else if (page == "CustomerService") { %>
<link rel="canonical" href="https://www.toppik.com/customer-service/">
<% } else if (page == "Terms") { %>
<link rel="canonical" href="https://www.toppik.com/terms-of-use/">
<% } else if (page == "ShippingPolicy") { %>
<link rel="canonical" href="https://www.toppik.com/customer-service/">
<% } else if (page == "ReturnPolicy") { %>
<link rel="canonical" href="https://www.toppik.com/customer-service/">
<% } else if (page == "SecurityPolicy") { %>
<link rel="canonical" href="https://www.toppik.com/customer-service/">
<% } else if (page == "Sitemap") { %>
<link rel="canonical" href="<%= url %>">
<% } else { %>
<link rel="canonical" href="<%= DtmContext.Domain.FullDomain %>">
<% } %>

