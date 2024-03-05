using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models.Ecommerce;
using CDDT.Classes;
using System.Web.Mvc;
using Dtm.Framework.Services.DtmApi;
using System.Text.RegularExpressions;
using Dtm.Framework.ClientSites;
using Dtm.Framework.Models;
using System;
using CDDT.PromoCodeHelper;

namespace CDDT.PageHandlers
{
    public class GlobalPageHandler : PageHandler
    {
        private readonly PromoCodeManager promoCodeManager = new PromoCodeHelper.PromoCodeManager();
        private readonly string[] janPromoCodes = new string[] { "JAN20", "JAN10", "JAN15" };
        private readonly string[] mayPromoCodes = new string[] { "MAY10", "MAY15", "MAY20" };
        #region " Overrides... "

        public override void PreProcessPageActions(IList<PageAction> pageActions)
        {
            if (DtmContext.Order != null && !string.IsNullOrWhiteSpace(DtmContext.Order.Email))
            {
                if (DtmContext.Order.OrderID == 0)
                {
                    Context.SubmitChanges();
                }
                new MagentoCustomerManager().SetCustomerId();
            }
        }
        public override void PostValidate(ModelStateDictionary modelState)
        {
            base.PostValidate(modelState);
            var gender = Form["Gender"] ?? string.Empty;
            var email = Form["EmailOptInCbx"] ?? string.Empty;
            var terms = Form["Terms"] ?? string.Empty;

            ViewData["Gender"] = gender;

            ViewData["EmailOptInCbx"] = email;

            ViewData["Terms"] = terms;

            if (DtmContext.Page.IsStartPageType)
            {
                //Check one-time promo codes
                var oneTimeOnlyPromoItems = ActionItems
                       .Where(oi => PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.Key))
                       .ToList();
                var oneTimeOnlyPromoQuantity = oneTimeOnlyPromoItems.Sum(oi => oi.Value);
                if (oneTimeOnlyPromoQuantity > 0)
                {
                    foreach (var promoItem in oneTimeOnlyPromoItems)
                    {
                        if (promoCodeManager.GetPromoAppliedAmount(promoItem.Key, DtmContext.CampaignCode) > 0)
                        {
                            AddModelStateError("Form", promoItem.Key + " has already been used");
                            break;
                        }
                    }
                }
            }
        }

        public override void OnProcessPromoCode(SafeDictionary postData)
        {
            var singleItemList = new List<string>() { "TBLK", "TDBR", "TMBR", "TLBR", "TMBL", "TLBL", "TGRY", "TWHT", "TAUB" };

            if ((DtmContext.ShoppingCart["CM2020"].Quantity > 0)
                && DtmContext.ShoppingCart.Any(sc => singleItemList.Contains(sc.ProductCode)))
            {
                OrderManager.SetProductQuantity("CM2020", 0);
            }

            if ((DtmContext.ShoppingCart["TDM21A"].Quantity > 0)
                && DtmContext.ShoppingCart.Any(sc => singleItemList.Contains(sc.ProductCode)))
            {
                OrderManager.SetProductQuantity("TDM21A", 0);
                ViewData["promoCodeTarget"] = null;
            }

            if ((DtmContext.ShoppingCart["TDM21B"].Quantity > 0)
                && DtmContext.ShoppingCart.Any(sc => singleItemList.Contains(sc.ProductCode)))
            {
                OrderManager.SetProductQuantity("TDM21B", 0);
                ViewData["promoCodeTarget"] = null;
            }
        }

        public override bool OnValidatePromoCodeAction(PromoCodeRule promoCodeAction)
        {
            var validPromo = base.OnValidatePromoCodeAction(promoCodeAction);
            var orderTotal = DtmContext.ShoppingCart.Where(sc => !mayPromoCodes.Contains(sc.ProductCode) && sc.Price.HasValue).Sum(sc => sc.Price.Value * sc.Quantity);

            if (PromoCodeItems.OneTimeOnlyPromoCodes.Contains(promoCodeAction.PromoCode))
            {
                if (promoCodeManager.GetPromoAppliedAmount(promoCodeAction.PromoCode, DtmContext.CampaignCode) > 0)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", promoCodeAction.PromoCode + " has already been used");
                    return false;
                }
            }

            if (janPromoCodes.Contains(promoCodeAction.PromoCode))
            {
                if (promoCodeAction.PromoCode == "JAN10" && orderTotal < 24)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $24 to use promo JAN10");
                    return false;

                }

                if (promoCodeAction.PromoCode == "JAN15" && orderTotal < 50)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $50 to use promo JAN15");
                    return false;
                }

                if (promoCodeAction.PromoCode == "JAN20" && orderTotal < 75)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $75 to use promo JAN20");
                    return false;
                }

            }

            if (mayPromoCodes.Contains(promoCodeAction.PromoCode))
            {

                if (promoCodeAction.PromoCode == "MAY10" && orderTotal < 20)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $20 to use promo MAY10");
                    return false;

                }

                if (promoCodeAction.PromoCode == "MAY15" && orderTotal < 40)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $40 to use promo MAY15");
                    return false;
                }

                if (promoCodeAction.PromoCode == "MAY20" && orderTotal < 60)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "Order total must be at least $60 to use promo MAY20");
                    return false;
                }

            }

            var hasSubscribeItems = new List<string>() {   "TBLKS30", "TDBRS30", "TMBRS30", "TLBRS30", "TMBLS30", "TLBLS30", "TGRYS30", "TWHTV30", "TAUBS30", "TWHTS30",
                "TBLKS60", "TDBRS60", "TMBRS60", "TLBRS60", "TMBLS60", "TLBLS60", "TGRYS60", "TWHTV60", "TAUBS60", "TWHTS60" };

            if (string.Equals(promoCodeAction.PromoCode, "SHIP15", StringComparison.InvariantCultureIgnoreCase))
            {

                if (!DtmContext.ShoppingCart.Any(x => hasSubscribeItems.Contains(x.ProductCode)))
                {
                    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                    AddModelStateError("PromoCode", "SHIP15 is only valid for subscription items");
                    return false;
                }
            }

            if (promoCodeAction.PromoCode == "SPRING15")
            {

                if (!DtmContext.ShoppingCart.Any(x => hasSubscribeItems.Contains(x.ProductCode)))
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "SPRING15 is only valid for subscription items");
                    return false;
                }
            }

            if (promoCodeAction.PromoCode == "STARTNOW") 
            {

                if (!DtmContext.ShoppingCart.Any(x => hasSubscribeItems.Contains(x.ProductCode)))
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", "STARTNOW is only valid for Hair Fibers Starter Kit");
                    return false;
                }
            }

            if (promoCodeAction.PromoCode == "BOOST10" && orderTotal < 20)
            {
                OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                AddModelStateError("PromoCode", "Order total must be at least $20 to use promo BOOST10");
                return false;

            }

            return validPromo;
        }

        

        public override void PostProcessPageActions()
        {
            var blackFridayPromoCodes = new List<string>() { "BF15", "BF20", "BF25" };
            
            var promoCodes = DtmContext.PromoCodeRules.Select(p => p.ProductCode).ToList();
            //Checking for the pages code based on the main order pages array on line ten.
            if (DtmContext.Page.IsStartPageType)
            {
                Trace.WriteLine("Processing post page actions...");

                var singleItemList = new List<string>() { "TBLK", "TDBR", "TMBR", "TLBR", "TMBL", "TLBL", "TGRY", "TWHT", "TAUB",
                                                        "TBLKS1", "TDBRS1", "TMBRS1", "TLBRS1", "TMBLS1", "TLBLS1", "TGRYS1", "TWHTV1", "TAUBS1" };

                var hasSingleItem = DtmContext.ShoppingCart.Any(x => singleItemList.Contains(x.ProductCode));

               

                if (hasSingleItem)
                {
                    Order.SiteExtraInfo1 = "true";
                    if (DtmContext.Version >= 14)
                    {
                        OrderManager.SetProductQuantity("SHIP", 1);
                    }
                    else
                    {
                        OrderManager.SetProductQuantity("SHIP", 0);
                    }
                }
                else
                {
                    Order.SiteExtraInfo1 = "false";
                    OrderManager.SetProductQuantity("SHIP", 0);
                }

                 var promoCodeQuantity = 0;
                var hasCartItem = DtmContext.ShoppingCart.Any(sc => sc.Price > 0);
                switch ((int)DtmContext.Version)
                {
                    case 4:
                        ProcessPromoCodeCustom(new List<string> { "TDM21A" });
                        promoCodeQuantity = (!hasSingleItem && hasCartItem) ? 1 : promoCodeQuantity;
                        OrderManager.SetProductQuantity("TDM21A", promoCodeQuantity);
                        break;
                    case 5:
                        ProcessPromoCodeCustom(new List<string> { "TDM21B" });
                        promoCodeQuantity = (!hasSingleItem && hasCartItem) ? 1 : promoCodeQuantity;
                        OrderManager.SetProductQuantity("TDM21B", promoCodeQuantity);
                        break;
                    case 17:
                        ProcessPromoCodeCustom(new List<string> { "SUNFUN10" });
                        break;
                    case 18:
                        ProcessPromoCodeCustom(new List<string> { "BF15", "BF20", "BF25" });
                        break;
                    case 19:
                        ProcessPromoCodeCustom(new List<string> { "FLASH30" });
                        break;
                }

               
                var orderTotal = DtmContext.ShoppingCart.Where(sc => !promoCodes.Contains(sc.ProductCode) && sc.Price.HasValue).Sum(sc => sc.Price.Value * sc.Quantity);

                if (DtmContext.ShoppingCart.Where(x => promoCodes.Contains(x.ProductCode)).Sum(x => x.Quantity) > 0) 
                {
                    var boost10Quantity = (orderTotal < 20) ? 0 : 1;
                    OrderManager.SetProductQuantity("BOOST10", boost10Quantity);
                }

                if(DtmContext.ShoppingCart.Where(sc=> janPromoCodes.Contains(sc.ProductCode)).Sum(sc=> sc.Quantity) > 0)
                {
                    CalculateJanPromoCode(orderTotal);
                }

                if (DtmContext.ShoppingCart.Where(sc => mayPromoCodes.Contains(sc.ProductCode)).Sum(sc => sc.Quantity) > 0)
                {
                    CalculateMayPromoCode(orderTotal);
                }


                if (DtmContext.ShoppingCart.Where(x => promoCodes.Contains(x.ProductCode)).Sum(x => x.Quantity) > 0)
                {
                    if (orderTotal < 24)
                    {
                        OrderManager.SetProductQuantity("BF15", 0);
                        OrderManager.SetProductQuantity("BF20", 0);
                        OrderManager.SetProductQuantity("BF25", 0);
                        //ViewData["promoCodeTarget"] = null;
                    }
                    else if (orderTotal >= 24 && orderTotal < 50)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 1);
                            OrderManager.SetProductQuantity("BF20", 0);
                            OrderManager.SetProductQuantity("BF25", 0);
                            ViewData["promoCodeTarget"] = "BF15";
                        }

                    }
                    else if (orderTotal >= 50 && orderTotal < 75)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 0);
                            OrderManager.SetProductQuantity("BF20", 1);
                            OrderManager.SetProductQuantity("BF25", 0);
                            ViewData["promoCodeTarget"] = "BF20";
                        }
                    }
                    else if (orderTotal >= 75)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 0);
                            OrderManager.SetProductQuantity("BF20", 0);
                            OrderManager.SetProductQuantity("BF25", 1);
                            ViewData["promoCodeTarget"] = "BF25";
                        }
                    }
                }

                var promoCode = "SPRING15";
                if (Order.ContextOrderItems.Any(oi => oi.CachedProductInfo.ProductCode == "SPRING15"))
                {
                    var items = Order.ContextOrderItems
                    .Where(item => PromoCodeHelper.PromoCodeItems.PromoCodeProducts[promoCode].Contains(item.CachedProductInfo.ProductCode))
                    .ToList();
                    var discountPrice = items.Where(i => i.CachedProductInfo.ProductCode != promoCode)
                            .Sum(i => Math.Round(i.Price * 0.15M * -1, 2, MidpointRounding.AwayFromZero) * i.Quantity);
                    OrderManager.SetProductQuantity(promoCode, 1);
                    Order.Items[promoCode].Price = discountPrice;
                    OrderManager.AddOrderCode(discountPrice.ToString(), promoCode + "TransactionFee");
                }

                if (Order.ContextOrderItems.Any(oi => oi.CachedProductInfo.ProductCode == "STARTNOW"))
                {
                    promoCode = "STARTNOW";
                    var items = Order.ContextOrderItems
                    .Where(item => PromoCodeHelper.PromoCodeItems.PromoCodeProducts[promoCode].Contains(item.CachedProductInfo.ProductCode))
                    .ToList();
                    var discountPrice = items.Where(i => i.CachedProductInfo.ProductCode != promoCode)
                            .Sum(i => Math.Round(i.Price * 0.2M * -1, 2, MidpointRounding.AwayFromZero) * i.Quantity);
                    OrderManager.SetProductQuantity(promoCode, 1);
                    Order.Items[promoCode].Price = discountPrice;
                    OrderManager.AddOrderCode(discountPrice.ToString(), promoCode + "TransactionFee");
                }
            }
            else
            {
                if (DtmContext.Version == 14)
                {
                    var totalAmount = Order.ContextOrderItems.Where(i => !i.CachedProductInfo.ProductCode.Contains("SHIP")).Sum(item => item.Quantity * item.Price);
                    if (totalAmount >= 40 && Order.Items["SHIP"].Quantity >= 1)
                    {
                        OrderManager.SetProductQuantity("SHIP", 0);
                    }
                }

                var orderTotal = DtmContext.Order.ContextOrderItems.Where(coi => !promoCodes.Contains(coi.CachedProductInfo.ProductCode)).Sum(sc => sc.Price * sc.Quantity);


                if(DtmContext.Order.ContextOrderItems.Where(coi => janPromoCodes.Contains(coi.CachedProductInfo.ProductCode)).Sum(coi => coi.Quantity) > 0)
                {
                    CalculateJanPromoCode(orderTotal);
                }

                if (DtmContext.Order.ContextOrderItems.Where(coi => mayPromoCodes.Contains(coi.CachedProductInfo.ProductCode)).Sum(coi => coi.Quantity) > 0)
                {
                    CalculateMayPromoCode(orderTotal);
                }

                if (DtmContext.Order.ContextOrderItems.Where(coi => blackFridayPromoCodes.Contains(coi.CachedProductInfo.ProductCode)).Sum(coi => coi.Quantity) > 0)
                {
                    if (orderTotal < 24)
                    {
                        OrderManager.SetProductQuantity("BF15", 0);
                        OrderManager.SetProductQuantity("BF20", 0);
                        OrderManager.SetProductQuantity("BF25", 0);
                    }
                    else if (orderTotal >= 24 && orderTotal < 50)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 1);
                            OrderManager.SetProductQuantity("BF20", 0);
                            OrderManager.SetProductQuantity("BF25", 0);
                        }

                    }
                    else if (orderTotal >= 50 && orderTotal < 75)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 0);
                            OrderManager.SetProductQuantity("BF20", 1);
                            OrderManager.SetProductQuantity("BF25", 0);
                        }
                    }
                    else if (orderTotal >= 75)
                    {
                        if (DtmContext.Version == 18)
                        {
                            OrderManager.SetProductQuantity("BF15", 0);
                            OrderManager.SetProductQuantity("BF20", 0);
                            OrderManager.SetProductQuantity("BF25", 1);
                        }
                    }
                }           
        
            }

            if (Form.AllKeys.Contains("acceptOffer"))
            {
                var oneTimeOnlyPromoItems = Order.ContextOrderItems
                    .Where(oi => PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.CachedProductInfo.ProductCode))
                    .ToList();

                var oneTimeOnlyPromoQuantity = oneTimeOnlyPromoItems.Sum(oi => oi.Quantity);

                if (oneTimeOnlyPromoQuantity > 0)
                {
                    foreach (var promoItem in oneTimeOnlyPromoItems)
                    {
                        promoCodeManager.IncrementPromoAppliedAmount(promoItem.CachedProductInfo.ProductCode, DtmContext.CampaignCode);
                    }
                }
            }

            var promoCodeAction = DtmContext.PromoCodeRules.Where(p => Order.OrderItems.Any(oi => oi.CachedProductInfo.ProductCode == p.PromoCode)).FirstOrDefault();
            if (promoCodeAction != null && PromoCodeItems.OneTimeOnlyPromoCodes.Contains(promoCodeAction.PromoCode) && Order.ContextOrderItems.Any(oi => oi.Price > 0))
            {
                var subtotal = Order.ContextOrderItems.Where(oi => oi.Price > 0).Sum(oi => oi.Price * oi.Quantity);
                var shippingTotal = Order.ContextOrderItems.Where(oi => oi.Shipping > 0).Sum(oi => oi.Shipping * oi.Quantity);
                ProcessOneTimePromoCode(promoCodeAction.PromoCode, promoCodeAction.Value, promoCodeAction.Quantity, subtotal + shippingTotal);
            }
        }

        public override void OnProcessCustomPromoCode(PromoCodeRule promoCodeAction, SafeDictionary postData)
        {
            var promoCode = promoCodeAction.PromoCode;

            if (promoCode == "SPRING15")
            {
                var items = DtmContext.ShoppingCart
                        .Where(item => PromoCodeItems.PromoCodeProducts[promoCode].Contains(item.ProductCode))
                        .ToList();
                var discountPrice = items.Where(i => i.ProductCode != promoCode)
                        .Sum(i => Math.Round(i.Price.Value * 0.15M * -1, 2, MidpointRounding.AwayFromZero) * i.Quantity);
                OrderManager.SetProductQuantity(promoCode, 1);
                DtmContext.ShoppingCart[promoCode].Price = discountPrice;
                OrderManager.AddOrderCode(discountPrice.ToString(), promoCode + "TransactionFee");
                ViewData["promoCodeTarget"] = promoCode;
            }

            if (promoCode == "STARTNOW")
            {
                var items = DtmContext.ShoppingCart
                        .Where(item => PromoCodeItems.PromoCodeProducts[promoCode].Contains(item.ProductCode))
                        .ToList();
                var discountPrice = items.Where(i => i.ProductCode != promoCode)
                        .Sum(i => Math.Round(i.Price.Value * 0.2M * -1, 2, MidpointRounding.AwayFromZero) * i.Quantity);
                OrderManager.SetProductQuantity(promoCode, 1);
                DtmContext.ShoppingCart[promoCode].Price = discountPrice;
                OrderManager.AddOrderCode(discountPrice.ToString(), promoCode + "TransactionFee");
                ViewData["promoCodeTarget"] = promoCode;
            }

            if (PromoCodeItems.OneTimeOnlyPromoCodes.Contains(promoCode))
            {
                var subTotal = DtmContext.ShoppingCart.Where(i => i.Price.HasValue && i.Price.Value > 0).Sum(i => i.Price.Value * i.Quantity);
                var shippingTotal = DtmContext.ShoppingCart.Where(i => i.Shipping.HasValue && i.Shipping.Value > 0).Sum(i => i.Shipping.Value * i.Quantity);
                ProcessOneTimePromoCode(promoCode, promoCodeAction.Value, promoCodeAction.Quantity, subTotal + shippingTotal);
                ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
            }

            if(janPromoCodes.Contains(promoCode))
            {
                var orderTotal = DtmContext.ShoppingCart.Where(sc => !janPromoCodes.Contains(sc.ProductCode) && sc.Price.HasValue).Sum(sc => sc.Price.Value * sc.Quantity);

                CalculateJanPromoCode(orderTotal);

                ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
            }

            if (mayPromoCodes.Contains(promoCode))
            {
                var orderTotal = DtmContext.ShoppingCart.Where(sc => !mayPromoCodes.Contains(sc.ProductCode) && sc.Price.HasValue).Sum(sc => sc.Price.Value * sc.Quantity);

                CalculateMayPromoCode(orderTotal);

                ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
            }

        }

        private void CalculateJanPromoCode(decimal orderTotal)
        {
            if (orderTotal >= 24 && orderTotal < 50)
            {

                OrderManager.SetProductQuantity("JAN10", 1);
                OrderManager.SetProductQuantity("JAN15", 0);
                OrderManager.SetProductQuantity("JAN20", 0);

            }
            else if (orderTotal >= 50 && orderTotal < 75)
            {
                OrderManager.SetProductQuantity("JAN10", 0);
                OrderManager.SetProductQuantity("JAN15", 1);
                OrderManager.SetProductQuantity("JAN20", 0);

            }
            else if (orderTotal >= 75)
            {

                OrderManager.SetProductQuantity("JAN10", 0);
                OrderManager.SetProductQuantity("JAN15", 0);
                OrderManager.SetProductQuantity("JAN20", 1);
            }
        }

        private void CalculateMayPromoCode(decimal orderTotal)
        {
            if (orderTotal >= 20 && orderTotal < 40)
            {
                OrderManager.SetProductQuantity("MAY10", 1);
                OrderManager.SetProductQuantity("MAY15", 0);
                OrderManager.SetProductQuantity("MAY20", 0);

            }
            else if (orderTotal >= 40 && orderTotal < 60)
            {
                OrderManager.SetProductQuantity("MAY10", 0);
                OrderManager.SetProductQuantity("MAY15", 1);
                OrderManager.SetProductQuantity("MAY20", 0);

            }
            else if (orderTotal >= 60)
            {
                OrderManager.SetProductQuantity("MAY10", 0);
                OrderManager.SetProductQuantity("MAY15", 0);
                OrderManager.SetProductQuantity("MAY20", 1);
            }
        }

        #endregion


        private void ProcessOneTimePromoCode(string promoCode, decimal promoValue, int promoQuantity, decimal discountTotal)
        {
            OrderManager.SetProductQuantity(promoCode, promoQuantity);
            var absPromoValue = Math.Abs(promoValue);
            var newPrice = -1 * (discountTotal > absPromoValue ? absPromoValue : discountTotal);

            DtmContext.ShoppingCart.Items[promoCode].Price = newPrice;
            OrderManager.AddOrderCode(newPrice.ToString(), promoCode + "TransactionFee");

        }

        public void ProcessPromoCodeCustom(List<string> eligiblePromoCodes)
        {
            if (DtmContext.Page.IsStartPageType)
            {
                var promoCode =
                    Regex.Replace(Form["param_promoCode"] ?? Form["promoCode"], "[^A-Z0-9]", string.Empty, RegexOptions.IgnoreCase)
                        .Trim();
                if (!string.IsNullOrWhiteSpace(promoCode))
                {
                    if (Order.Codes["PROMOCODE"].Code == null)
                    {
                        OrderManager.AddOrderCode(promoCode, "PROMOCODE");
                    }
                    else
                    {
                        Order.Codes["PROMOCODE"].Code = promoCode;
                    }
                    var promoCodeActions = DtmContext.PromoCodeRules
                        .Where(rule => rule.PromoCode.Equals(promoCode, StringComparison.InvariantCultureIgnoreCase)
                                       && (!rule.HasDateRange
                                       || (rule.HasDateRange
                                       && DateTime.Now > rule.StartDate
                                       && DateTime.Now < rule.EndDate))
                                       && (!eligiblePromoCodes.Any() || eligiblePromoCodes.Contains(rule.PromoCode)))
                        .ToList();
                    if (promoCodeActions.Any() && ControllerContext.Controller.ViewData.ModelState.IsValid)
                    {
                        foreach (var promoCodeAction in promoCodeActions)
                        {
                            switch (promoCodeAction.ActionType)
                            {
                                case PromoCodeRuleType.Add:
                                case PromoCodeRuleType.AddDiscountPercent:
                                case PromoCodeRuleType.AddDiscountValue:
                                    if (OnValidatePromoCodeAction(promoCodeAction))
                                    {
                                        OrderManager.SetProductQuantity(promoCodeAction.ProductCode, promoCodeAction.Quantity, null);
                                        OrderManager.SetProductQuantity(promoCodeAction.ProductCode, promoCodeAction.Quantity);
                                        ViewData["promoCodeTarget"] = promoCodeAction.ProductCode;
                                    }
                                    break;
                                case PromoCodeRuleType.Upgrade:
                                    if (OnValidatePromoCodeAction(promoCodeAction))
                                    {
                                        OrderManager.UpgradeProduct(promoCodeAction.TargetProductCode, promoCodeAction.ProductCode);
                                        OrderManager.UpgradeProduct(promoCodeAction.TargetProductCode, promoCodeAction.ProductCode);
                                        ViewData["promoCodeTarget"] = promoCodeAction.ProductCode;
                                    }
                                    break;
                                case PromoCodeRuleType.Custom:
                                    if (OnValidatePromoCodeAction(promoCodeAction))
                                    {
                                        OnProcessCustomPromoCode(promoCodeAction, PostData);
                                    }
                                    break;
                            }
                        }
                    }
                    else
                    {
                        if (SettingsManager.ContextSettings["Validation.RequireValidPromoCodes", false])
                        {
                            AddModelStateError("PromoCode", SettingsManager.ContextSettings["Validation.PromoCodeValidationMessage", "Invalid Promo Code."]);
                        }
                    }
                }
                OnProcessPromoCode(PostData);
                ApplyPromoCodeRules();
            }
        }
    }
}
