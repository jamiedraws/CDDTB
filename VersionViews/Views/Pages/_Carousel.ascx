<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>

<%
    var id = ViewData["id"] as string ?? string.Empty;
    var display = ViewData["display"] as string ?? "carousel";
    var contextLabel = ViewData["contextLabel"] as string ?? string.Empty;
    var imageList = ViewData["imageList"] as Dictionary<string, string>[] ?? new Dictionary<string, string>[] { };
    var slideRatio = ViewData["slideRatio"] as string ?? "100/100";
    var slides = ViewData["slides"] as int? ?? 0;

    var hasSlide = slides > 0;
    var hasSlides = slides > 1;
    var isThumbnails = display == "thumbnails";
    var hasThumbnails = isThumbnails && hasSlides;
    var hasImages = imageList.Count() > 0;

    if (!String.IsNullOrEmpty(id) && hasSlides)
    {
        if (hasThumbnails)
        {
            %>
            <nav class="slide__thumbnails" id="<%= id %>-thumbnails">
                <%
                    for (var i = 0; i < slides; i++)
                    {
                        var slideId = String.Format("{0}-{1}", id, i);
                        var attributes = string.Empty;
                        var classes = "slide__thumbnail";

                        if (!String.IsNullOrEmpty(contextLabel))
                        {
                            attributes = String.Format("aria-labelledby='{0}-{1}'", contextLabel, i);
                        }

                        if (i == 0)
                        {
                            classes = String.Format("{0} slide__thumbnail--is-selected", classes);
                        }
                        %>
                        <a href="#<%= slideId %>" class="<%= classes %>" <%= attributes %> data-slide-index="<%= i %>"></a>         
                        <%  
                    }
                %>
            </nav>
            <%
        } 
        else
        {
            %>
            <div id="<%= id %>" class="carousel slide__into frame" tabindex="0">    
            <%
                }

                if (hasImages)
                {
                    var i = 0;

                    foreach (var image in imageList)
                    {
                        var slideId = String.Format("{0}-{1}", id, i);
                        var src = image["src"] ?? string.Empty;
                        var alt = image["alt"] ?? string.Empty;

                        var srcWebp = src.Replace(".png", ".webp").Replace(".jpg", ".webp");

                        %>
                        <picture 
                            id="<%= slideId %>" 
                            class="carousel__item slide__item" 
                            
                            data-src-img="<%= src %>" 
                            data-tag='{ "source" : [{ "srcset" : "<%= srcWebp %>", "type" : "image/webp" }], "img" : [{ "src" : "<%= src %>", "alt" : "<%= alt %>" }] }'
                        >
                            <noscript>
                                <source srcset="<%= srcWebp %>" type="image/webp" />
                                <img src="<%= src %>" alt="<%= alt %>">
                            </noscript>
                        </picture>
                        <%

                        i++;
                    }
            %>
            </div> 
            <%
        }
    }
%>