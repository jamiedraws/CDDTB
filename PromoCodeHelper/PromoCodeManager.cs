using Dtm.Framework.ClientSites;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Services.DtmApi;
using System;

namespace CDDT.PromoCodeHelper
{
    public class PromoCodeManager
    {
        private readonly DtmApiClient _client = new DtmApiClient();
        private readonly string apiUrl = SettingsManager.ContextSettings["Dtm.Api.Url"];

        public int GetPromoAppliedAmount(string promoCode, string campaignCode)
        {
            return MakeSequenceNumberRequest("GetNumber", string.Format("{0}_{1}", campaignCode, promoCode));
        }

        public void IncrementPromoAppliedAmount(string promoCode, string campaignCode)
        {
            MakeSequenceNumberRequest("IncrementNumber", string.Format("{0}_{1}", campaignCode, promoCode));
        }

        private int MakeSequenceNumberRequest(string action, string sequenceCode)
        {
            int sequenceNumberValue = 0;
            var endpoint = string.Format("{0}workers.dtm/?worker={1}&action={2}", apiUrl, "SequenceNumberManager", action);
            try
            {
                var response = _client.PostData(endpoint, new { SequenceNumberCode = sequenceCode });
                if (response.StatusCode == System.Net.HttpStatusCode.InternalServerError)
                    return 0;

                int.TryParse(response.Content, out sequenceNumberValue);
                
            }
            catch(Exception ex)
            {
                SiteExceptionHandler.HandleException(ex);
            }
            return sequenceNumberValue;
        }
    }
}