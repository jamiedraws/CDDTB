<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>


<%
  // multi-dimensional array of images (before and afters)
  string[,] bas;
  bas = new string[,] {
    {"/bas/before-1.jpg", "/bas/after-1.jpg", ""},
    {"/bas/before-2.jpg", "/bas/after-2.jpg", "Alex G."},
    {"/bas/before-3.jpg", "/bas/after-3.jpg", ""},
    {"/bas/before-4.jpg", "/bas/after-4.jpg", "Hazel P."},
    {"/bas/before-5.jpg", "/bas/after-5.jpg", ""},
    {"/bas/before-6.jpg", "/bas/after-6.jpg", "Adam K."},
    {"/bas/before-7.jpg", "/bas/after-7.jpg", ""},
    {"/bas/before-8.jpg", "/bas/after-8.jpg", "Bella A."},
    {"/bas/before-9.jpg", "/bas/after-9.jpg", ""},
    {"/bas/before-10.jpg", "/bas/after-10.jpg", ""},
    {"/bas/before-11.jpg", "/bas/after-11.jpg", ""}
  };

  //
  var layout = (String)ViewData["layout"] ?? "";
  // this is to choose the column in the array to line up with product codes later
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
          var currentIndex = 0;
          var slideIndex = 0;
          var totalBasAmount = bas.GetLength(0);
          var renderControls = true;
          for (int i = 0; i < totalBasAmount; i++) {
                  var beforePath = bas[i, 0];
                  var afterPath = bas[i, 1];
                  var name = bas[i, 2];
      %>
      <div id="bas-<%= slideIndex %>" class="bas__item slide__item">
        <div class="bas__name"><%= name %></div>
        <div class="frame frame--before">
          <picture class="bas__img">
              <img src="/images<%= beforePath %>" alt="Before using Toppik">
          </picture>
        </div>
        <div class="frame frame--after">
          <picture class="bas__img">
              <img src="/images<%= afterPath %>" alt="After using Toppik">
          </picture>
        </div>
      </div>
      <%
      slideIndex++;
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
