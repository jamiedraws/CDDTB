using CDDT.Models;

namespace CDDT.Navigation
{
    public class Sitemap
    {
        public NavigationList SitemapList;
        public Sitemap()
        {
            SitemapList = new NavigationList();

            // Home
            SitemapList.AddItem(new NavigationItem
            {
                Id = "home",
                Name = "Home",
                Page = "Index",
                Hash = "#main"
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQS",
                Page = "FAQ",
                Hash = "#main"
            });

            // Customer Reviews
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-reviews",
                Name = "Real Results",
                Page = "Index",
                Hash = "#customer-reviews",
                ApplyHash = true
            });

            // How To Use
            SitemapList.AddItem(new NavigationItem
            {
                Id = "how-to-use",
                Name = "How To Use",
                Page = "How-To-Use",
                Hash = "#main"
            });

            // Technology
            SitemapList.AddItem(new NavigationItem
            {
                Id = "technology",
                Name = "Technology",
                Page = "Index",
                Hash = "#technology",
                ApplyHash = true
            });

            // Customer Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-service",
                Name = "Customer Service",
                Page = "CustomerService",
                Hash = "#main"
            });

            // Shipping Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-policy",
                Name = "Shipping Policy",
                Page = "ShippingPolicy",
                Hash = "#main"
            });

            // Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "return-policy",
                Name = "Return Policy",
                Page = "ReturnPolicy",
                Hash = "#main"
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Policy",
                Page = "https://churchdwight.com/privacy-policy.aspx",
                IsExternal = true
            });

            // Terms & Conditions
            SitemapList.AddItem(new NavigationItem
            {
                Id = "terms",
                Name = "Terms & Conditions",
                Page = "Terms",
                Hash = "#main"
            });

            // Site Map
            SitemapList.AddItem(new NavigationItem
            {
                Id = "sitemap",
                Name = "Site Map",
                Page = "SiteMap",
                Hash = "#main"
            });

            // Order Now
            SitemapList.AddItem(new NavigationItem
            {
                Id = "order-now",
                Name = "Order Now",
                Hash = "#order"
            });
        }
    }
}