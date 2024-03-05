<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    // multi-dimensional array of first the color name, subscription data code, single data code
    string[,] swatches;
    swatches = new string[,] {
    {"black",         "TBLKS",   "TBLK"},
    {"dark brown",    "TDBRS",   "TDBR"},
    {"medium brown",  "TMBRS",   "TMBR"},
    {"light brown",   "TLBRS",   "TLBR"},
    {"medium blonde", "TMBLS",   "TMBL"},
    {"light blonde",  "TLBLS",   "TLBL"},
    {"auburn",        "TAUBS",   "TAUB"},
    {"gray",          "TGRYS",   "TGRY"},
    {"white",         "TWHTS",   "TWHT"}
  };

    // get data if this is a selectable product (single, subscription, or blank)
    var productType = (String)ViewData["productType"] ?? "";
    var dataCodeMain = "";
    var dataCodeAll = "";
    var dataCodeAlt = "";
    var dataCodeXor = "";
    // this is to choose the column in the array to line up with product codes later
    int column = 0;
    if (productType == "subscription") {
        dataCodeAll = "TBLK,TDBR,TMBR,TLBR,TMBL,TLBL,TGRY,TWHT,TAUB";
        dataCodeAlt = "TBLK,TDBR,TMBR,TLBR,TMBL,TLBL,TGRY,TWHT,TAUB";
        dataCodeXor = "TBLKS,TDBRS,TMBRS,TLBRS,TMBLS,TLBLS,TGRYS,TWHTS,TAUBS";
        column = 1;
    }
    if (productType == "single") {
        dataCodeAll = "TBLK,TDBR,TMBR,TLBR,TMBL,TLBL,TGRY,TWHT,TAUB";
        dataCodeXor = "TBLK,TDBR,TMBR,TLBR,TMBL,TLBL,TGRY,TWHT,TAUB";
        column = 2;
    }
%>

<div class="shades__group">
  <%
      var swatch = "";
      var swatchSrc = "";
      for (int i = 0; i < swatches.GetLength(0); i++) {
          // color name (first part of array)
          swatch = swatches[i, 0];
          // image names will be dashes in place of spaces
          swatchSrc = swatches[i, 0].Replace(" ","-");

          //This section creates the XOR items that need to be removed when item is clicked and joins with other XOR//
          var dataCodeXorList = dataCodeXor.Split(',').ToList();
          var dataCodeToRemove = dataCodeXorList.Where(x => x == swatches[i, column]).FirstOrDefault();
          dataCodeXorList.Remove(dataCodeToRemove);
          var dataCodeXorTemp = string.Join(",", dataCodeXorList);
          var finalDataCodeAll = dataCodeAll + ","+ dataCodeXorTemp;
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  %>
    
    
            <% if (productType == "step2Shades") { %>
            <label class="shade shade--label" for="<%= swatches[i, 2] %>">
                <span class="shade__img" data-src-img="/images/colors/<%= swatchSrc %>.jpg" data-tag='{ "img" : [{ "src" : "/images/colors/<%= swatchSrc %>.jpg", "alt" : "<%= swatch %>" }]}'>
                  <noscript>
                    <img src="/images/colors/<%= swatchSrc %>.jpg" alt="<%= swatch %>">
                  </noscript>
                </span>
                <span class="hide" data-code-label=""></span>
                <span class="input"><input data-eflex="draw" type="radio" class="shade__img" id="<%= swatches[i, 2] %>" href="javascript:void(0);" data-code="<%= swatches[i, 2] %>"  data-code-alt="<%= swatches[i, 1] %>" data-enforce-modifier="true" data-code-modifier="offerOption" data-code-xor="<%= finalDataCodeAll %>" name="shadeOption" data-eflex="draw" /></span>
                <span class="caption"><%= swatch %></span>
            </label>
            <% } else { %>
            <figure class="shade">
                <div class="shade__img" data-src-img="/images/colors/<%= swatchSrc %>.jpg" data-tag='{ "img" : [{ "src" : "/images/colors/<%= swatchSrc %>.jpg", "alt" : "<%= swatch %>" }]}'>
                  <noscript>
                    <img src="/images/colors/<%= swatchSrc %>.jpg" alt="<%= swatch %>">
                  </noscript>
                </div>
                <figcaption> <%= swatch %></figcaption>
            </figure>
            <% } %>



  <% } %>
</div>