<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
    var modifier = ViewData["modifier"] as string ?? "product__list";
    bool? applyButtons = ViewData["applyButtons"] as bool? ?? false;
    bool? applyId = ViewData["applyId"] as bool? ?? true;
    bool? applyPictures = ViewData["applyPictures"] as bool? ?? false;
    bool? applyDetails = ViewData["applyDetails"] as bool? ?? false;

    bool useButtons = applyButtons.HasValue ? applyButtons.Value : false;
    bool useId = applyId.HasValue ? applyId.Value : false;
    bool usePictures = applyPictures.HasValue ? applyPictures.Value : false;
    bool useDetails = applyDetails.HasValue ? applyDetails.Value : false;

    Tuple<string, string>[] features =
    {
        new Tuple<string, string>(
            "Extended Face Technology",
            "The face has been expanded vertically by 7mm compared to the previous generation of Tight Lies, resulting in a 14% larger face area. This is designed to provide golfers with a larger hitting zone, a wider sweet spot and improved forgiveness."
        ),
        new Tuple<string, string>(
            "Tri-Sole Design",
            "Paying homage to the iconic upside-down head shape of the original Tight Lies fairway wood, the Tri-Sole Design delivers versatility from any lie. When hitting from a compact fairway or the high rough, the sole delivers improved turf interaction by minimizing the sole area that contacts the ground."
        ),
        new Tuple<string, string>(
            "Velocity Slot",
            "A slot on the sole of the club allows the face to flex and rebound efficiently. This results in fast ball speeds and improved launch on off-center strikes."
        ),
        new Tuple<string, string>(
            "Components",
            "Tight Lies Fairway is equipped with the Aldila Synergy shaft, Golf Pride Tour Velvet grips and bonus head cover."
        )
    };

    if (features != null && features.Any())
    {

        var imageList = new[] {
            new Dictionary<string, string>
            {
                { "src", "/images/use-1.jpg" },
                { "alt", "Extended Face Technology" }
            },
            new Dictionary<string, string>
            {
                { "src", "/images/use-2.jpg" },
                { "alt", "Tri-Sole Design" }
            },
            new Dictionary<string, string>
            {
                { "src", "/images/use-3.jpg" },
                { "alt", "Velocity Slot" }
            },
            new Dictionary<string, string>
            {
                { "src", "/images/use-4.jpg" },
                { "alt", "Components" }
            }
        };

        var carousel = new ViewDataDictionary {
            { "id", "perks" },
            { "slides", imageList.Count() }
        };

        if (useButtons)
        {
            carousel.Add("display", "thumbnails");
            carousel.Add("contextLabel", "feature");
        } else if (usePictures)
        {
            carousel.Add("slideRatio", "534/360");
            carousel.Add("imageList", imageList);
        }

        if (useButtons || usePictures)
        {
            Html.RenderPartial("_carousel", carousel);
        }
        else
        {
            int featureId = 0;
            if (useDetails) {
                modifier = String.Format("{0} product--has-details", modifier);
            }
            %>
            <ul class="<%= modifier %>">
            <%
                foreach (Tuple<string, string> feature in features)
                {
                    if (useId)
                    {
                    %>
                <li id="feature-<%= featureId %>">
                    <span>
                        <strong class="<%=modifier %>__headline"><%= feature.Item1 %></strong> <%= feature.Item2 %>
                        <% if (useDetails)
                            { %>
                            <button class="product__link" data-modal-action="open" type="button" id="product-detail-<%= featureId %>">More Details</button>
                        <% } %>
                    </span>
                </li>
                    <%
                    }
                    else
                    {
                    %>
                <li>
                    <span>
                        <strong class="<%=modifier %>__headline"><%= feature.Item1 %></strong> <%= feature.Item2 %>
                        <% if (useDetails)
                            { %>
                            <button class="product__link" data-modal-action="open" type="button" id="product-detail-<%= featureId %>">More Details</button>
                        <% } %>
                    </span>
                </li>
                    <%
                    }
                    featureId++;
                }
                %>
            </ul>
            <%
        }
    }
%>