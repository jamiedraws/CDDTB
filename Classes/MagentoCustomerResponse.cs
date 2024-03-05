using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDT.Classes
{
    public class MagentoCustomerResponse
    {
        public bool IsSuccess { get; set; }

        public string CustomerId { get; set; }

        public string OrderId { get; set; }

        public string Message { get; set; }

    }
}