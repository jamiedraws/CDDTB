<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dtm.Framework.Base.Models.BaseClientViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.ClientSites.Web.Models" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%

    var ext = DtmContext.ApplicationExtension;
    var displayDefault = "carousel";
    var showMoreLink = ViewData["showMoreLink"] as bool? ?? false;
    var showOrderButton = ViewData["showOrderButton"] as bool? ?? false;
    var display = ViewData["display"] as string ?? displayDefault;
    var isCarousel = display == displayDefault;
    var isList = display == "list";
    var title = ViewData["title"] as string ?? "Toppik Rave Reviews";

    if (Model != null && Model.Testimonials != null && Model.Testimonials.Any())
    {
        var approvedTestimonials = Model.Testimonials.Where(t => t.IsApproved
        && (!t.CampaignOfferVersionId.HasValue
        || (t.CampaignOfferVersionId.HasValue && t.CampaignOfferVersionId.Value == DtmContext.VersionId))
        && (!t.CampaignOfferId.HasValue
        || (t.CampaignOfferId.HasValue && t.CampaignOfferId.Value == DtmContext.OfferId)))
        .OrderBy(t => t.DisplayRank.HasValue ? t.DisplayRank.Value : 0);

        if (approvedTestimonials.Any())
        {
            var approvedCampaignTestimonials = approvedTestimonials.Where(t => !t.CampaignOfferVersionId.HasValue
                && !t.CampaignOfferId.HasValue).ToList()
                ?? new List<TestimonialView>();
            var approvedOfferTestimonials = approvedTestimonials.Where(t => t.CampaignOfferId.HasValue
                && !t.CampaignOfferVersionId.HasValue).ToList()
                ?? new List<TestimonialView>();
            var approvedVersionTestimonials = approvedTestimonials.Where(t => t.CampaignOfferVersionId.HasValue).ToList()
                ?? new List<TestimonialView>();

            var testimonials = approvedCampaignTestimonials;
            if (approvedVersionTestimonials.Count() > 0)
            {
                testimonials = approvedVersionTestimonials;
            }
            else if (approvedOfferTestimonials.Count() > 0)
            {
                testimonials = approvedOfferTestimonials;
            }

            if (isCarousel)
            {
                var carouselTestimonials = testimonials.Where(t => t.OkToShowName).ToList();
                var hasCarouselTestimonials = carouselTestimonials.Count() > 0;

                if (hasCarouselTestimonials)
                {
%>

<section aria-labelledby="reviews-title" class="view review section">
    <div id="customer-reviews" class="view__anchor"></div>
    <div class="review__background-filter">
        <div class="review__background"></div>
    </div>

    <div class="view__in section__in review__in">
        <div class="review__content">
        <% if (title != "") { %>
            <h2 id="reviews-title" class="review__title"><%= title %></h2>
        <% } %>
            <div class="slide slide--review">
                <div id="reviews-slide" class="slide__into" tabindex="0">
                    <%
                        var currentIndex = 0;
                        var batchSize = 1;
                        var slideIndex = 0;
                        var totalTestimonialsAmount = carouselTestimonials.Count;
                        var renderControls = totalTestimonialsAmount > batchSize;

                        while (currentIndex < totalTestimonialsAmount)
                        {
                            var testimonialBatch = carouselTestimonials.Skip(currentIndex).Take(batchSize);
                            currentIndex += batchSize;
                    %>
                    <div id="review-<%= slideIndex %>" class="slide__item">
                        <%
                            foreach (var testimonial in testimonialBatch)
                            {
                                var quote = testimonial.Quote;
                                var name = String.Format(testimonial.FirstName);
                        %>
                        <figure class="review__quote">
                            <picture class="review__stars" data-src-img="/images/stars.svg">
                              <noscript>
                                <img src="/images/stars.svg" alt="5 stars">
                              </noscript>
                            </picture>
                            <blockquote><%= quote %></blockquote>
                            <figcaption><%= name %></figcaption>
                        </figure>
                        <%
                            }

                        %>
                    </div>
                    <%

                            slideIndex++;
                        }

                    %>
                </div>
                <% if (renderControls) { %>
                <nav aria-label="Reviews previous and next slides" class="slide__nav">
                    <button
                        id="review-slide-prev"
                        aria-label="Select the previous slide"
                        class="slide__prev"
                        type="button">
                        <svg class="icon icon-chevron"><use href="#icon-chevron"></svg>
                    </button>
                    <button
                        id="review-slide-next"
                        aria-label="Select the next slide"
                        class="slide__next"
                        type="button">
                        <svg class="icon icon-chevron"><use href="#icon-chevron"></svg>
                    </button>
                </nav>
                <nav aria-label="Reviews thumbnail" class="review__thumbnails slide__thumbnails">
                    <%
                        var currentThumbnailIndex = 0;
                        var thumbnailIndex = 0;

                        while (currentThumbnailIndex < totalTestimonialsAmount)
                        {
                            currentThumbnailIndex += batchSize;
                            %>
                            <a href="#review-<%= thumbnailIndex %>" class="slide__thumbnail slide__dot" data-slide-index="<%= thumbnailIndex%>" aria-label="Navigate to review set <%= thumbnailIndex %>"></a>
                            <%
                            thumbnailIndex++;
                        }
                    %>
                </nav>
                <% } %>
            </div>
            <% if (showMoreLink && renderControls)
                { %>
            <div class="copy__footer">
                <a href="Testimonials<%= ext %>" id="index-reviews" class="button">
                    <span>More Testimonials</span>
                </a>
            </div>
            <% } %>
            <% if (showOrderButton)
                {
            %>
            <div class="copy__footer">
            </div>
            <% } %>
        </div>
        </div>
    </div>
</section>
<%
        }
    } %>

<% if (isList)
    {
        var listTestimonials = testimonials.Where(t => t.OkToShowName).ToList();
        var hasListTestimonials = listTestimonials.Count() > 0;

        if (hasListTestimonials)
        {
%>
<main aria-labelledby="main-title" class="view reviews">
    <div id="main" class="view__anchor"></div>
    <div class="view__in">
        <h2 id="review-title" class="reviews__title copy__title"><%= title %></h2>
        <div class="review review--tiles">
            <%
                foreach (var testimonial in listTestimonials)
                {
                    var quote = testimonial.Quote;
                    var name = String.Format("{0} {1}", testimonial.FirstName, testimonial.LastName);
            %>
            <blockquote class="review__item review__item--stacked">
                <div class="review__text">
                    <%= quote %>
                    <footer class="review__text"><strong><%= name %></strong></footer>
                </div>
            </blockquote>
            <%
                }
            %>
        </div>
    </div>
</main>
<%
        }


    } %>
<% }
    } %>