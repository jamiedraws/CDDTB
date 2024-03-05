<%@ Page Language="C#" MasterPageFile="~/Shared/Templates/DTM/Layouts/UpsellLayout.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%@ Import Namespace="System.Web.Script.Serialization" %>
    <%@ Import Namespace="Dtm.Framework.ClientSites" %>

    <%

                // custom pages
        var customPages = SettingsManager.ContextSettings["Upsell.CustomPages", ""];
        var customPagesList = customPages.Split(',').ToList();

        // Text
        var upsellPrefix = SettingsManager.ContextSettings["Upsell.Prefix", "Qty:"];

        // Layout Mode
        var layoutMode = SettingsManager.ContextSettings["Upsell.LayoutMode", ""];

        // Radio pricing
        var rdoPrice = SettingsManager.ContextSettings["Upsell.DisplayRadioPrice", false];

				// Errors
				//var test = LabelsManager.Labels["", ""];
        var upsellUpgradeError = LabelsManager.Labels["UpsellUpgradeError", "Please select a deluxe upgrade."];
				var upsellErrorProductName = LabelsManager.Labels["UpsellErrorProductName", "products"];
				var upsellMinError = LabelsManager.Labels["UpsellMinError", "Please select more than"];
				var upsellMaxError = LabelsManager.Labels["UpsellMaxError", "Can only select a maximum number of"];
				var upsellMatchError = LabelsManager.Labels["UpsellMatchError", "Please select matching quantities."];
    %>
        <%
            if (customPagesList.Where(x => string.Equals(x, DtmContext.PageCode, StringComparison.CurrentCultureIgnoreCase)).Any())
            { %>
                <script type="text/javascript" src="/js/upsell.js"></script>
              <%  // file name
                var fileName = String.Format("UpsellPage-{0}", DtmContext.PageCode);

                if (ViewEngines.Engines.FindPartialView(ViewContext.Controller.ControllerContext, fileName).View != null)
                {
                    Html.RenderPartial(fileName);
                }
            }
            else
            {
        %>

        <%

            if ( !String.IsNullOrEmpty(layoutMode) && ViewEngines.Engines.FindPartialView(ViewContext.Controller.ControllerContext, "UpsellPage-Top-" + layoutMode).View != null ) {
                Html.RenderPartial("UpsellPage-Top-" + layoutMode);
            } else {
                Html.RenderPartial("UpsellPage-Top");
            }

        %>
            <%
                 if (Model.UpsellActions != null)
                {
                    var hasThumbnails = (Model.UpsellText ?? string.Empty).Contains("[#thumb#]");
                    var ctaAboveQty = (Model.UpsellText ?? string.Empty).Contains("[#ctaAboveQty#]");
                    var getThumbnailsByCTA = (Model.UpsellText ?? string.Empty).Contains("[#getThumbnailsByCTA#]");
                    var useCSSThumbnails = (Model.UpsellText ?? string.Empty).Contains("[#useCSSThumbnails#]");

                    var upsellActions = Model.UpsellActions;
                    if (upsellActions.Count > 0)
                    {
                        Response.Write("<div class='clearer'></div>");
                        for (var i = 0; i < upsellActions.Count; i++)
                        {
                            var action = upsellActions[i];

                            if ( (int)action.ProductSelectionTypeId == 1 && (int)action.QuantitySelectionTypeId == 1) { continue; }

                            if (hasThumbnails) {
                                Response.Write("<div class='o-grid--iblock col has-thumbnail u-vw--20 u-mar--right fn--center upsell__qty' id='Q_" + action.NewProductCodes + "'>");
                            } else {
                                Response.Write("<div class='upsell__qty' id='Q_" + action.NewProductCodes + "'>");
                            }
                            if (action.ActionTypeId == 1)
                                Response.Write(Html.Hidden("ActionTargetCodes" + i, (string)action.TargetProductCodes));

                            if (action.ActionTypeId == 5)
                            {
                                Response.Write(Html.Hidden("ActionTargetCodes" + i, (string)action.TargetProductCodes));
                                Response.Write(Html.Hidden("ActionCode" + i, (string)action.NewProductCodes));
                            }
                            if (action.ActionTypeId == 6)
                            {
                                Response.Write(Html.Hidden("ActionCode" + i, (string)action.TargetProductCodes));
                                Response.Write(Html.Hidden("ActionQuantityMin" + i, (int)action.QuantityMinimum));
                                Response.Write(Html.Hidden("ActionQuantityMax" + i, (int)action.QuantityMaximum));
                            }
                            if (action.ActionTypeId == 7)
                            {
                                Response.Write(Html.Hidden("ActionTargetCodes" + i, (string)action.TargetProductCodes));

                            }
                            if (action.ActionTypeId == 8)
                            {
                                var selectListItems = new List<SelectListItem>();
                                foreach (var product in action.NewProducts)
                                {
                                    selectListItems.Add(new SelectListItem() { Text = product.Description, Value = product.ProductCode });
                                }

                                Response.Write(Html.DropDownList("ActionCode" + i, selectListItems, new { @class = "p_" + action.NewProductCodes }));
                                //if (action.QuantityMaximum != action.QuantityMinimum)
                                //{
                                //    Response.Write(Html.NumericDropDown("ActionQuantity" + i, (int)action.QuantityMinimum, (int)action.QuantityMaximum, null, new { @class = "o-box u-anim c-brand--form__select p_" + action.NewProductCodes }));
                                //}
                                if (action.QuantityMaximum == action.QuantityMinimum)
                                {
                                    Response.Write(Html.Hidden("ActionQuantity" + i, (string)action.ActionQuantity));
                                }
                            }

                            Response.Write(Html.Hidden("ActionType" + i, (int)action.ActionTypeId));
                            switch ((int)action.ProductSelectionTypeId)
                            {
                                case 2:
                                    Response.Write(Html.Hidden("ActionCode" + i, (string)action.NewProductCodes));

                                    break;
                                case 3:
                                    Response.Write("<p class='upsell__cta no-margin fn--strong'>" + action.ProductCallToAction + "</p>");
                                    Response.Write("<div class='radioButtonList' id='radioButtonList" + i + "'>");
                                    foreach (var product in action.NewProducts)
                                    {
                                        var campaignProduct = DtmContext.CampaignProducts.FirstOrDefault(cp => cp.CampaignProductId == product.CampaignProductId);
                                           var price = 0M;
                                           if(campaignProduct != null)
                                           {
                                               price = campaignProduct.Price;
                                           }
                                        string actionProductCode = action.NewProducts[0].ProductCode;
                                        string productCode = product.ProductCode;
                                        string productDescription = product.Description;
                                        %>
                                            <label class="fx--animate button-icon rbProduct u-mar--bottom">
                                                <span class="row-to-center">
                                                    <span class="col">
                                                        <% Response.Write(Html.RadioButton("ActionCode" + i, productCode, productCode == actionProductCode, new { @class = "u-mar--right p_" + product.ProductCode })); %>
                                                    </span>
                                                    <span class="col left-text">
                                                    	<%= productDescription %>
                                                        <% if(rdoPrice) { %>
                                                        <span class="rbPrice">	- <%= price.ToString("C2") %></span>
                                                        <% } %>
                                                    </span>
                                                </span>
                                            </label>
                                        <%
                                    }
                                    Response.Write("</div>");
                                    break;
                                case 4:
                                    //Response.Write("<p class='upsell__cta no-margin fn--strong'>" + action.ProductCallToAction + "</p>");
                                    Response.Write("<div class='checkboxList' id='checkboxList" + i + "'>");
                                    foreach (var product in action.NewProducts)
                                    {
                                        string actionProductCode = action.NewProducts[0].ProductCode;
                                        string productCode = product.ProductCode;
                                        string productDescription = product.Description;
                                        string targets = action.ActionTypeId == 5? (string)action.TargetProductCodes : "";

                                        Response.Write("<label class='row-to-center container block'>" +
                                                       "<div class='col left-right-padding'>" +
                                                       string.Format("<input class='u-mar--right p_{1} dtmUpsellCB' data-eflex='draw' data-id='ActionCode{0}' data-code='{1}' data-targets='{2}' name='checkBox_{1}' type='checkbox' onchange='setCheckboxActionCode(this);'>", i, product.ProductCode, targets) +
                                                       string.Format("<input id='ActionCode{0}' name='ActionCode{0}' type='hidden' value='' disabled>", i) +
                                                       "</div><div class='col'>" +
                                                       "<p class='no-margin'>" + action.ProductCallToAction + "</p>" +
                                                       "</div>" +
                                                        "</label>");
                                    }
                                    Response.Write("</div>");
                                    break;
                            }
                            switch ((int)action.QuantitySelectionTypeId)
                            {
                                case 3:
                                    if (hasThumbnails) {
                                        foreach (var product in action.NewProducts) {
                                            var campaignProduct = DtmContext.CampaignProducts.FirstOrDefault(cp => cp.CampaignProductId == product.CampaignProductId);
                                            if ( campaignProduct != null ) {
                                                var name = (campaignProduct.PropertyIndexer["Color", campaignProduct.PropertyIndexer["Thumbnail", string.Empty]]).Replace(" ", "-").ToLower();
                                                if ( getThumbnailsByCTA ) {
                                                    name = action.QuantityCallToAction.Replace(" ", "-").ToLower();
                                                }
                                                /* if we want to style the thumbnails using CSS only */
                                                if ( useCSSThumbnails ) {
                                                    Response.Write("<div class='u-pad--bottom'><div class='u-mar--center swatch swatch--" + name + "'></div></div>");
                                                } else {
                                                    Response.Write("<img class='responsive-img block u-pad--bottom' src='/images/products/" + name + ".jpg' class='thumbnail' alt='" + product.Description + "' />");
                                                }
                                            } else {
                                                Response.Write("<p>Product is disabled.</p>");
                                            }
                                        }
                                    }

                                    if (ctaAboveQty) {
                                        Response.Write("<i class='c-upsell__cta o-grid--block u-mar--bottom'>" + action.QuantityCallToAction + "</i>");
                                    }

                                    Response.Write("<i class='c-upsell__prefix'>" + upsellPrefix + "</i>");
                                    Response.Write(Html.NumericDropDown("ActionQuantity" + i, (int)action.QuantityMinimum, (int)action.QuantityMaximum, null, new { @class = "c-upsell__select c-brand--form__select o-box fx--animate u-mar--horz p_" + action.NewProductCodes }));

                                    if (!ctaAboveQty) {
                                        Response.Write("<i class='c-upsell__cta'>" + action.QuantityCallToAction + "</i>");
                                    }

                                    break;
                            }

                            Response.Write("</div><!-- END class='Quantity' -->");

                        }
                    }
                }
                else
                {
                    if (Model.ActionType == PageActionType.UpgradeProduct)
                    {
                        string codesToReplace = Model.CodesToReplace;
                        Response.Write(Html.Hidden("ActionTargetCodes0", codesToReplace));
                    }
                    string actionType = Model.ActionType;
                    ProductSelectionType productSelectorType = Model.ProductSelectorType;
                    Response.Write(Html.Hidden("ActionType0", actionType));
                    switch (productSelectorType)
                    {
                        case ProductSelectionType.Hidden:
                            string productCode = Model.ProductCodes.First().Code;
                            Response.Write(Html.Hidden("ActionCode0", productCode));
                            break;
                        case ProductSelectionType.RadioList:
                            Response.Write("<p class='upsell__cta no-margin bacon fn--strong'>" + Model.ProductCallToAction + "</p>");
                            Response.Write("<div id='radioButtonList'>");
                            foreach (ProductInformation product in Model.ProductCodes)
                            {
                                Response.Write("<div class='rbProduct'>" + Html.RadioButton("ActionCode0", product.Code, product.Selected) + product.Description + "</div>");
                            }
                            Response.Write("</div>");
                            break;
                    }
                    ProductSelectionType quantitySelectionType = Model.QuantitySelectorType;
                    switch (quantitySelectionType)
                    {
                        case ProductSelectionType.DropDownList:
                            Response.Write("<p class='upsell__cta no-margin test fn--strong'>" + Model.QuantityCallToAction + "</p>");
                            int minQuantity = Model.MinQuantity;
                            int maxQuantity = Model.MaxQuantity;
                            Response.Write(Html.NumericDropDown("ActionQuantity0", minQuantity, maxQuantity));
                            break;
                    }
                }

            %>

            <%

                if ( !String.IsNullOrEmpty(layoutMode) && ViewEngines.Engines.FindPartialView(ViewContext.Controller.ControllerContext, "UpsellPage-Bottom-" + layoutMode).View != null ) {
                    Html.RenderPartial("UpsellPage-Bottom-" + layoutMode);
                } else {
                    Html.RenderPartial("UpsellPage-Bottom");
                }

            %>

    <%
        if (Model.UpsellActions != null)
        { %>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dtmUpsellCB').each(function () {
                setCheckboxActionCode(this);

                //if there is an associated ActionTarget, add class identifier
                var id = $(this).data('id');
                var targetsId = id.replace('ActionCode', 'ActionTargetCodes');
                var actionType = id.replace('ActionCode', 'ActionType');
                var isInherit = $('#' + actionType).length > 0 && $('#' + actionType).val() == "5";
                var hasTarget = $('#' + targetsId).length > 0 && !isInherit;
                if (hasTarget) {
                    $(this).addClass('targetCheckbox');
                }
            });
        });

        function validateCheckboxList() {
            var hasCheckboxes = $('.targetCheckbox.dtmUpsellCB').length > 0;
            var count = $('.targetCheckbox.dtmUpsellCB:checked').length;

            if (hasCheckboxes && (count < 1)) {
                _dtm.alert("<%= upsellUpgradeError %>");
                return false;
            } else {
                return true;
            }
        }

        function setCheckboxActionCode(checkbox) {
            var isChecked = $(checkbox).is(':checked');
            var id = $(checkbox).data('id');
            var targetsId = id.replace('ActionCode', 'ActionTargetCodes');
            var productCode = $(checkbox).data('code');
            var targets = $(checkbox).data('targets');

            if (isChecked) {
                $('#' + id).prop('disabled', false);
                $('#' + id).val(productCode);
                if (targets.length > 0) {
                    $('#' + targetsId).prop('disabled', false);
                    $('#' + targetsId).val(targets);
                }
            }
            else {
                $('#' + id).val('');
                $('#' + id).prop('disabled', true);
                if (targets.length > 0) {
                    $('#' + targetsId).val('');
                    $('#' + targetsId).prop('disabled', true);
                }
            }
        }

        function checkTotalQuantities(min, max, productList) {
            var totalQuantity = 0
            for (var i = 0; i < productList.length; i++) {
                if ($('.p_' + productList[i]).val()) {
                    totalQuantity += parseInt($('.p_' + productList[i]).val());
                }
            }
            if (totalQuantity < min) {
                _dtm.alert("<%= upsellMinError %> " + min + " <%= upsellErrorProductName %>");
                return false;
            }
            else if (totalQuantity > max) {
                _dtm.alert("<%= upsellMaxError %> " + max + " <%= upsellErrorProductName %>");
                return false;
            }
            return true;
        }

        function checkGroupQuantities(mainGroup, altGroup) {
            var mainTotalQuantity = 0;
            for (var i = 0; i < mainGroup.length; i++) {
                if ($('.p_' + mainGroup[i]).val()) {
                    mainTotalQuantity += parseInt($('.p_' + mainGroup[i]).val());
                }
            }
            var altTotalQuantity = 0;
            for (var i = 0; i < altGroup.length; i++) {
                if ($('.p_' + altGroup[i]).val()) {
                    altTotalQuantity += parseInt($('.p_' + altGroup[i]).val());
                }
            }

            if (mainTotalQuantity !== altTotalQuantity) {
                _dtm.alert("<%= upsellMatchError %>");
                return false;
            }
            return true;
        }

        $("#acceptOffer").click(function () {
            var result = true;
            <%
            var upsellActions = Model.UpsellActions;
            bool validationActionExists = false;
            for (var i = 0; i < upsellActions.Count; i++)
            {
                var action = upsellActions[i];
                if (action.ActionTypeId == 6) //validate total quantity
                {
                    if (!validationActionExists)
                    {
                        %>
            result = checkTotalQuantities(<%= string.Format("{0}, {1}, {2}", (int) action.QuantityMinimum, (int) action.QuantityMaximum, new JavaScriptSerializer().Serialize(action.TargetProductCodes.Split(','))) %>);
                        <%
                        validationActionExists = true;
                    }
                    else
                    {
                           %>
            if (result) {
                result = checkTotalQuantities(<%= string.Format("{0}, {1}, {2}", (int) action.QuantityMinimum, (int) action.QuantityMaximum, new JavaScriptSerializer().Serialize(action.TargetProductCodes.Split(','))) %>);
            }
            <%
                    }
                }
                if (action.ActionTypeId == 7) //validate group quantity
                {
                    if (!validationActionExists)
                    {
            %>
            result = checkGroupQuantities(<%= string.Format("{0}, {1}", new JavaScriptSerializer().Serialize(action.TargetProductCodes.Split(',')), new JavaScriptSerializer().Serialize(action.NewProductCodes.Split(','))) %>);
            <%
                        validationActionExists = true;
                    }
                    else
                    {
                            %>
            if (result) {
                result = checkGroupQuantities(<%= string.Format("{0}, {1}", new JavaScriptSerializer().Serialize(action.TargetProductCodes.Split(',')), new JavaScriptSerializer().Serialize(action.NewProductCodes.Split(','))) %>);
            }
            <%
                    }
                }
            }
            %>

            result = result && validateCheckboxList();
            return result;
        });
        <% }%>

        $('#progressBar').appendTo($('form'));

        <% }%>
    </script>

    </asp:Content>
