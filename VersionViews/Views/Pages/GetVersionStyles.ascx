<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
    var v = String.Format("?v={0}", "C31");
    var preload = ViewData["preload"] as bool? ?? false;
    var version = DtmContext.Version;
    var isPaymentPage = DtmContext.PageCode == "PaymentForm" || DtmContext.PageCode == "ProcessPayment";
    var isFrontPage = DtmContext.Page.IsStartPageType && !isPaymentPage;
    var isIndex = DtmContext.PageCode == "Index";
    var isReviewPage = DtmContext.PageCode == "ReviewPage";
    var isUpsell = DtmContext.Page.PageType.Equals("Upsell", StringComparison.InvariantCultureIgnoreCase) || isReviewPage;
    var isConfirmation = DtmContext.Page.PageType == "Confirmation";
    var isFAQ = DtmContext.PageCode == "FAQ";

    var showPromo = DtmContext.Version == 2;

    if (DtmContext.Version >= 13) {
        Html.RenderPartial("Fonts");
    }

    if (preload)
    {
        var fonts = new List<string>
        {
            "https://use.typekit.net/af/f92a98/00000000000000003b9afb07/27/l?primer=7cdcb44be4a7db8877ffa5c0007b8dd865b3bbc383831fe2ea177f62257a9191&fvd=n6&v=3"
        };

        foreach (var font in fonts)
        {
            %>
            <link rel="preload" href="<%= font %>" as="font" type="font/woff2" crossorigin="">
            <%
        }

        if (isIndex)
        {
            %>
            <link rel="preload" href="/images/logo.svg" as="image">
            <% if (DtmContext.Version == 3) { %>
              <link rel="preload" href="/images/models.png" as="image">
              <link rel="preload" href="/images/models-before.png" as="image">
            <% } else { %>
              <link rel="preload" href="/images/hero-before.jpg" as="image">
              <link rel="preload" href="/images/hero-after.jpg" as="image">
           <% }
        }
    }

    var link = "<link rel='stylesheet' href='{0}.css{1}'>";
    if (preload)
    {
        link = "<link rel='preload' href='{0}.css{1}' as='style'>";
    }

    var stylesheets = new List<string> {
        "https://use.typekit.net/lcm6yxl",
        "/css/1.0000/shell"
    };

    if (isIndex)
    {
        stylesheets.Add("/css/slide/slide");
        stylesheets.Add("/css/slide/slide.thumbnails");
        stylesheets.Add("/css/1.0000/index");
    }
    else if (isPaymentPage)
    {
        stylesheets.Add("/css/1.0000/payment");
    }
    else
    {
        stylesheets.Add("/css/1.0000/page");
    }

    if (isFrontPage) {
        var lightboxStyles = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Stylesheet", string.Empty];

        if (!string.IsNullOrEmpty(lightboxStyles)) {
            stylesheets.Add(lightboxStyles);
        }
    }

    if (!isFrontPage && !isPaymentPage)
    {
        stylesheets.Add("/css/1.0000/confirmation");
    }

    if (isFAQ)
    {
        stylesheets.Add("/css/1.0000/faq");
    }

    foreach (var stylesheet in stylesheets)
    { %>
       <%= String.Format(link, stylesheet, v) %>
    <% }
%>

<% if (preload) { %>
    <link rel="preload" as="script" href="/js/app.js<%= v %>" />
    <link rel="preload" as="script" href="/js/page.js<%= v %>" />
    <link rel="preload" as="script" href="/js/nav.js<%= v %>" />
<% } else { %>
    <script defer src="/js/app.js<%= v %>"></script>
    <script defer src="/js/observer.js<%= v %>"></script>
    <script defer src="/js/lazy.js<%= v %>"></script>
    <script defer src="/js/page.js<%= v %>"></script>
    <script defer src="/js/nav.js<%= v %>"></script>
<% } %>

<%
if (isFrontPage) {
    var lightboxScript = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Script", string.Empty];

    if (!string.IsNullOrEmpty(lightboxScript))
    {
    %>
       <script defer src="<%= lightboxScript %>"></script>
    <%
    }
}
%>


<style>
/* new asterisk for pricing */
.offer__asterisk {
    font-size: 0.5em;
    vertical-align: top;
}
/* added in for the new gender field added to the form */
.c-brand--form__label {
    display: block;
}
.form .c-brand--form__select {
    width: 100%;
}
/* updates to the Terms checkbox */
label[for*=Terms] {
	background: #eeeeee;
}
.dtm label[for*=Terms] p {
    font-size: 0.9em;
}

.dtm__in--mv .l-footer {
    max-width: none;
    padding-bottom: 220px !important;
    width: 100%;
}

.onetrust-privacy > button {
    text-align: left;
}

.dtm .group--social-icons {
    flex-wrap: wrap;
    max-width: 25em;
}

.dtm .group--social-icons > .icon {
    flex: 1 1 50px;
    margin: 1em;
}


@media all and (-ms-high-contrast:none) {
    *::-ms-backdrop, .option { flex-basis: calc(48% - 1rem); }
    *::-ms-backdrop, .nav--alt nav { left: -590px; } /* IE11 */
}

<% if (showPromo) { %>
/* additional class for banner */
@media (max-width: 1200px) {
    .banner--more-text {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .banner--more-text .banner__time {
        min-width: 10em;
    }
    .hero {
        margin-top: 2.6em;
    }
}
<% } %>

/* added in for new promo code field */

.dtm .promo {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}

.promo .c-brand--form__input {
    max-width: 20em;
    margin: 0.5em;
}

.promo input[type=button] {
    max-width: 15em;
    margin: 0.5em;
}

@media (max-width: 600px) {
    .dtm__in--mv .promo {
        flex-direction: column;
    }
}

/* new instafeed css */

#instafeed {
    width: auto;
    max-height: 320px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-basis: 0;
    height: auto;
}
.insta__title {font-family: 'Sofia Pro Regular', sans-serif;}
/*
#instafeed.animated {
    animation-name: smoothSlide;
    animation-duration: 1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-timing-function: linear;
    animation-delay: -4s;
}
#instafeed.animated:hover {
    animation-play-state: paused;
}
*/
#instafeed {
    overflow: scroll;
}
#instafeed img {
    width: auto;
    max-height: 320px;
}

.instafeed__placeholder {
    display: block;
    flex: 1 0 auto;
}

</style>