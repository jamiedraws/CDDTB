using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDT.PageHandlers
{
    public class TBLKSRPageHandler : PageHandler
    {
        public override void PostProcessPageActions()
        {
            if (DtmContext.Version >= 14)
            {
                var subscriptionSelected = Form["subscriptionUpsell"] ?? string.Empty;
                if (!string.IsNullOrWhiteSpace(subscriptionSelected))
                {
                    var itemProductCode = Order.OrderItems.Where(oi => oi.CachedProductInfo.ProductCode.EndsWith("S1")).Select(oi => oi.CachedProductInfo.ProductCode).FirstOrDefault().ToString();

                    switch (subscriptionSelected)
                    {
                        case "60":
                            OrderManager.UpgradeProduct(itemProductCode, itemProductCode.TrimEnd('1') + "60R");
                            break;
                        case "30":
                            OrderManager.UpgradeProduct(itemProductCode, itemProductCode.TrimEnd('1') + "30R");
                            break;
                    }
                }
            }
        }

    }
}