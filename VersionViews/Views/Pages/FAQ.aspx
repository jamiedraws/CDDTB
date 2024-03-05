<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
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

<noscript>
  <style>
    .card__content {
      visibility: visible;
      max-height: none;
    }

    .card__copy {
      opacity: 1;
    }

    .card__icon {
      display: none;
    }
  </style>
</noscript>

<main aria-labelledby="main-title" class="view section">
    <div id="main" class="view__anchor"></div>
    <div class="view__in section__in">
      <div class="copy">
        <h2 id="main-title">Frequenty Asked Questions</h2>
      </div>

      <ul aria-label="FAQ" class="section" itemscope itemtype="https://schema.org/FAQPage">

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ1" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">What are Toppik Hair Building Fibers made of?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Toppik Hair Building Fibers are made of natural, colored Keratin Fibers - the same protein that makes up human hair. The Keratin protein is derived from a natural source, and is nearly identical to human hair.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ2" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">If it begins to rain, will Toppik Hair Building Fibers remain in my hair?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Toppik Hair Building Fibers resists wind, rain and perspiration. For longer-lasting results, use Toppik FiberHold Spray.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ3" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Do Toppik Hair Building Fibers affect hair growth?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Toppik Hair Building Fibers do not encourage or discourage hair growth.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ4" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How long will Toppik Hair Building Fibers stay in place?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Toppik Hair Building Fibers will stay in place until you wash your hair.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ5" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Can Toppik Hair Building Fibers cover gray roots or color-treated root re-growth?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Toppik Hair Building Fibers can be used to effectively and easily cover both gray roots and color-treated root re-growth!</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ6" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Can I use Toppik Hair Building Fibers with styling tools and products?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>It is recommended that Toppik Hair Building Fibers be applied after the use of any styling tools such as hairdryers, flat irons or curling irons. Styling products (other than hairspray) should be applied to the hair prior to applying Toppik Hair Building Fibers. Applying gels, mousses, pastes, serums, and the like after applying Hair Fibers may cause shifting and could expose the areas that were meant to be covered. Let styling products dry before applying Hair Fibers.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ7" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Will Toppik Hair Building Fibers work with all hair types?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Yes, Toppik Hair Building Fibers work with all hair types and textures, including Caucasian hair, Asian hair, and African-American hair.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ9" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How long will a bottle of Toppik Hair Building Fibers last?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>How long a bottle will last depends on how frequently the user applies the Hair Fibers, the amount of product used each time, and the size of the purchased product. Below are some general guidelines:</p>
              <ol>
                <li>i. Hair Building Fibers - Regular (12g): Approximately 30 days</li>
                <li>ii. Hair Building Fibers - Supersize (27.5g): Approximately 60 or more days</li>
              </ol>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ10" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Are there any special warnings about the use of Toppik Hair Building Fibers?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>For external use only. If irritation or rash appears, discontinue use. Avoid contact with eyes. Avoid inhalation.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ11" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">My Spray Applicator stopped working. What should I do?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Remove the Spray Applicator from the Toppik Hair Building Fibers bottle and rinse inside and out with flowing hot water. Let dry, then place the Spray Applicator back on the bottle. If it still isn't working, please contact Toppik Customer Service by calling 1-800-THICKEN (844-2536)</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ12" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Are there any special warnings about the use of the Spray Applicator?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>CHOKING HAZARD: Small parts. Not for children under 3 years.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ13" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How do I make my hairline look natural?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>The irregular teeth and unique design of the Hairline Optimizer are ideal for naturally framing the areas around the face, including the forehead and temple. This tool also keeps Hair Fibers from falling onto the forehead when applying around the front hairline.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ13" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Do I need to use Toppik FiberHold Spray?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>No, but if you are looking for added hold, Toppik FiberHold Spray strengthens the bond between Hair Fibers and your hair, while adding shine.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ14" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Are there any special warnings about the use of Toppik FiberHold Spray?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Avoid getting in eyes. If eye contact occurs, rinse with water. Contents are flammable. Do not use near flame or while smoking. Avoid spraying near nose or mouth. Keep out of reach of children.</p>
            </div>
          </div>
        </li>

      </ul>

      <div class="copy"><h2>General Questions</h2></div>

      <ul aria-label="FAQ" class="section" itemscope itemtype="https://schema.org/FAQPage">

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ15" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How does the 30-Day Money Back Guarantee Policy Work?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>We want you to be 100% satisfied with your purchase, and we stand by the quality of our products. Try any product risk free. If you don't think an item is as effective as we've said it would be, simply return the container, even if it's completely empty, within 30 days of receiving your order, using our easy return process outlined below. We'll refund the entire purchase price less shipping and handling, no questions asked. Please see how to process returns below.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ16" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How Do I Process a Return?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>We offer a 30-Day Money Back Guarantee policy on all orders. Simply call us at 1-8OO-THICKEN (844-2536) within 30 days of receiving your shipment for your Return Merchandise Authorization (RMA) and include it on your return label. Shipments without an RMA will not be accepted for returns. Shipping charges are not refundable. Other conditions may apply. Please contact us for details.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ17" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Do You Ship Internationally?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Offer only valid in the US.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ18" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How Long Will It Take to Receive My Order?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Orders are normally shipped by US Mail and may be sent to street addresses or PO boxes. Delivery of items normally takes 7-10 business days. To check the status of your order, please call us at 1-800-THICKEN (844-2536).</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ19" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Are Toppik Sales and Promotions Eligible to All Customers?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Unless specifically stated otherwise, all sales and promotions are only eligible to Toppik customers in the USA.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ20" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How do you decide which color to use?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>While in natural light, look in a mirror and compare your hair to the colors on our hair color swatch below. Each Hair Building Fibers shade is designed to match a wide variety of hair colors, so if it's not a perfect match, don't worry! Select the shade that is closest to your natural hair color.</p>
              <picture class="icon__img" data-src-img="/images/swatches.jpg" data-tag='{ "img" : [{ "src" : "/images/swatches.jpg", "alt" : "Sweating" }]}'>
                <noscript>
                  <img src="/images/swatches.jpg" alt="Sweating">
                </noscript>
              </picture>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ21" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Can Hair Building Fibers be used to cover roots?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Yes! If you color treat your hair and your roots are growing in, use the Spray Applicator to precisely apply Hair Building Fibers to your roots.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ22" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Can Hair Building Fibers be used on facial hair?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Beard coming in a little sparse? Hair Building Fibers can also be used on facial hair. Apply with the Spray Applicator and Hairline Optimizer for best results.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ23" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">Will Hair Building Fibers stay in on their own without FiberHold Spray?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>Hair Building Fibers stick to hair on their own because of their natural static charge. FiberHold Spray is not necessary for Fibers to "stick" to your hair. However, FiberHold Spray strengthens the bond between your hair and Fibers while adding shine.</p>
            </div>
          </div>
        </li>

        <li class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
          <button id="FAQ24" class="card__item card__tab">
            <div class="card__title">
              <span itemprop="name">How does the subscription program work?</span>
              <span class="card__corner">
                <span class="card__icon"></span>
              </span>
            </div>
          </button>
          <div itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer" class="card__item card__content">
            <div itemprop="text" class="card__copy">
              <p>The Toppik subscription program allows you to automatically receive refills of your favorite Toppik products without placing another order. Plus, you'll save 10% off future orders! Simply choose your product and how frequently you would like to receive it - we'll take care of the rest! Toppik subscription orders ship in discreet packaging with free shipping. There's no commitment - you can cancel any time.</p>
            </div>
          </div>
        </li>

      </ul>
  </div>
</main>

</asp:Content>