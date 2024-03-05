<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<link rel="stylesheet" href="/css/upsell.css?v=8">

<% 
    using (Html.BeginForm())
    {
        var products = DtmContext.CampaignProducts.Where(cp => cp.ProductTypeId == 2).ToList();

        if (products != null && products.Any())
        {
            var snackbarLayout = new ViewDataDictionary { { "layoutMode", "snackbar" } };

%>
<input type="hidden" name="BUNDLEhiddenQty" id="BUNDLEhiddenQty"/>
<input type="hidden" name="APP7hiddenQty" id="APP7hiddenQty"/>
<input type="hidden" name="FTNR4hiddenQty" id="FTNR4hiddenQty"/>
<input type="hidden" name="FIBERhiddenQty" id="FIBERhiddenQty"/>
<input type="hidden" name="SC9hiddenQty" id="SC9hiddenQty"/>

<h2 class="page__title">TRY OUR BEST SELLING TOPPIK <br>HAIR SOLUTION PRODUCTS!</h2>

<nav class="upsell__nav upsell__nav--center upsell__nav--extra">
        <a href="javascript:document.getElementById('acceptOffer').click();" id="upsell-checkout-bottom" class="button">Continue</a>
</nav>

<section class="upsell-card">
    <div class="upsell-card__group">
        <%
            var productAPP7 = products.FirstOrDefault(p => string.Equals(p.ProductCode, "APP7", StringComparison.InvariantCultureIgnoreCase));
        %>
        <div class="upsell-card__img c-brand__img">
            <div class="c-brand__upsell-img" style="--arp:350/450;">
                <img src="/images/upsells/APP7.png" alt="Spray Applicator">
            </div>
        </div>

        <div class="upsell-card__copy c-brand--upsell">
            <h2 class="c-brand__headline">Try Our Spray Applicator for Best Application Results!</h2>

            <div class="c-brand__txt">
                <p>Attach this patented tool to Regular or Economy sized Toppik Fibers for a precise application and flawless coverage, every time. Purchase for just $14.99 today.</p>
                <p><strong>To purchase click ADD TO ORDER!</strong></p>
            </div>
            <%
                Html.RenderPartial("UpsellActionCard", productAPP7);
            %>
        </div>
    </div>
</section>

<section class="upsell-card">
    <div class="upsell-card__group">
        <%
            var productFTNR4 = products.FirstOrDefault(p => string.Equals(p.ProductCode, "FTNR4", StringComparison.InvariantCultureIgnoreCase));
        %>
        <div class="upsell-card__img c-brand__img">
            <div class="c-brand__upsell-img" style="--arp:350/450;">
                <img src="/images/upsells/FTNR9.png" alt="Hair Fattener">
            </div>
        </div>

        <div class="upsell-card__copy c-brand--upsell">
            <h2 class="c-brand__headline">Hair Fattener Advanced Thickening Serum</h2>

            <div class="c-brand__txt">
                <p>Maximize every strand with our advanced thickening serum. The concentrated keratin formula with essential nutrients instantly boosts hair's volume, thickness and shine. The perfect styling aid for thicker-looking hair. Purchase for just $12.99 today!</p>
                <p><strong>To purchase, select your quantity and click ADD TO ORDER!</strong></p>
            </div>
            <%
                Html.RenderPartial("UpsellActionCard", productFTNR4);
            %>
        </div>
    </div>
</section>

<section class="upsell-card">
    <div class="upsell-card__group">
        <%
            var productFIBER = products.FirstOrDefault(p => string.Equals(p.ProductCode, "FIBER", StringComparison.InvariantCultureIgnoreCase));
        %>
        <div class="upsell-card__img c-brand__img">
            <div class="c-brand__upsell-img" style="--arp:350/450;">
                <img src="/images/upsells/FIBER.png" alt="FiberHold Spray">
            </div>
        </div>

        <div class="upsell-card__copy c-brand--upsell">
            <h2 class="c-brand__headline">Toppik FiberHold Spray</h2>

            <div class="c-brand__txt">
                <p>A fine mist designed to strengthen the bond between Toppik Hair fibers and your existing hair, producing longer-lasting results. Purchase for just $7.99 today!</p>
                <p><strong>To purchase, select your quantity and click ADD TO ORDER!</strong></p>
            </div>
            <%
                Html.RenderPartial("UpsellActionCard", productFIBER);
            %>
        </div>
    </div>
</section>

<section class="upsell-card">
    <div class="upsell-card__group">
        <%
            var productSC9 = products.FirstOrDefault(p => string.Equals(p.ProductCode, "SC9", StringComparison.InvariantCultureIgnoreCase));
        %>
        <div class="upsell-card__img c-brand__img">
            <div class="c-brand__upsell-img" style="--arp:350/450;">
                <img src="/images/upsells/SC9.png" alt="Shampoo & Conditioner">
            </div>
        </div>

        <div class="upsell-card__copy c-brand--upsell">
            <h2 class="c-brand__headline">Hair Building Shampoo &amp; Conditioner Pack</h2>

            <div class="c-brand__txt">
                <p>Buy together and save. Toppik Shampoo strengthens and revitalizes thin hair. Toppik Conditioner nourishes with a keratin protein complex. This power pack leaves hair looking thicker and healthier. Purchase for just $18.99 today!</p>
                <p><strong>To purchase, select your quantity and click ADD TO ORDER!</strong></p>
            </div>

            <%
                Html.RenderPartial("UpsellActionCard", productSC9);
            %>
        </div>
    </div>
</section>


<div style="display:none">
    <%=Html.Partial("SummaryReview") %>
    
    <button id="acceptOffer" name="acceptOffer" type="submit" class="upsell__link">Add To Cart</button>
    <button id="rejectOffer" name="rejectOffer" type="submit" class="upsell__link">No, Thanks</button>
    <input type="hidden" name="SKIP" id="SKIP" value="false" />
</div>


<nav class="upsell__nav upsell__nav--center upsell__nav--fixed">
        <a href="javascript:document.getElementById('acceptOffer').click();" id="upsell-checkout-bottom" class="button">Continue</a>
</nav>
<script>

    document.addEventListener("DOMContentLoaded", function () {
        _upsellEngine.UpdateState();
        addEventListener("SummaryCartUpdated", _upsellEngine.UpdateState);
    });

    function updateHiddenFields() {
        $('#BUNDLEhiddenQty').val($('#BUNDLEQty').val());
        $('#APP7hiddenQty').val($('#APP7Qty').val());
        $('#FTNR4hiddenQty').val($('#FTNR4Qty').val());
        $('#FIBERhiddenQty').val($('#FIBERQty').val());
        $('#SC9hiddenQty').val($('#SC9Qty').val());
    }

    $(function () {

        $('#skipToCheckout-UP5A').on('click', function () {
            updateHiddenFields();
        });

    });

</script>
<%
        }
    }

%>
