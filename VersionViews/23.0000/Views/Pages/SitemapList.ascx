<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDT.Navigation" %>

<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var ext = DtmContext.ApplicationExtension;

    var renderSitemap = false;
    var renderSitemapValue = ViewData["renderSitemap"] as string ?? "True";
    Boolean.TryParse(renderSitemapValue, out renderSitemap);
    var labelCategory = ViewData["labelCategory"] as string ?? "Footer";
    var labelId = labelCategory.Replace(" ", "-").ToLower();
    var listClasses = string.Format("list {0}", renderSitemap ? "list--convert-inline-to-grid" : "list--bullet-block");
%>

<div class="section__block">
    <nav aria-label="<%= String.Format("{0} {1}", labelCategory, "Offer information") %>" class="<%= listClasses %>">
        <%
            var sitemap = new Sitemap();
            var entries = sitemap.SitemapList.GetItemsByIdRange(new List<string> { "home", "how-to-use", "customer-reviews", "technology", "faq", "customer-service", "shipping-policy", "return-policy", "privacy-policy", "terms", "sitemap", "order-now" });

            if (!renderSitemap)
            {
                entries = entries.Where(e => e.Id != "sitemap" && e.Id != "order").ToList();
            }

            foreach (var entry in entries)
            {
                var id = string.Format("{0}-{1}", labelId, entry.Id);
                var attributes = string.Format(@"id=""{0}"" href=""{1}""", id, entry.Page);

                if (entry.IsExternal)
                {
                    attributes = string.Format(@"{0} target=""_blank""", attributes);
                }
                %>
                <a <%= attributes %>><%= entry.Name %></a>
                <%
            }
        %>
        <% if (renderSitemap) { %>
        <span class="onetrust-privacy"></span>
        <% } %>
    </nav>
</div>