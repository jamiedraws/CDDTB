<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>


<%
  // multi-dimensional array of images (before and afters)
  string[,] basFallback;
  basFallback = new string[,] {
    {"ba-1.png", ""},
    {"ba-2.png", "Alex G."},
    {"ba-3.png", ""},
    {"ba-4.png", "Hazel P."},
    {"ba-5.png", ""},
    {"ba-6.png", "Adam K."},
    {"ba-7.png", ""},
    {"ba-8.png", "Bella A."},
    {"ba-9.png", ""},
    {"ba-10.png", ""},
    {"ba-11.png", ""}
  };

  string[,] bas;
  bas = new string[,] {
    {"1.jpg", ""},
    {"10.jpg", ""},
    {"2.jpg", "Alex G."},
    {"3.jpg", ""},
    {"4.jpg", "Hazel P."},
    {"5.jpg", ""},
    {"6.jpg", "Adam K."},
    {"7.jpg", ""},
    {"8.jpg", "Bella A."},
    {"9.jpg", ""},
    {"11.jpg", ""}
  };

  var path = "/images/bas/fallback/";
  var renderControls = true;
  var totalBasAmount = basFallback.GetLength(0);
  var layout = (String)ViewData["layout"] ?? "";
  var images = (String)ViewData["images"] ?? "";
  // this is to choose the column in the array to line up with product codes later

  if (images == "side-by-side") {
    path = "/images/bas/";
    totalBasAmount = bas.GetLength(0);
  }

  int column = 0;
%>

<% if (layout == "slider") { %>
<div class="slide slide--no-scrollbar bas__slide">
  <div class="slide__js">
      <noscript>
          <style>
              .slide__js {
                  display: none;
              }
          </style>
      </noscript>
  </div>
  <div id="bas-slide" class="slide__into bas__into" tabindex="0">
      <%
      if (images != "side-by-side") {
          var currentIndex = 0;
          var slideIndex = 0;
          for (int i = 0; i < totalBasAmount; i++) {
                  var file = basFallback[i, 0];
                  var name = basFallback[i, 1];
        %>
        <div id="bas-<%= slideIndex %>" class="slide__item">
          <picture class="bas__doubleimg">
            <img src="<%= path %><%= file %>" alt="<%= name %> before and after using Toppik">
          </picture>
        </div>
        <%
        slideIndex++;
        }
      } else {
        var currentIndex = 0;
          var slideIndex = 0;
          for (int i = 0; i < totalBasAmount; i++) {
                  var file = bas[i, 0];
                  var name = bas[i, 1];
        %>
        <div id="bas-<%= slideIndex %>" class="bas__item slide__item">
          <div class="bas__group">
            <figure class="bas__img">
              <img src="<%= path %>before-<%= file %>" alt="<%= name %> before using Toppik">
              <figcaption class="bas__batext">Before</figcaption>
            </figure>
            <figure class="bas__img">
              <img src="<%= path %>after-<%= file %>" alt="<%= name %> after using Toppik">
              <figcaption class="bas__batext">After</figcaption>
            </figure>
          </div>
          <div class="bas__caption"><%= name %></div>
        </div>
        <%
        slideIndex++;
        }
      }
      %>
  </div>
  <% if (renderControls) { %>
  <nav aria-label="Reviews previous and next slides" class="review__nav slide__nav slide__nav--extend">
      <button
          id="slide-prev"
          aria-label="Select the previous slide"
          class="slide__prev"
          type="button">
          <span class="icon-chevron-thin-left"></span>
      </button>
      <button
          id="slide-next"
          aria-label="Select the next slide"
          class="slide__next"
          type="button">
          <span class="icon-chevron-thin-right"></span>
      </button>
  </nav>
  <nav aria-label="Before and after thumbnail" class="bas__thumbnails slide__thumbnails">
      <%
          var currentThumbnailIndex = 0;
          var thumbnailIndex = 0;

          while (currentThumbnailIndex < totalBasAmount)
          {
              currentThumbnailIndex++;
              %>
              <a href="#bas-<%= thumbnailIndex %>" class="slide__thumbnail" data-slide-index="<%= thumbnailIndex%>" aria-label="Navigate to results set <%= thumbnailIndex %>"></a>
              <%
              thumbnailIndex++;
          }
      %>
  </nav>
  <% } %>
</div>
<% } %>
