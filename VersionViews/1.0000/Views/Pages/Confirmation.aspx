<%@ Page Language="C#" MasterPageFile="~/Shared/Templates/DTM/Layouts/ConfirmationLayout.master" Inherits="System.Web.Mvc.ViewPage<Dtm.Framework.ClientSites.Web.ClientSiteViewData>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%@ Import Namespace="Dtm.Framework.Models.Ecommerce" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Enums" %>

<%

    var magentoOrderId = DtmContext.Order.Codes["MagentoOrderId"].Code ?? DtmContext.OrderId.ToString();

    // Layout Mode
    var layoutMode = SettingsManager.ContextSettings["ConfirmationBanner.LayoutMode", String.Empty];
    // Set view data to empty by default
    var layoutViewData = String.Empty;

    // if our layout mode is not empty
    if ( !String.IsNullOrEmpty(layoutMode) ) {
        // let's split the layout mode by the | delimiter to create our partial and view data namespace
        string[] layoutGroup = layoutMode.Split(new [] {"|"}, StringSplitOptions.RemoveEmptyEntries).ToArray();
        // let's make sure the array contains only the partial and view data namespace
        if ( layoutGroup.Length == 2 ) {
            // assign the partial name
            layoutMode = layoutGroup.ElementAt(0);
            // assign the view data namespace
            layoutViewData = layoutGroup.ElementAt(1);
        }
    }
    var showBillingStreet2 = (string.IsNullOrWhiteSpace(Model.Order.BillingStreet2)) ? false : true;
    var showShippingStreet2 = (string.IsNullOrWhiteSpace(Model.Order.ShippingStreet2)) ? false : true;
    var isFraud = SettingsManager.ContextSettings["DTM.FraudDetection.HideOrderId", false] &&  Model.Order.IsPotentiallyFraudulent;
    var amexCardTypeValue = SettingsManager.ContextSettings["Validation.CardNumber.AmericanExpress.Value"];
    var discoverCardTypeValue = SettingsManager.ContextSettings["Validation.CardNumber.Discover.Value"];
    var mcCardTypeValue = SettingsManager.ContextSettings["Validation.CardNumber.MasterCard.Value"];
    var visaCardTypeValue = SettingsManager.ContextSettings["Validation.CardNumber.Visa.Value"];
    var cardType = string.Empty;

    if (Model.Order.CardType.Equals(amexCardTypeValue, StringComparison.InvariantCultureIgnoreCase))
    {
        cardType = "American Express";
    }
    else if (Model.Order.CardType.Equals(discoverCardTypeValue, StringComparison.InvariantCultureIgnoreCase))
    {
        cardType = "Discover";
    }
    else if (Model.Order.CardType.Equals(mcCardTypeValue, StringComparison.InvariantCultureIgnoreCase))
    {
        cardType = "Mastercard";
    }
    else if (Model.Order.CardType.Equals(visaCardTypeValue, StringComparison.InvariantCultureIgnoreCase))
    {
        cardType = "Visa";
    }
    else
    {
        cardType = Model.Order.CardType;
    }

%>
      <%=Html.Partial("OrderFlowPhase")%>

	<!-- // Order Details -->
	<section class="u-pad @mv-u-pad--bottom clearfix">

		<%
			try {
				if ( !String.IsNullOrEmpty(layoutMode) && ViewEngines.Engines.FindPartialView(ViewContext.Controller.ControllerContext, "ConfirmationBanner-Top-" + layoutMode).View != null ) {
					Html.RenderPartial("ConfirmationBanner-Top-" + layoutMode, null, new ViewDataDictionary { { "LayoutNamespace", layoutViewData }});
				}
			} catch ( Exception e ) {
				Console.WriteLine("An error occurred: '{0}'", e);
			}
		%>

		<h3 class="@sm-fn--xl c-brand--box c-brand__headline--box o-box--block u-mar">
			<em class="c-brand__headline bold"><%= LabelsManager.Labels["ConfirmationHeadline"] %></em>
		</h3>

        <%if (!isFraud)
         { %>
		<!-- // Order Number -->
		<hr><p class="fn--center no-padding"><%= LabelsManager.Labels["ConfirmationOrderNumber"] %> <b class="c-brand__oid"><%= magentoOrderId %></b></p><hr>
        <%} %>


		<% if ( SettingsManager.ContextSettings["Order.EnableBackOrderMessage", false] ) { %>
			<!-- // Back Order Message -->
			<div class="o-box--msg-inform u-vw--100">
				<% if ( !String.IsNullOrEmpty(LabelsManager.Labels["ConfirmationBackOrderHeadline"]) ) { %>
					<span class="uppercase"><%= LabelsManager.Labels["ConfirmationBackOrderHeadline"] %></span>
				<% } %>
				<p class="top-padding"><%= LabelsManager.Labels["ConfirmationBackOrderDescriptor"] %></p>
			</div>
		<% } %>

		<div class="o-grid__col @mv-u-vw--25 @dv-u-pad--left @mv-u-pad--reset @dv-u-mar--reset @mv-u-mar--vert u-push--right @print-only-hide">

			<!-- // Print Confirmation -->
			<ul class="c-list--reset @mv-fn--center">
				<li class="clearfix @mv-o-grid--iblock @dv-o-grid--block">
					<a href="javascript:;" onclick="window.print();" class="o-box--btn--icon u-vw--100 fn--decor--none fx--animate @dv-u-push--right"><span class="icon-printer"></span> <%= LabelsManager.Labels["ConfirmationPrintButton"] %></a>
				</li>
				<li id="printIcon"></li>
			</ul>

		</div>

		<div class="o-grid__col @mv-u-vw--75 @p-u-vw u-push--left">

			<!-- // Billing / Shipping / Payment Details -->
			<ul class="c-list--horz o-grid u-vw--100">
				<% if ( Model.Order.PaymentType == PaymentType.Card ) { %>
				<li class="c-list__item o-grid__col @mv-u-vw--33 @mv-u-pad--vert">
					<h3 class="c-brand--box c-brand__headline--box c-brand--sm o-box--block bold"><%= LabelsManager.Labels["ConfirmationBillingHeadline"] %></h3>
					<ul class="c-list--reset viewdata--truncate--list">
						<li data-tip="<%= Model.Order.BillingFirstName %> <%= Model.Order.BillingLastName %>">
							<span class="truncate__viewdata"><%= Model.Order.BillingFirstName %> <%= Model.Order.BillingLastName %></span>
						</li>
						<li data-tip="<%= Model.Order.BillingStreet %>">
							<span class="truncate__viewdata"><%= Model.Order.BillingStreet %></span>
						</li>
                        <%if (showBillingStreet2)
                         {%>
						<li data-tip="<%= Model.Order.BillingStreet2 %><%= Model.Order.BillingStreet %>">
							<span class="truncate__viewdata"><%= Model.Order.BillingStreet2 %></span>
						</li>
                        <%} %>
						<li data-tip="<%= Model.Order.BillingCity %>, <%= Model.Order.BillingState %> <%= Model.Order.BillingZip %>">
							<span class="truncate__viewdata"><%= Model.Order.BillingCity %>, <%= Model.Order.BillingState %> <%= Model.Order.BillingZip %></span>
						</li>
						<li data-tip="<%= Model.Order.Email %>">
							<span class="truncate__viewdata"><%= Model.Order.Email %></span>
						</li>
					</ul>
				</li>
				<% } %>

				<li class="c-list__item o-grid__col @mv-u-vw--33 @mv-u-pad--vert">
					<h3 class="c-brand--box c-brand__headline--box c-brand--sm o-box--block bold"><%= LabelsManager.Labels["ConfirmationShippingHeadline"] %></h3>
					<ul class="c-list--reset viewdata--truncate--list">
						<li data-tip="<%= Model.Order.ShippingFirstName %> <%= Model.Order.ShippingLastName %>">
							<span class="truncate__viewdata"><%= Model.Order.ShippingFirstName %> <%= Model.Order.ShippingLastName %></span>
						</li>
						<li data-tip="<%= Model.Order.ShippingStreet %>">
							<span class="truncate__viewdata"><%= Model.Order.ShippingStreet %></span>
						</li>
                        <%if (showShippingStreet2)
                         {%>
						<li data-tip="<%= Model.Order.ShippingStreet2 %><%= Model.Order.ShippingStreet2 %>">
							<span class="truncate__viewdata"><%= Model.Order.ShippingStreet2 %></span>
						</li>
                         <%} %>
						<li data-tip="<%= Model.Order.ShippingCity %>, <%= Model.Order.ShippingState %> <%= Model.Order.ShippingZip %>">
							<span class="truncate__viewdata"><%= Model.Order.ShippingCity %>, <%= Model.Order.ShippingState %> <%= Model.Order.ShippingZip %></span>
						</li>
					</ul>
				</li>

				<li class="c-list__item o-grid__col @mv-u-vw--33 @mv-u-pad--vert">
					<h3 class="c-brand--box c-brand__headline--box c-brand--sm o-box--block bold"><%= LabelsManager.Labels["ConfirmationPaymentHeadline"] %></h3>
					<ul class="c-list--reset">
					<% if (Model.Order.PaymentType == PaymentType.Checkout) { %>
						<% if (Model.Order.CardType.Contains("AMAZON")) { %>
						<li>Amazon</li>

						<% } else if (Model.Order.CardType.Contains("PAYPAL")) { %>
						<li>PayPal</li>                    
						<% } else { %>
						<li><%= Model.Order.CardType %></li>

						<% } %>
						<li><%=Model.Order.Email %></li>
					<% } else { %>
						<li><%= LabelsManager.Labels["ConfirmationPaymentCardType"] %> <%= cardType %></li>
                        <%if (!string.IsNullOrWhiteSpace(Model.Order.Codes["Username"].Code)){ %><li><%=LabelsManager.Labels["ConfirmationPaymentUsername", "Account:"] %> <%= Model.Order.Codes["Username"].Code %></li><%} %>
						<%if (!string.IsNullOrWhiteSpace(Model.Order.CardNumber)) { %><li><%= LabelsManager.Labels["ConfirmationPaymentLastDigits"] %> <%= string.IsNullOrEmpty(Model.Order.CardNumber) ? "" : Model.Order.CardNumber.Substring(Model.Order.CardNumber.Length - 4, 4) %></li><%} %>
						<%if (!string.IsNullOrWhiteSpace(Model.Order.CardExpiration)) { %><li><%= LabelsManager.Labels["ConfirmationPaymentExpirationDate"] %> <%= Model.Order.CardExpiration %></li><%} %>
					<% } %>
					</ul>
				</li>
			</ul>

		</div>

	</section>


	<!-- // Order Receipt -->
	<section class="u-pad @mv-u-pad--top">

		<h3 class="c-brand--box c-brand__headline--box o-box--block u-mar fn--strong"><%= LabelsManager.Labels["OrderReceiptHeadline"] %></h3>

		<%= Html.Partial("SummaryReview") %>

		<%
			if ( SettingsManager.ContextSettings["ConfirmationBanner.EnableAdditionalBanner--Additional Banner--", false] ) {
				Html.RenderPartial("DisplayAdditionalBanner");
			}

			try {
				if ( !String.IsNullOrEmpty(layoutMode) && ViewEngines.Engines.FindPartialView(ViewContext.Controller.ControllerContext, "ConfirmationBanner-Bottom-" + layoutMode).View != null ) {
					Html.RenderPartial("ConfirmationBanner-Bottom-" + layoutMode, null, new ViewDataDictionary { { "LayoutNamespace", layoutViewData }});
				}
			} catch ( Exception e ) {
				Console.WriteLine("An error occurred: '{0}'", e);
			}
		%>

		<div class="@print-only-hide u-mar--vert @x2-mar">
			<% Html.BeginForm(); %>
				<button name="createOrder" type="submit" class="o-box--btn--icon fx--animate u-mar--center">
					<span class="icon-home"></span> <%= LabelsManager.Labels["ConfirmationBackHomeButton"] %>
				</button>
			<% Html.EndForm(); %>
		</div>

	</section>

</asp:Content>
