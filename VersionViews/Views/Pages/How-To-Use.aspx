<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view section">
		<div id="main" class="view__anchor"></div>
		<div class="view__in section__in">
			<div class="copy">
				<h2 id="main-title" class="center-text">How To Use</h2>
			</div>

			<!-- how it works video -->
			<div class="media__video media__picture center-margin" data-src-iframe="https://player.vimeo.com/video/473169509?dnt=1" style="--arp:630/354;" data-attr='{ "width": "630", "height": "354", "allow": "fullscreen", "class": "center-margin"}'></div>

			<!-- how it works steps -->
			<div class="easy">
				<h3 class="easy__title">4 Easy Steps for Women</h3>
				<div class="easy__group">
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-women-1.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-women-1.jpg", "alt" : "Hair with balding patch" }]}'>
								<noscript>
									<img src="/images/how/steps-women-1.jpg" alt="Hair with balding patch">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">1.</strong>
								<span>Dry and style hair as usual.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-women-2.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-women-2.jpg", "alt" : "Apply product to hair" }]}'>
								<noscript>
									<img src="/images/how/steps-women-2.jpg" alt="Apply product to hair">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">2.</strong>
								<span>Shake or spray Toppik Fibers onto thinning areas.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-women-3.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-women-3.jpg", "alt" : "Smooth product into hair" }]}'>
								<noscript>
									<img src="/images/how/steps-women-3.jpg" alt="Smooth product into hair">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">3.</strong>
								<span>Gently pat hair to disperse fibers.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-women-4.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-women-4.jpg", "alt" : "Hair looking great with no bald patch" }]}'>
								<noscript>
									<img src="/images/how/steps-women-4.jpg" alt="Hair looking great with no bald patch">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">4.</strong>
								<span>If desired, lightly comb, brush or style your hair after applying Toppik Hair Building Fibers. Voila!</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>

			<div class="easy">
				<h3 class="easy__title">4 Easy Steps For Men</h3>
				<div class="easy__group">
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-men-1.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-men-1.jpg", "alt" : "Hair with balding patch" }]}'>
								<noscript>
									<img src="/images/how/steps-men-1.jpg" alt="Hair with balding patch">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">1.</strong>
								<span>Dry and style hair as usual.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-men-2.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-men-2.jpg", "alt" : "Applying product to bald patch" }]}'>
								<noscript>
									<img src="/images/how/steps-men-2.jpg" alt="Applying product to bald patch">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">2.</strong>
								<span>Shake or spray Toppik Fibers onto thinning areas.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-men-3.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-men-3.jpg", "alt" : "Smoothing out product into the hair" }]}'>
								<noscript>
									<img src="/images/how/steps-men-3.jpg" alt="Smoothing out product into the hair">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">3.</strong>
								<span>Gently pat hair to disperse fibers.</span>
							</figcaption>
						</figure>
					</div>
					<div class="easy__step">
						<figure>
							<picture class="easy__img" data-src-img="/images/how/steps-men-4.jpg" data-tag='{ "img" : [{ "src" : "/images/how/steps-men-4.jpg", "alt" : "No more bald patch" }]}'>
								<noscript>
									<img src="/images/how/steps-men-4.jpg" alt="No more bald patch">
								</noscript>
							</picture>
							<figcaption>
								<strong class="easy__number">4.</strong>
								<span>If desired, lightly comb, brush or style your hair after applying Toppik Hair Building Fibers. Voila!</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>

	</div>
</main>

</asp:Content>