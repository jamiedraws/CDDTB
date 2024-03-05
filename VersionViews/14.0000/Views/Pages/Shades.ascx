<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    // multi-dimensional array of first the color name, subscription data code, single data code
    string[,] swatches;
    swatches = new string[,] {
        {"black",         "TBLKS"},
        {"dark brown",    "TDBRS"},
        {"medium brown",  "TMBRS"},
        {"light brown",   "TLBRS"},
        {"medium blonde", "TMBLS"},
        {"light blonde",  "TLBLS"},
        {"auburn",        "TAUBS"},
        {"gray",          "TGRYS"},
        {"white",         "TWHTS"}
      };
    // get data if this is a selectable product (single, subscription, or blank)
    var productType = (String)ViewData["productType"] ?? "";
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
  %>
            <% if (productType == "step2Shades") { %>
            <label class="shade shade--label" for="<%= swatches[i, 1] %>">
                <span class="shade__img" data-src-img="/images/colors/<%= swatchSrc %>.jpg" data-tag='{ "img" : [{ "src" : "/images/colors/<%= swatchSrc %>.jpg", "alt" : "<%= swatch %>" }]}'>
                  <noscript>
                    <img src="/images/colors/<%= swatchSrc %>.jpg" alt="<%= swatch %>">
                  </noscript>
                </span>
                <span class="hide" data-code-label=""></span>
                <span class="input">
                    <input data-eflex="draw" type="radio" class="shade__img" id="<%= swatches[i, 1] %>" href="javascript:void(0);" value="<%= swatches[i, 1] %>" name="shadeOption" data-eflex="draw" onclick="assembleProductCode()" />
                </span>                
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