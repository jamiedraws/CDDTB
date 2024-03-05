using Dtm.Framework.Services.DtmApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.ClientSites;
using Dtm.Framework.Models.Ecommerce;
using System.Net;

namespace CDDT.Classes
{
    public class MagentoCustomerManager
    {

        private readonly string CampaignCode;
        private readonly string OfferCode;
        private readonly decimal Version;
        private readonly string ApiKey;
        private readonly string MagentoCustomerLabel;
        private readonly string MagentoOrderLabel;

        public MagentoCustomerManager()
        {
            ApiKey = SettingsManager.ContextSettings["Dtm.Api.Key"];
            CampaignCode = DtmContext.CampaignCode;
            OfferCode = DtmContext.OfferCode;
            Version = DtmContext.Version;
            MagentoCustomerLabel = "MagentoCustomerId";
            MagentoOrderLabel = "MagentoOrderId";
        }

        public void SetCustomerId()
        {

            if (DtmContext.Order.Codes[MagentoCustomerLabel].Code == null
                && DtmContext.Order.Codes[MagentoOrderLabel].Code == null)
            {
                var customerInfo = GetCustomer(DtmContext.Order.BillingFirstName, DtmContext.Order.BillingLastName, DtmContext.Order.Email);

                if (customerInfo != null)
                {
                    DtmContext.Order.AddOrderCode(customerInfo.Item1, MagentoCustomerLabel);
                    DtmContext.Order.AddOrderCode(customerInfo.Item2, MagentoOrderLabel);
                }
            }
        }


        private Tuple<string, string> GetCustomer(string firstName, string lastName, string email)
        {
            Tuple<string, string> customerResult = null;
            try
            {
                using (var dtmAPiClient = new DtmApiClient(ApiKey))
                {
                    var response = dtmAPiClient.Post<MagentoCustomerResponse>("Magento", "GetCustomer", new
                    {
                        CampaignCode,
                        OfferCode,
                        Version,
                        OrderId = DtmContext.Order.OrderID,
                        FirstName = firstName,
                        LastName = lastName,
                        Email = email
                    });

                    if (response.IsSuccess)
                    {
                        customerResult = new Tuple<string, string>(response.CustomerId, response.OrderId);
                    }
                    else
                    {
                        SiteExceptionHandler.HandleException(response.Message);
                    }

                }
            }
            catch (WebException webEx)
            {
                SiteExceptionHandler.HandleException(webEx);
            }
            catch (Exception ex)
            {
                SiteExceptionHandler.HandleException(ex);
            }

            return customerResult;
        }

    }
}