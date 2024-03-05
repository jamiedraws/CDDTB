using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using System;
using System.Collections.Generic;

namespace CDDT
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SUNFUN10", PromoCodeRuleType.AddDiscountPercent, "SUNFUN10", 0.10M, 1, DateTime.Parse("5/22/2022"), DateTime.Parse("7/11/2022 11:59 PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FLASH30", PromoCodeRuleType.AddDiscountPercent, "FLASH30", 0.30M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/28/2022 11:59 PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("CM2020", PromoCodeRuleType.AddDiscountPercent, "CM2020", 0.15M, 1, DateTime.Parse("11/25/2020"), DateTime.Parse("12/18/2020 6:00 PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JOY2021", PromoCodeRuleType.AddDiscountPercent, "JOY2021", 0.15M, 1, DateTime.Parse("1/7/2021"), DateTime.Parse("1/20/2021 11:59 PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("LOVE15", PromoCodeRuleType.AddDiscountPercent, "LOVE15", 0.15M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("TDM21A", PromoCodeRuleType.AddDiscountPercent, "TDM21A", 0M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("TDM21B", PromoCodeRuleType.AddDiscountPercent, "TDM21B", 0M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF15", PromoCodeRuleType.AddDiscountPercent, "BF15", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF20", PromoCodeRuleType.AddDiscountPercent, "BF15", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF25", PromoCodeRuleType.AddDiscountPercent, "BF15", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF15_Custom", PromoCodeRuleType.AddDiscountPercent, "BF15", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF20_Custom", PromoCodeRuleType.AddDiscountPercent, "BF20", 0.20M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BF25_Custom", PromoCodeRuleType.AddDiscountPercent, "BF25", 0.25M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("11/27/2022 11:59PM")));
            
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("STYLISH", PromoCodeRuleType.AddDiscountValue, "STYLISH", -10M, 1, DateTime.Parse("12/6/2022"), DateTime.Parse("12/20/2022 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERONE", PromoCodeRuleType.Custom, "WINNERONE_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERONE_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERONE", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTWO", PromoCodeRuleType.Custom, "WINNERTWO_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTWO_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTWO", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST", PromoCodeRuleType.Custom, "WINNERTEST_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTEST", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BOOST10", PromoCodeRuleType.AddDiscountPercent, "BOOST10", 0.10M, 1, DateTime.Parse("10/4/2023"), DateTime.Parse("10/30/2023 11:59PM")));


            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN10_Custom", PromoCodeRuleType.AddDiscountPercent, "JAN10", 0.10M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("1/15/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN10", PromoCodeRuleType.Custom, "JAN10_Custom", 0.10M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("1/15/2023 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN15_Custom", PromoCodeRuleType.AddDiscountPercent, "JAN15", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("1/15/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN15", PromoCodeRuleType.Custom, "JAN15_Custom", 0.15M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("1/15/2023 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN20_Custom", PromoCodeRuleType.AddDiscountPercent, "JAN20", 0.20M, 1, DateTime.Parse("11/15/2022"), DateTime.Parse("1/15/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("JAN20", PromoCodeRuleType.Custom, "JAN20_Custom", 0.20M, 1, DateTime.Parse("1/8/2023"), DateTime.Parse("1/15/2023 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SHIP15", PromoCodeRuleType.AddDiscountPercent, "SHIP15", 0.15M, 1, DateTime.Parse("2/8/2023"), DateTime.Parse("2/20/2023 11:59PM")));
            //10% off sitewide
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPRING10", PromoCodeRuleType.AddDiscountPercent, "SPRING10", 0.10M, 1, DateTime.Parse("3/19/2023"), DateTime.Parse("4/16/2023 11:59PM")));
            // 15% off on subscription
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPRING15", PromoCodeRuleType.Custom, "SPRING15_custom", 0.15M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPRING15_custom", PromoCodeRuleType.ProductTransactionFee, "SPRING15", 0.15M, 1, DateTime.Parse("3/19/2023"), DateTime.Parse("4/16/2023 11:59PM")));
            PromoCodeHelper.PromoCodeItems.PromoCodeProducts.AddPromoCodeProducts("SPRING15", new List<string>() { "TBLKS30", "TDBRS30", "TMBRS30", "TLBRS30", "TMBLS30", "TLBLS30", "TGRYS30", 
                "TWHTV30", "TAUBS30", "TWHTS30","TBLKS60", "TDBRS60", "TMBRS60", "TLBRS60", "TMBLS60", "TLBLS60", "TGRYS60", "TWHTV60", "TAUBS60", "TWHTS60" });
            // 20% off on subscription
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("STARTNOW", PromoCodeRuleType.Custom, "STARTNOW_custom", 0.2M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("STARTNOW_custom", PromoCodeRuleType.ProductTransactionFee, "STARTNOW", 0.2M, 1, DateTime.Parse("7/17/2023"), DateTime.Parse("7/28/2023 11:59PM")));
            PromoCodeHelper.PromoCodeItems.PromoCodeProducts.AddPromoCodeProducts("STARTNOW", new List<string>() { "TBLKS30", "TDBRS30", "TMBRS30", "TLBRS30", "TMBLS30", "TLBLS30", "TGRYS30",
                "TWHTV30", "TAUBS30", "TWHTS30","TBLKS60", "TDBRS60", "TMBRS60", "TLBRS60", "TMBLS60", "TLBLS60", "TGRYS60", "TWHTV60", "TAUBS60", "TWHTS60" });

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SB2023", PromoCodeRuleType.AddDiscountPercent, "SB2023", 1, DateTime.Parse("3/6/2023"), DateTime.Parse("3/10/2023 11:59PM")));
           


            PromoCodeHelper.PromoCodeItems.OneTimeOnlyPromoCodes.AddRange(new List<string>
            {
                "WINNERONE",
                "WINNERTWO",
                "WINNERTEST"
            });

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY10_Custom", PromoCodeRuleType.AddDiscountPercent, "MAY10", 0.10M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY10", PromoCodeRuleType.Custom, "MAY10_Custom", 0.10M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY15_Custom", PromoCodeRuleType.AddDiscountPercent, "MAY15", 0.15M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY15", PromoCodeRuleType.Custom, "MAY15_Custom", 0.15M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY20_Custom", PromoCodeRuleType.AddDiscountPercent, "MAY20", 0.20M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MAY20", PromoCodeRuleType.Custom, "MAY20_Custom", 0.20M, 1, DateTime.Parse("5/9/2023"), DateTime.Parse("5/30/2023 11:59PM")));

            base.OnAppStart();
        }
    }
}