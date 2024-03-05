<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    var ext = DtmContext.ApplicationExtension;
    var version = DtmContext.Version;
    var isMobile = DtmContext.IsMobile;
    var isDesktop = !isMobile;

    var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    var productName = productAttributeName.Replace("�", "<sup>&trade;</sup>");
    var productNameNoLegal = productAttributeName.Replace("�", "");

%>

<main aria-labelledby="main-title" class="view hero hero--show-overflow no-padding theme theme--fade">
    <div id="main" class="view__anchor"></div>
    <div class="theme__img"></div>
    <div class="view__in hero__in">
        <div class="hero__group hero__group--models">
            <div class="hero__item">
              <div class="hero__img-wrapper">
                <picture class="hero__models--after">
                  <img src="/images/models.png"  alt="Models After Using <%= productName %>" class="hero__img-main">
                </picture>
                <picture class="hero__models--before">
                  <source srcset="/images/models-before-small.png" media="(max-width: 900px)">
                  <img src="/images/models-before.png" alt="Models Before Using <%= productName %>" class="hero__img-before">
                </picture>
              </div>
            </div>
            <div class="hero__item">
                <div class="hero__text-big">
                  <h2>
                    <span>FULL HAIR,</span>
                    <span>FULL CONFIDENCE</span>
                   </h2>
                   <h3>
                     Everything you need to transform fine, thinning hair in seconds.
                   </h3>
                   <a href="#order" id="hero-order-btn" aria-label="Purchase <%= productAttributeName %> products" class="button">Click Here To Order Now</a>
                </div>
            </div>
        </div>
    </div>
</main>

<section aria-labelledby="media-title" class="view media media--alt copy section theme">
    <div id="how-to-use" class="view__anchor"></div>
    <div class="view__in section__in">

        <div class="media__group">

            <div class="media__item hero__product-advertise">
                <div class="offer-title hero__offer-title">
                  Limited Time Offer!
                </div>
                <h2 id="main-title" class="hero__title hero__title--alt">
                    FULL HAIR ESSENTIALS
                </h2>
                <div class="hero__subtitle hero__subtitle--alt">Subscribe & Save!</div>
                <div class="offer__group offer__group--reset">
                    <%= Html.Partial("Offer", new ViewDataDictionary {
                        { "label", "Was $80 now $39.99" },
                        { "standfirst", "<span class='offer__currency'>$</span><span class='offer__amt'>80</span><span class='offer__cent'>00</span>" },
                        { "dollar", "39" },
                        { "cent", "99<span class='offer__asterisk'>&dagger;</span>" },
                        { "hasCrossout", "offer__price offer__price--crossout" },
                        { "cssClasses", "offer--has-more" },
                        { "hasMore", "true" }
                    }) %>
                </div>
            </div>

            <div class="media__item">

              <picture class="media__img" data-src-img="/images/products/toppik-set.png" data-tag='{ "source" : [{ "srcset" : "/images/products/toppik-set.webp", "type" : "image/webp" }], "img" : [{ "src" : "/images/products/toppik-set.png", "alt" : "<%= productName %> Set" }]}'>
                <noscript>
                  <source srcset="/images/products/toppik-set.webp" type="image/webp" />
                  <img src="/images/products/toppik-set.png" alt="<%= productName %> Set">
                </noscript>
              </picture>

              <h2 class="media__title">+4 FREE GIFTS</h2>

              <a href="#product-set" class="has-fancybox">Learn More</a>

            </div>

        </div>
    </div>
</section>

<section aria-labelledby="stats-title" class="view stats stats--alt copy section theme theme--light">
    <div id="stats" class="view__anchor"></div>
    <div class="view__in section__in">

        <div class="stats__group">

            <div class="stats__item">

              <noscript>
                <style>
                    .media__player {
                        display: none;
                    }
                </style>
              </noscript>
              <%
                  var videoLabels = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Labels", "Watch The Show | How It Works"];
                  var videoIds = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Source", "123456789 | 123456789"];

                  var videoLabelList = videoLabels.Split(new []{ "|" }, StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()).ToList();
                  var videoIdList = videoIds.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()).ToList();
                  var videoDictionary = videoIdList.Zip(videoLabelList, (k, v) => new { k, v }).ToDictionary(x => x.k, y => y.v);
                  var videos = videoDictionary.Count();

                  if (videos > 0)
                  {
                      %>
                      <div id="video" class="media__player media__item">
                      <%
                      var firstVideo = videoDictionary.First();
                      %>
                      <div class="media__video media__picture" data-src-iframe="https://player.vimeo.com/video/<%= firstVideo.Key %>?dnt=1&autoplay=0" style="--arp:630/354;" data-attr='{ "width": "630", "height": "354", "allow": "fullscreen"}'></div>
                      <%

                      if (videos > 1)
                      {
                          %>
                          <nav aria-label="Video playlist">
                          <%
                          foreach (var video in videoDictionary)
                          {
                              %>
                              <button id="video-button-<%= video.Value %>" class="button button--accent" data-video-id="<%= video.Key %>"><%= video.Value %></button>
                              <%
                          }
                          %>
                          </nav>
                          <%
                      }

                      %>
                      </div>
                      <%
                      }
                  %>

            </div>

            <div class="stats__item stats__copy">

              <h2 class="copy__title copy__title--smaller">
                <span>#1 Instant Solution </span>
                <span>For Thinning Hair</span>
              </h2>

              <dl class="stat stat--alt">
                <dt>93%</dt>
                <dd>agree Toppik makes them look <strong><em>younger and more attractive*</em></strong></dd>
              </dl>
              <dl class="stat stat--alt">
                <dt>90%</dt>
                <dd>agree that Toppik is <br><strong><em>natural looking*</em></strong></dd>
              </dl>
              <dl class="stat stat--alt">
                <dt>96%</dt>
                <dd>would <strong><em>recommend Toppik</em></strong> to others**</dd>
              </dl>

            </div>

        </div>
    </div>
</section>

<section aria-labelledby="results-title" class="view results copy section theme theme--fade">
    <div id="results" class="view__anchor"></div>
    <div class="view__in section__in">

        <div class="results__group">

            <div class="results__item results__copy">

              <h2 class="results__title copy__title"><span>Instant</span> <span>Real</span> <span>Results</span></h2>

              <p>At Toppik, we are committed to delivering results you can actually see in the mirror. Discover how Toppik continues to enhance, not only our customers' appearance, but also their lives.</p>

            </div>

            <div class="results__item results__slider">

              <div class="bas">
                <%= Html.Partial("Before-After-Fallback", Model, new ViewDataDictionary {
                { "layout", "slider" },
                { "images", "side-by-side" }
              }) %>
              </div>

            </div>

        </div>
    </div>
</section>


<section aria-labelledby="more-info-title" class="view more-info copy section theme theme--light">
    <div id="durable" class="view__anchor"></div>
    <div class="view__in section__in">

      <div class="group more-info__group">
        <div class="more-info__item">
          <picture class="more-info__img" data-src-img="/images/more-1.jpg" data-tag='{ "img" : [{ "src" : "/images/more-1.jpg", "alt" : "Spray directly onto the hair" }]}'>
            <noscript>
              <img src="/images/more-1.jpg" alt="Spray directly onto the hair">
            </noscript>
          </picture>
          <h4 class="more-info__title">HOW IT WORKS</h4>
          <p>Style. Spray. Pat. Done. It only takes a few seconds!</p>
        </div>
        <div class="more-info__item">
          <picture class="more-info__img" data-src-img="/images/more-2.jpg" data-tag='{ "img" : [{ "src" : "/images/more-2.jpg", "alt" : "Older man before and after using <%= productName %>" }]}'>
            <noscript>
              <img src="/images/more-2.jpg" alt="Older man before and after using <%= productName %>">
            </noscript>
          </picture>
          <h4 class="more-info__title">REAL RESULTS</h4>
          <p>Read their stories, see the results, and prepare to be amazed.</p>
        </div>
        <div class="more-info__item">
          <picture class="more-info__img" data-src-img="/images/more-2.jpg" data-tag='{ "img" : [{ "src" : "/images/more-3.jpg", "alt" : "Powdered hair formula leaving bottle" }]}'>
            <noscript>
              <img src="/images/more-3.jpg" alt="Powdered hair formula leaving bottle">
            </noscript>
          </picture>
          <h4 class="more-info__title">TECHNOLOGY</h4>
          <p>See how Toppik's award winning Hair Building Fibers adhere and blend naturally.</p>
        </div>
      </div>

      <a href="#order" id="more-order-btn" aria-label="Purchase <%= productAttributeName %> products" class="button">Order Now</a>

    </div>
</section>

<% Html.RenderPartial("Testimonials", Model); %>

</asp:Content>