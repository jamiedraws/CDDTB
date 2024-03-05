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

<% Html.RenderPartial("Content-Top", Model); %>

<!-- // Nav -->
<nav class="fp-nav fp-nav--is-hidden">
    <a href="#order" title="Order Now" class="fp-nav__a fp-nav__a--order">
        <span>Order<br>Now</span>
    </a>
    <a href="#video" title="Watch The Commercial" class="fp-nav__a">
        <span>Watch<br>The Show</span>
    </a>
</nav>

<section aria-labelledby="results-title" class="view results copy section theme theme--slant">
		<div id="results" class="view__anchor"></div>
		<div class="view__in section__in">

				<div class="results__group">

						<div class="results__item results__copy">

							<h2 class="results__title copy__title">Real, Natural- Looking Results</h2>

							<p>At Toppik, we are committed to delivering results you can actually see in the mirror. Discover how Toppik continues to enhance, not only our customers' appearance, but also their lives.</p>

							<!-- <a href="Reviews<%= Model.Extension %>" aria-label="See More Results" class="button">View More Results</a> -->

						</div>

						<div class="results__item results__slider">

							<div class="bas">
								<%= Html.Partial("Before-After-Fallback", Model, new ViewDataDictionary { { "layout", "slider" } }) %>
							</div>

						</div>

				</div>
		</div>
</section>

<section aria-labelledby="stats-title" class="view stats copy section theme">
		<div id="stats" class="view__anchor"></div>
		<div class="view__in section__in">

			<h2 class="stats__title copy__title">Full Hair, Full Confidence</h2>

			<p>Toppik has changed the lives of millions of men and women struggling with fine or thinning hair.</p>

				<div class="stats__group">

						<div class="stats__item">

							<picture class="stats__img" data-src-img="/images/application.jpg" data-tag='{ "img" : [{ "src" : "/images/application.jpg", "alt" : "<%= productName %> coming out the container" }]}'>
								<noscript>
									<img src="/images/application.jpg" alt="<%= productName %> coming out the container">
								</noscript>
							</picture>

						</div>

						<div class="stats__item stats__copy">

							<dl class="stat">
								<dt>93%</dt>
								<dd>agree Toppik makes them look <strong><em>younger and more attractive*</em></strong></dd>
							</dl>
							<dl class="stat">
								<dt>90%</dt>
								<dd>agree that Toppik is <br><strong><em>natural looking*</em></strong></dd>
							</dl>
							<dl class="stat">
								<dt>96%</dt>
								<dd>would <strong><em>recommend Toppik</em></strong> to others**</dd>
							</dl>

						</div>

				</div>
		</div>
</section>


<section aria-labelledby="shades-title" class="view shades copy section theme theme--dark">
		<div id="shades" class="view__anchor"></div>
		<div class="view__in section__in">

			<h2 class="shades__title copy__title">Available in nine shades</h2>

			<p>that can be mixed to match virtually any hair color, Hair Building Fibers work for all hair types and textures. Also great for part lines, covering extension tracks and touching up roots between hair color appointments. Easily washes out with shampoo.</p>

			<% Html.RenderPartial("Shades", Model); %>

			<a href="#order" id="shades-order-btn" aria-label="Purchase <%= productAttributeName %> products" class="button">Click Here to Order Now</a>

		</div>
</section>

<section aria-labelledby="durable-title" class="view durable copy section theme">
		<div id="durable" class="view__anchor"></div>
		<div class="view__in section__in">

			<h2 class="stats__title copy__title">Durable, stays in place all day from shampoo to shampoo</h2>

			<p>Made from the highest grade of natural Keratin, Toppik Hair Building Fibers are nearly <strong>identical to human hair</strong>, which allows the fibers to <strong>blend naturally and bind undetectably</strong> to even the finest of hair.</p>

			<p>The fibers are also "colorfast", which means they <strong>won't run or rub off on clothes or pillows.</strong></p>

				<div class="durable__group">

					<%--<div class="group__item icon">
						<picture class="icon__img" data-src-img="/images/icons/icon-sweat.png" data-tag='{ "source" : [{ "srcset" : "/images/icons/icon-sweat.webp", "type" : "image/webp" }], "img" : [{ "src" : "/images/icons/icon-sweat.png", "alt" : "Sweating" }]}'>
							<noscript>
								<source srcset="/images/icons/icon-sweat.webp" type="image/webp" />
								<img src="/images/icons/icon-sweat.png" alt="Sweating">
							</noscript>
						</picture>
						<figcaption>Sweat Resistant</figcaption>
					</div>--%>

					<div class="group__item icon">
						<picture class="icon__img" data-src-img="/images/icons/icon-wind.png" data-tag='{ "source" : [{ "srcset" : "/images/icons/icon-wind.webp", "type" : "image/webp" }], "img" : [{ "src" : "/images/icons/icon-wind.png", "alt" : "Windy" }]}'>
							<noscript>
								<source srcset="/images/icons/icon-wind.webp" type="image/webp" />
								<img src="/images/icons/icon-wind.png" alt="Windy">
							</noscript>
						</picture>
						<figcaption>Wind Resistant</figcaption>
					</div>

					<div class="group__item icon">
						<picture class="icon__img" data-src-img="/images/icons/icon-rain.png" data-tag='{ "source" : [{ "srcset" : "/images/icons/icon-rain.webp", "type" : "image/webp" }], "img" : [{ "src" : "/images/icons/icon-rain.png", "alt" : "Rain" }]}'>
							<noscript>
								<source srcset="/images/icons/icon-rain.webp" type="image/webp" />
								<img src="/images/icons/icon-rain.png" alt="Rain">
							</noscript>
						</picture>
						<figcaption>Rain Resistant</figcaption>
					</div>

				</div>

				<hr>

		</div>
</section>

<% Html.RenderPartial("Testimonials", Model); %>

</asp:Content>