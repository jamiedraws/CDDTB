<%@ Page Language="C#" MasterPageFile="~/VersionViews/22.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
  var customerServiceNumber = SettingsManager.ContextSettings["CustomerService.PhoneNumber", "1-888-325-1257"];
  var customerServiceEmail = SettingsManager.ContextSettings["CustomerService.EmailAddress"];
  var hoursOfService = SettingsManager.ContextSettings["CustomerService.HoursOfService"];
  var refundDays = SettingsManager.ContextSettings["CustomerService.RefundDays"];
  var productName = SettingsManager.ContextSettings["Label.ProductName"];
  var brandName = SettingsManager.ContextSettings["Label.BrandName"];
%>

<main aria-labelledby="main-title" class="view content content--faq section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in section__in">
        <div class="section__block content__text">
			<h2 id="main-title" class="content__title">Frequenty Asked Questions</h2>

			<div class="accordion" data-accordion-toggle data-accordion-many-containers itemscope itemtype="https://schema.org/FAQPage">

				<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="fibers-answer" id="fibers-question" itemprop="name">
							What are Toppik Hair Building Fibers made of?
						</button>
					</h3>
					<section aria-labelledby="fibers-question" id="fibers-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Toppik Hair Building Fibers are made of natural, colored Keratin Fibers - the same protein that makes up human hair. The Keratin protein is derived from a natural source, and is nearly identical to human hair.
							</p>
						</div>
					</section>
				</div>
		
	
			<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="rain-answer" id="rain-question" itemprop="name">
							If it begins to rain, will Toppik Hair Building Fibers remain in my hair?
						</button>
					</h3>
					<section aria-labelledby="rain-question" id="rain-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Toppik Hair Building Fibers resists wind, rain and perspiration. For longer-lasting results, use Toppik FiberHold Spray.
							</p>
						</div>
					</section>
				</div>
			
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="growth-answer" id="growth-question" itemprop="name">
							Do Toppik Hair Building Fibers affect hair growth?
						</button>
					</h3>
					<section aria-labelledby="growth-question" id="growth-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Toppik Hair Building Fibers do not encourage or discourage hair growth.
							</p>
						</div>
					</section>
				</div>
			
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="stay-answer" id="stay-question" itemprop="name">
							How long will Toppik Hair Building Fibers stay in place?
						</button>
					</h3>
					<section aria-labelledby="stay-question" id="stay-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Toppik Hair Building Fibers will stay in place until you wash your hair.
							</p>
						</div>
					</section>
				</div>
		
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="regrowth-answer" id="regrowth-question" itemprop="name">
							Can Toppik Hair Building Fibers cover gray roots or color-treated root re-growth?
						</button>
					</h3>
					<section aria-labelledby="regrowth-question" id="regrowth-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Toppik Hair Building Fibers can be used to effectively and easily cover both gray roots and color-treated root re-growth!
							</p>
						</div>
					</section>
				</div>
			
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="tools-answer" id="tools-question" itemprop="name">
							Can I use Toppik Hair Building Fibers with styling tools and products?
						</button>
					</h3>
					<section aria-labelledby="tools-question" id="tools-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								It is recommended that Toppik Hair Building Fibers be applied after the use of any styling tools such as hairdryers, flat irons or curling irons. Styling products (other than hairspray) should be applied to the hair prior to applying Toppik Hair Building Fibers. Applying gels, mousses, pastes, serums, and the like after applying Hair Fibers may cause shifting and could expose the areas that were meant to be covered. Let styling products dry before applying Hair Fibers.
							</p>
						</div>
					</section>
				</div>
			
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="types-answer" id="types-question" itemprop="name">
							Will Toppik Hair Building Fibers work with all hair types?
						</button>
					</h3>
					<section aria-labelledby="types-question" id="types-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>
								Yes, Toppik Hair Building Fibers work with all hair types and textures, including Caucasian hair, Asian hair, and African-American hair.
							</p>
						</div>
					</section>
				</div>
		
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="last-answer" id="last-question" itemprop="name">
							How long will a bottle of Toppik Hair Building Fibers last?
						</button>
					</h3>
					<section aria-labelledby="last-question" id="last-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							 <p>How long a bottle will last depends on how frequently the user applies the Hair Fibers, the amount of product used each time, and the size of the purchased product. Below are some general guidelines:</p>
				  <ol type="i">
					<li>Hair Building Fibers - Regular (12g): Approximately 30 days</li>
					<li>Hair Building Fibers - Supersize (27.5g): Approximately 60 or more days</li>
				  </ol>
						</div>
					</section>
				</div>

	
		
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="warning-answer" id="warning-question" itemprop="name">
							Are there any special warnings about the use of Toppik Hair Building Fibers?
						</button>
					</h3>
					<section aria-labelledby="warning-question" id="warning-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>For external use only. If irritation or rash appears, discontinue use. Avoid contact with eyes. Avoid inhalation.</p>
						</div>
					</section>
				</div>
	
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="working-answer" id="working-question" itemprop="name">
							My Spray Applicator stopped working. What should I do?
						</button>
					</h3>
					<section aria-labelledby="working-question" id="working-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Remove the Spray Applicator from the Toppik Hair Building Fibers bottle and rinse inside and out with flowing hot water. Let dry, then place the Spray Applicator back on the bottle. If it still isn't working, please contact Toppik Customer Service by calling 1-800-THICKEN (844-2536)</p>
						</div>
					</section>
				</div>
			
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="spray-warning-answer" id="spray-warning-question" itemprop="name">
							Are there any special warnings about the use of the Spray Applicator?
						</button>
					</h3>
					<section aria-labelledby="spray-warning-question" id="spray-warning-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>CHOKING HAZARD: Small parts. Not for children under 3 years.</p>
						</div>
					</section>
				</div>
	
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="natural-answer" id="natural-question" itemprop="name">
							How do I make my hairline look natural?
						</button>
					</h3>
					<section aria-labelledby="natural-question" id="natural-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>The irregular teeth and unique design of the Hairline Optimizer are ideal for naturally framing the areas around the face, including the forehead and temple. This tool also keeps Hair Fibers from falling onto the forehead when applying around the front hairline.</p>
						</div>
					</section>
				</div>
	
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="spray-answer" id="spray-question" itemprop="name">
							Do I need to use Toppik FiberHold Spray?
						</button>
					</h3>
					<section aria-labelledby="spray-question" id="spray-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>No, but if you are looking for added hold, Toppik FiberHold Spray strengthens the bond between Hair Fibers and your hair, while adding shine.</p>
						</div>
					</section>
				</div>
		
	
			<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="fiberhold-warning-answer" id="fiberhold-warning-question" itemprop="name">
							Are there any special warnings about the use of Toppik FiberHold Spray?
						</button>
					</h3>
					<section aria-labelledby="fiberhold-warning-question" id="fiberhold-warning-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Avoid getting in eyes. If eye contact occurs, rinse with water. Contents are flammable. Do not use near flame or while smoking. Avoid spraying near nose or mouth. Keep out of reach of children.</p>
						</div>
					</section>
				</div>
			</div>

			<h2 class="content__title">General Questions</h2>

			<div class="accordion" data-accordion-toggle data-accordion-many-containers itemscope itemtype="https://schema.org/FAQPage">
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="guarantee-answer" id="guarantee-question" itemprop="name">
							How does the 30-Day Money Back Guarantee Policy Work?
						</button>
					</h3>
					<section aria-labelledby="guarantee-question" id="guarantee-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>We want you to be 100% satisfied with your purchase, and we stand by the quality of our products. Try any product risk free. If you don't think an item is as effective as we've said it would be, simply return the container, even if it's completely empty, within 30 days of receiving your order, using our easy return process outlined below. We'll refund the entire purchase price less shipping and handling, no questions asked. Please see how to process returns below.</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="return-answer" id="return-question" itemprop="name">
						How Do I Process a Return?
						</button>
					</h3>
					<section aria-labelledby="return-question" id="return-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>We offer a 30-Day Money Back Guarantee policy on all orders. Simply call us at 1-8OO-THICKEN (844-2536) within 30 days of receiving your shipment for your Return Merchandise Authorization (RMA) and include it on your return label. Shipments without an RMA will not be accepted for returns. Shipping charges are not refundable. Other conditions may apply. Please contact us for details.</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="international-answer" id="international-question" itemprop="name">
						Do You Ship Internationally?
						</button>
					</h3>
					<section aria-labelledby="international-question" id="international-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Offer only valid in the US.</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="receive-answer" id="receive-question" itemprop="name">
						How Long Will It Take to Receive My Order?
						</button>
					</h3>
					<section aria-labelledby="receive-question" id="receive-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Orders are normally shipped by US Mail and may be sent to street addresses or PO boxes. Delivery of items normally takes 7-10 business days. To check the status of your order, please call us at 1-800-THICKEN (844-2536).</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="promo-answer" id="promo-question" itemprop="name">
						Are Toppik Sales and Promotions Eligible to All Customers?
						</button>
					</h3>
					<section aria-labelledby="promo-question" id="promo-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Unless specifically stated otherwise, all sales and promotions are only eligible to Toppik customers in the USA.</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="color-answer" id="color-question" itemprop="name">
						How do you decide which color to use?
						</button>
					</h3>
					<section aria-labelledby="color-question" id="color-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>While in natural light, look in a mirror and compare your hair to the colors on our hair color swatch below. Each Hair Building Fibers shade is designed to match a wide variety of hair colors, so if it's not a perfect match, don't worry! Select the shade that is closest to your natural hair color.</p>
							<div class="card__shades">
								<%= Html.Partial("Shades") %>
							</div>
						</div>
					</section>
				</div>
	
		   <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="roots-answer" id="roots-question" itemprop="name">
						Can Hair Building Fibers be used to cover roots?
						</button>
					</h3>
					<section aria-labelledby="roots-question" id="roots-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Yes! If you color treat your hair and your roots are growing in, use the Spray Applicator to precisely apply Hair Building Fibers to your roots.</p>
						</div>
					</section>
				</div>
	
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="beard-answer" id="beard-question" itemprop="name">
						Can Hair Building Fibers be used on facial hair?
						</button>
					</h3>
					<section aria-labelledby="beard-question" id="beard-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Beard coming in a little sparse? Hair Building Fibers can also be used on facial hair. Apply with the Spray Applicator and Hairline Optimizer for best results.</p>
						</div>
					</section>
				</div>
	
		  
		  <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="without-answer" id="without-question" itemprop="name">
						Will Hair Building Fibers stay in on their own without FiberHold Spray?
						</button>
					</h3>
					<section aria-labelledby="without-question" id="without-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>Hair Building Fibers stick to hair on their own because of their natural static charge. FiberHold Spray is not necessary for Fibers to "stick" to your hair. However, FiberHold Spray strengthens the bond between your hair and Fibers while adding shine.</p>
						</div>
					</section>
				</div>
	
			 <div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
					<h3 class="accordion__header card__header">
						<button class="accordion__button" aria-controls="subscription-answer" id="subscription-question" itemprop="name">
						How does the subscription program work?
						</button>
					</h3>
					<section aria-labelledby="subscription-question" id="subscription-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
						<div class="card__content" itemprop="name">
							<p>The Toppik subscription program allows you to automatically receive refills of your favorite Toppik products without placing another order. Plus, you'll save 10% off future orders! Simply choose your product and how frequently you would like to receive it - we'll take care of the rest! Toppik subscription orders ship in discreet packaging with free shipping. There's no commitment - you can cancel any time.</p>
						</div>
					</section>
				</div>
		</div>
	</article>
</main>
</asp:Content>