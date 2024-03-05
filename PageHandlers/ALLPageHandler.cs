using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDT.PageHandlers
{
    public class ALLPageHandler : PageHandler
    {
        public override void OnRejectOffer()
        {
            var BUNDLEquantity = Form["BUNDLEhiddenQty"] ?? "0";
            var APP7quantity = Form["APP7hiddenQty"] ?? "0";
            var FTNR4quantity = Form["FTNR4hiddenQty"] ?? "0";
            var FIBERquantity = Form["FIBERhiddenQty"] ?? "0";
            var SC9quantity = Form["SC9hiddenQty"] ?? "0";

            OrderManager.SetProductQuantity("BUNDLE", Int32.Parse(BUNDLEquantity));
            OrderManager.SetProductQuantity("APP7", Int32.Parse(APP7quantity));
            OrderManager.SetProductQuantity("FTNR4", Int32.Parse(FTNR4quantity));
            OrderManager.SetProductQuantity("FIBER", Int32.Parse(FIBERquantity));
            OrderManager.SetProductQuantity("FIBER", Int32.Parse(SC9quantity));
        }
        public override void PostProcessPageActions()
        {
            var itemId = Request.Params["itemId"] ?? string.Empty;
            var quantityValue = Request.Params["quantity"] ?? "0";
            int quantity;
            if (!string.IsNullOrWhiteSpace(itemId) && int.TryParse(quantityValue, out quantity))
            {
                OrderManager.SetProductQuantity(itemId, quantity);
            }
        }

    }
}