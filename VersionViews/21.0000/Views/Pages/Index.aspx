<%@ Page Language="C#" MasterPageFile="~/VersionViews/21.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDT.Models" %>

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

<main aria-labelledby="main-title" class="view hero">
	<div id="main" class="view__anchor"></div>
	<div class="hero__background"></div>
	<div class="view__in section__in hero__in">
		<div class="hero__text">
			<h1 class="hero__standfirst">#1 Hair Filling Solution</h1>
			<h2 class="hero__title">CONCEALS. ENHANCES. PERFECTS.</h2>
			<p>Whether you're looking to conceal your roots, enhance your
			style or perfect your hairline, Toppik Hair Building Fibers are
			the perfect finishing touch and are available in 9 shades for
			all hair types and textures.</p>
		</div>
	</div>
</main>

<section aria-labelledby="media-title" class="view section main-offer">
	<div id="main-offer" class="view__anchor"></div>
	<div class="view__in section__in">
		<h2 class="callout">EXCLUSIVE WEB ONLY OFFER!</h2>

		<div class="main-offer__group">
			<div class="main-offer__price-payment-order">
				<div class="sr main-offer__price">
					<div class="sr__text">Now Only $24.95</div>
					  	<div class="offer" aria-hidden="true" role="presentation">
						<span class="offer__standfirst">NOW ONLY</span>
						<div class="offer__group">
							<span class="offer__currency">$</span>
							<span class="offer__amt">24</span>
							<span class="offer__follow">
								<span class="offer__cent">95</span>
								<span class="offer__disclaimer"></span>
							</span>
						</div>
					</div>
				</div>
				<a href="#order" id="main-offer-order" class="button">Order Now</a>
				<% Html.RenderPartial("GetPaymentIcons"); %>
			</div>

			<div class="main-offer__products">
				<figure class="main-offer__fibers">
					<picture >
						<img src="/images/products/fibers.png" height="257" width="149" alt="Hair Building Fibers"/>
					</picture>
					<figcaption>12g Fibers</figcaption>
				</figure>

				<div class="main-offer__available">
				<span class="main-offer__available--text">AVAILABLE IN</span> 
				<b>9 SHADES</b></div>

				<div class="main-offer__plus">
				<span class="main-offer__plus--icon"><b>+</b></span> 
				</div>

				<div class="main-offer__value">
					<span class="main-offer__value--price">$20</span>
					<span class="main-offer__value--text">VALUE</span>
				</div>

				<figure class="main-offer__organizer">
					<div class="burst burst--tv">
						<small>Special</small> 
						<span>TV</span> 
						<small>Offer!</small>
					</div>
					<picture>
						<img src="/images/products/hairstyle-organizer.png" height="199" width="340" alt="Toppik Hairstyle Organizer"/>
					</picture>
					<figcaption>
						<b>FREE</b> Hair Perfecting Duo Kit
					</figcaption>
				</figure>
			</div>

			<div class="main-offer__info">
				<div class="main-offer__shipping">
					<b>FREE SHIPPING! </b> with subscription
				</div>

				<div class="main-offer__mbg">
					<b>30 DAY</b> 
					<span>MONEY BACK GUARANTEE</span> 
					<small>Less S&H</small>
				</div>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="features-benefits-title" class="view content content--media-player-text section bg bg--media-player">
	<div id="features-benefits" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="content__group">
			<div class="content__text">
				<h2 class="content__title">Full Hair, Full Confidence</h2>
				<ul class="stats-text">
					<li><b>93%</b> <span>agree Toppik makes them look younger and more attractive*</span></li>
					<li><b>90%</b> <span>agree that Toppik is natural looking*</span></li>
					<li><b>96%</b> <span>would recommend Toppik to others**</span></li>
				</ul>
			</div>
			<div class="content__video">
				<div class="view media-player">
					<div id="video" class="view__anchor"></div>
					<noscript>
						<style>
							.media__player {
								display: none;
							}
						</style>
					</noscript>
					<%
					var mediaPlayer = new MediaPlayer();

					if (mediaPlayer.HasSingleVideo())
					{
						var videos = mediaPlayer.VideoList;
						var firstVideo = videos.First();

						%>
					<div class="media-player__player">
						<div class="media-player__video contain contain--video" data-media-player-src-iframe="https://player.vimeo.com/video/<%= firstVideo.Id %>?dnt=1" data-attr='{ "width": "630", "height": "354", "allow": "fullscreen", "title": "PlasmaPro air purifier features and benefits" }'></div>
						<%

						if (mediaPlayer.HasMultipleVideos())
						{
							%>
							<nav aria-label="Video playlist" class="media-player__group">
							<%
							foreach (var video in videos)
							{
								var buttonId = video.Label.Replace(" ", "-").ToLower();
								%>
								<button id="video-button-<%= buttonId %>" class="button button--accent button--can-scale media-player__button" data-media-player-video-id="<%= video.Id %>"><%= video.Label %></button>
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
		</div>
	</div>
</section>

<section aria-labelledby="results-title" class="view section content content--results bg bg--results">
	<div id="results" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block content__header">
			<h2 id="results-title" class="content__title">Real Natural-Looking Results</h2>
			<p>At Toppik, we are committed to delivering results you can actually see in the mirror. Discover how Toppik continues to enhance, not only our customers' appearance, but also their lives.</p>
		</div>

		<div class="section__block">
			<div class="slide slide--result">
				<div id="baf" class="slide__into" tabindex="0">
					<div class="slide__item baf">
						<figure class="baf__before">
							<picture data-src-img="/images/bas/15.0000/before-1.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>Before</figcaption>
						</figure>

						<figure class="baf__after">
							<picture data-src-img="/images/bas/15.0000/after-1.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>After</figcaption>
						</figure>
					</div>

					<div class="slide__item baf">
						<figure class="baf__before">
							<picture data-src-img="/images/bas/15.0000/before-2.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>Before</figcaption>
						</figure>

						<figure class="baf__after">
							<picture data-src-img="/images/bas/15.0000/after-2.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>After</figcaption>
						</figure>
					</div>

					<div class="slide__item baf">
						<figure class="baf__before">
							<picture data-src-img="/images/bas/15.0000/before-3.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>Before</figcaption>
						</figure>

						<figure class="baf__after">
							<picture data-src-img="/images/bas/15.0000/after-3.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>After</figcaption>
						</figure>
					</div>

					<div class="slide__item baf">
						<figure class="baf__before">
							<picture data-src-img="/images/bas/15.0000/before-4.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>Before</figcaption>
						</figure>

						<figure class="baf__after">
							<picture data-src-img="/images/bas/15.0000/after-4.jpg">
								<img src="/shared/images/blank.png" height="311" width="311" alt=""/>
							</picture>
							<figcaption>After</figcaption>
						</figure>
					</div>
				</div>
				<nav aria-label="Before and after photos previous and next slides" class="slide__nav">
                    <button
                        id="result-slide-prev"
                        aria-label="Select the previous slide"
                        class="slide__prev"
                        type="button">
                        <svg class="icon icon-chevron"><use href="#icon-chevron"></use></svg>
                    </button>
                    <button
                        id="result-slide-next"
                        aria-label="Select the next slide"
                        class="slide__next"
                        type="button">
                        <svg class="icon icon-chevron"><use href="#icon-chevron"></use></svg>
                    </button>
                </nav>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="shades-title" class="view content content--shades section">
	<div id="shades" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block content__header">
			<h2 id="shades-title" class="content__title">Available in 9 shades</h2>
			<p>that can be mixed to match virtually any hair color, Hair Building Fibers work for all hair types and textures. Also great for part lines, covering extension tracks and touching up roots between hair color appointments. Easily washes out with shampoo.</p>
		</div>

		<div class="section__block shades">
			<% Html.RenderPartial("Shades", Model); %>
		</div>

		<div class="section__block content__footer">
			<a href="#order" id="shades-order-btn" class="button">Click Here to Order Now</a>
		</div>
	</div>
</section>

<% Html.RenderPartial("Testimonials", Model); %>

<section aria-labelledby="technology-title" class="view content content--title-image-caption section">
	<div id="technology" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block content__header">
			<h2 id="technology-title" class="content__title">Durable, stays in place all day from shampoo to shampoo</h2>
			<p>Made from the highest grade of natural Keratin, Toppik Hair Building Fibers are nearly identical to human hair, which allows the fibers to blend naturally and bind undetectably to even the finest of hair.</p>
			<p>The fibers are also "colorfast", which means they won't run or rub off on clothes or pillows.</p>
		</div>

		<div class="section__block">
			<div class="content__group">
				<figure>
					<picture data-src-img="/images/resistant/sweat.jpg">
						<img src="/shared/images/blank.png" alt="Sweating" height="251" width="251">
					</picture>
					<figcaption><b>SWEAT</b> <b>RESISTANT</b></figcaption>
				</figure>
	
				<figure>
					<picture data-src-img="/images/resistant/wind.jpg">
						<img src="/shared/images/blank.png" alt="Windy" height="251" width="251">
					</picture>
					<figcaption><b>WIND</b> <b>RESISTANT</b></figcaption>
				</figure>
	
				<figure>
					<picture data-src-img="/images/resistant/rain.jpg">
						<img src="/shared/images/blank.png" alt="Rain" height="251" width="251">
					</picture>
					<figcaption><b>RAIN</b> <b>RESISTANT</b></figcaption>
				</figure>
			</div>
		</div>
	</div>
</section>

<nav aria-label="Quick actions and areas of interest" class="fp-nav fp-nav--is-hidden">
    <a href="#order" title="Order Now" class="fp-nav__a fp-nav__a--order">
        <span>Order<br>Now</span>
    </a>
    <a href="#video" title="Watch The Commercial" class="fp-nav__a">
        <span>Watch<br>The Show</span>
    </a>
</nav>

</asp:Content>