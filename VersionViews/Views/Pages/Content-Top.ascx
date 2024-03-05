<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
		var ext = DtmContext.ApplicationExtension;
		var version = DtmContext.Version;
		var isMobile = DtmContext.IsMobile;
		var isDesktop = !isMobile;

		var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
		var productName = productAttributeName.Replace("�", "<sup>&trade;</sup>");
		var productNameNoLegal = productAttributeName.Replace("�", "");

%>

<main aria-labelledby="main-title" class="view hero hero--arrow theme theme--dark">
		<div id="main" class="view__anchor"></div>
		<div class="theme__img"></div>
		<div class="view__in hero__in">
				<div class="hero__group">
						<div class="hero__item hero__product-advertise">
								<h2 class="hero__title hero__header">#1 INSTANT SOLUTION FOR THINNING HAIR</h2>
								<h2 id="main-title" class="hero__title">
										FULL HAIR ESSENTIALS
								</h2>
								<h3 class="hero__subtitle">Subscribe & Save!</h3>
								<div class="hero__offer-group">
									<div class="hero__offer">
											<%= Html.Partial("Offer", new ViewDataDictionary {
													{ "label", "Was $80 now $39.99" },
													{ "standfirst", "<span class='offer__currency'>$</span><span class='offer__amt'>80</span><span class='offer__cent'>00</span>" },
													{ "dollar", "39" },
													{ "cent", "99<span class='offer__asterisk'>&dagger;</span>" },
													{ "hasCrossout", "offer__price offer__price--crossout" }
											}) %>
											<div class="offer__group">
												<div class="hero__mbg hero__mbg--small">
													<picture class="mbg">
														<img src="/images/mbg.svg" alt="30 Day Money Back Guarantee">
													</picture>
												</div>
												<div class="group__item full-cc">
													<a href="#order" id="hero-order-btn" aria-label="Purchase <%= productAttributeName %> products" class="button">Order Now</a>
													<% Html.RenderPartial("GetPaymentIcons"); %>
												</div>
												<div class="badge badge--save">SAVE <span>50%</span></div>
											</div>
											<strong class="hero__shipping">FREE SHIPPING! <span>on all orders!</span></strong>
									</div>
									<div class="hero__mbg hero__mbg--large">
										<picture class="mbg">
											<img src="/images/mbg.svg" alt="30 Day Money Back Guarantee">
										</picture>
									</div>
								</div>
						</div>
						<div class="hero__item hero__product-image">
								<div class="hero__img-group">
									<figure class="headshot hero__headshot">
										<img src="/images/hero-before.jpg" alt="Girl before using <%= productName %>">
										<figcaption>Before</figcaption>
									</figure>
									<figure class="headshot hero__headshot">
										<img src="/images/hero-after.jpg" alt="Girl after using <%= productName %>">
										<figcaption>After</figcaption>
									</figure>
								</div>
						</div>
				</div>
		</div>
</main>

<section aria-labelledby="media-title" class="view media copy section theme">
		<div id="how-to-use" class="view__anchor"></div>
		<div class="view__in section__in">

				<div class="media__group">
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
		</div>
</section>