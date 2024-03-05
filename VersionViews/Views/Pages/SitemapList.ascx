<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var ext = DtmContext.ApplicationExtension;

    var renderFooter = false;
    var renderFooterValue = ViewData["renderFooter"] as string ?? "True";
    Boolean.TryParse(renderFooterValue, out renderFooter);
    var labelCategory = ViewData["labelCategory"] as string ?? "Footer";
    var id = labelCategory.Replace(" ", "-").ToLower();

    var isIndex = DtmContext.PageCode == "Index";

    var hashIndex = "#main";
    var hashReviews = "#results";
    var hashTech = "#durable";
    var hashHow = "#how-to-use";

    var linkIndex = isIndex ? hashIndex : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashIndex);
    var linkHow = isIndex ? hashHow : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashHow);
    var linkReviews = isIndex ? hashReviews : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashReviews);
    var linkTech = isIndex ? hashTech : String.Format("Index{0}{1}", DtmContext.ApplicationExtension, hashTech);
    var linkOrder = "#order";
%>

<nav aria-label="<%= String.Format("{0} {1}", labelCategory, "Offer information") %>">
    <ul class="list <% if (!renderFooter) { %>list--stack<% } %>">
        <li>
            <a id="<%= id %>-home" href="Index<%= ext %>">Home</a>
        </li>
        <li>
            <a id="<%= id %>-how" href="How-To-Use<%= Model.Extension %>" aria-label="How To Use" title="How To Use">How To Use</a>
        </li>
        <li>
            <a id="<%= id %>-results" href="<%= linkReviews %>" aria-label="Real Results" title="Real Results">Real Results</a>
        </li>
        <li>
            <a id="<%= id %>-tech" href="<%= linkTech %>" aria-label="Technology" title="Technology">Technology</a>
        </li>
        <li>
            <a id="<%= id %>-faq" href="FAQ<%= ext %>" aria-label="Frequently Asked Questions" title="Frequently Asked Questions">FAQS</a>
        </li>
        <li>
            <a id="<%= id %>-customer-service" href="Customer-Service<%= ext %>">Customer Service</a>
        </li>
        <li>
            <a id="<%= id %>-shipping-policy" href="Shipping-Policy<%= ext %>">Shipping Policy</a>
        </li>
        <li>
            <a id="<%= id %>-return-policy" href="Return-Policy<%= ext %>">Return Policy</a>
        </li>
        <!-- <li>
            <a id="<%= id %>-security-policy" href="Security-Policy<%= ext %>">Security Policy</a>
        </li> -->
        <li>
            <a id="<%= id %>-privacy-policy" href="https://churchdwight.com/privacy-policy.aspx" target="_blank">Privacy Policy</a>
        </li>
        <li>
            <a id="<%= id %>-terms" href="Terms<%= ext %>">Terms & Conditions</a>
        </li>
        <% if (renderFooter)
         { %>
        <li>
            <a id="<%= id %>-sitemap" href="Sitemap<%= ext %>" aria-label="View all pages" title="View all pages">Site Map</a>
        </li>
        <li>
            <a id="<%= id %>-order" href="#order" aria-label="Order the <%= productName %>">Order Now</a>
        </li>
        <% } %>
    </ul>
</nav>