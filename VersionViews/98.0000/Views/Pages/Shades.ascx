<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDT.Models" %>
<%
    var swatches = new List<Swatch>
    {
        new Swatch
        {
            Name = "Black",
            Code = "TBLKS"
        },
        new Swatch
        {
            Name = "Dark Brown",
            Code = "TDBRS"
        },
        new Swatch
        {
            Name = "Medium Brown",
            Code = "TMBRS"
        },
        new Swatch
        {
            Name = "Light Brown",
            Code = "TLBRS"
        },
        new Swatch
        {
            Name = "Medium Blonde",
            Code = "TMBLS"
        },
        new Swatch
        {
            Name = "Light Blonde",
            Code = "TLBLS"
        },
        new Swatch
        {
            Name = "Auburn",
            Code = "TAUBS"
        },
        new Swatch
        {
            Name = "Gray",
            Code = "TGRYS"
        },
        new Swatch
        {
            Name = "White",
            Code = "TWHTS"
        },
    };

    var isRadioGroup = ViewData["isRadioGroup"] as bool? ?? false; 

    var classList = "shades";

    if (isRadioGroup)
    {
        classList = string.Format("{0} shades--radiogroup", classList);
    }
%>

<div class="<%= classList %>">
    <div class="shades__group">
    <%
        var pictureTemplate = @"
        <picture data-src-img=""/images/colors/15.0000/{0}.png"">
            <img src=""/shared/images/blank.png"" width=""142"" height=""140"" alt=""{1}"">
        </picture>";

        var radioTemplate = @"
        <label for=""{0}"" class=""form form--checkbox-label-stack shades__picture-checkbox"">
            <span class=""form__checkbox-label"">
                {1}
                <input 
                    type=""radio"" 
                    name=""shadeOption"" 
                    onclick=""assembleProductCode()"" 
                    aria-labelledby=""{0}Label""
                    value=""{0}""
                    id=""{0}"">
                <span class=""form__label"">
                    <span class=""form__checkbox""></span>
                </span>
                <span id=""{0}Label"">{2}</span>
            </span>
        </label>";

        foreach (var swatch in swatches)
        {
            var imageSrc = swatch.Name.Replace(" ", "-").ToLower();
            var template = string.Format(pictureTemplate, imageSrc, swatch.Name);

            if (isRadioGroup)
            {
                template = string.Format(radioTemplate, swatch.Code, template, swatch.Name);
            }

            Response.Write(template);
        }
    %>
    </div>
</div>