<%@ Page Language="C#" MasterPageFile="~/VersionViews/15.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--easy section">
		<div id="main" class="view__anchor"></div>
		<div class="view__in section__in">
			<div class="copy section__block content__text">
				<h2 id="main-title" class="center-text content__title">How To Use</h2>
			</div>

			<!-- how it works video -->
			<div class="content__video contain contain--video" data-src-iframe="https://player.vimeo.com/video/473169509?dnt=1" data-attr='{ "width": "630", "height": "354", "allow": "fullscreen", "class": "center-margin"}'></div>

			<!-- how it works steps -->
			<div>
				<h3 class="content__title">4 Easy Steps for Women</h3>
				<div class="content__group">
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-women-1.jpg" >
								<img src="/shared/images/blank.png" alt="Hair with balding patch" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">1.</strong>
								<span>Dry and style hair as usual.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-women-2.jpg">
								<img src="/shared/images/blank.png" alt="Apply product to hair" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">2.</strong>
								<span>Shake or spray Toppik Fibers onto thinning areas.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-women-3.jpg">
								<img src="/shared/images/blank.png" alt="Smooth product into hair" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">3.</strong>
								<span>Gently pat hair to disperse fibers.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-women-4.jpg">
								<img src="/shared/images/blank.png" alt="Hair looking great with no bald patch" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">4.</strong>
								<span>If desired, lightly comb, brush or style your hair after applying Toppik Hair Building Fibers. Voila!</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>

			<div>
				<h3 class="content__title">4 Easy Steps For Men</h3>
				<div class="content__group">
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-men-1.jpg">
								<img src="/shared/images/blank.png" alt="Hair with balding patch" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">1.</strong>
								<span>Dry and style hair as usual.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-men-2.jpg">
								<img src="/shared/images/blank.png" alt="Applying product to bald patch" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">2.</strong>
								<span>Shake or spray Toppik Fibers onto thinning areas.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-men-3.jpg">
								<img src="/shared/images/blank.png" alt="Smoothing out product into the hair" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">3.</strong>
								<span>Gently pat hair to disperse fibers.</span>
							</figcaption>
						</figure>
					</div>
					<div class="content__step">
						<figure>
							<picture class="content__img" data-src-img="/images/how/steps-men-4.jpg">
								<img src="/shared/images/blank.png" alt="No more bald patch" height="243" width="243">
							</picture>
							<figcaption>
								<strong class="content__number">4.</strong>
								<span>If desired, lightly comb, brush or style your hair after applying Toppik Hair Building Fibers. Voila!</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>

	</div>
</main>

</asp:Content>