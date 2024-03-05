<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dtm.Framework.Base.Models.BaseClientViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<% long timestamp = DateTime.Now.Ticks; %>
<%
    // jQuery Eflex Slider
    var enablejQueryEflexSlider = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider", false];
    var jQueryEflexSliderSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Selector", SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Selector", ".js-eflex--fade"]];
    var jQueryEflexSliderType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.SliderType", "fade"];
    var jQueryEflexSliderAnimationType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.AnimationType", "jQuery"];
    var jQueryEflexSliderNav = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Nav", true];
    var jQueryEflexSliderNavSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.NavSelector", ".js-eflex--fade__nav"];
    var jQueryEflexSliderNavType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.NavType", "button"];
    var jQueryEflexSliderPaginate = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Paginate", false];
    var jQueryEflexSliderPaginateSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.PaginateSelector", ".js-eflex--fade__paginav"];
    var jQueryEflexSliderPaginateType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.PaginateType", "li"];
    var jQueryEflexSliderHtmlWrapper = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.HtmlWrapper", "div"];
    var jQueryEflexSliderCSSWrapper = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.CSSWrapper", "js-eflex--wrapper"];
    var jQueryEflexSliderDuration = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Duration", 300];
    var jQueryEflexSliderDelay = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Delay", 3000];
    var jQueryEflexSliderEasing = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Easing", "linear"];
    var jQueryEflexSliderEventType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.EventType", "click"];
    var jQueryEflexSliderOnInit = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.OnInit", null];
    var jQueryEflexSliderOnBefore = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.OnBefore", null];
    var jQueryEflexSliderOnAfter = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.OnAfter", null];
    var jQueryEflexSliderAuto = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Auto", true];
    var jQueryEflexSliderAxis = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Axis", "horizontal"];
    var jQueryEflexSliderDirection = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Direction", "left"];
    var jQueryEflexSliderSwipe = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Swipe", false];
    var jQueryEflexSliderCSSMediaQueries = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.CSSMediaQueries", false];
    var jQueryEflexSliderAwait = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Slider.Await", null];

    // jQuery Eflex Scale
    var jQueryEflexScale = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Scale", true];
    var jQueryEflexScaleSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Scale.Selector", "video"];

    // jQuery Eflex Scroll
    var jQueryEflexScroll = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Scroll", true];
    var jQueryEflexScrollSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Scroll.Selector", "a[href^=\"#\"]"];

    // jQuery Eflex Stretch
    var jQueryEflexStretch = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Stretch", true];
    var jQueryEflexStretchSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Stretch.Selector", ".l-footer"];

    // jQuery Eflex Group
    var jQueryEflexGroup = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Group", false];
    var jQueryEflexGroupSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Group.Selector", ".c-brand--form--seminar"];

    // jQuery Eflex Swap
    var jQueryEflexSwap = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap", false];
    var jQueryEflexSwapSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Selector", ".c-brand--form--seminar > .c-brand--form__item"];
    var jQueryEflexSwapStartEffect = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.StartEffect", "slideDown"];
    var jQueryEflexSwapEndEffect = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.EndEffect", "slideUp"];
    var jQueryEflexSwapDuration = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Duration", 400];
    var jQueryEflexSwapEasing = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Easing", "linear"];
    var jQueryEflexSwapEventType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.EventType", "click"];
    var jQueryEflexSwapOnAfter = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.OnAfter", null];
    var jQueryEflexSwapClasses = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Classes", "is-selected"];
    var jQueryEflexSwapIsVisible = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.IsVisible", false];
    var jQueryEflexSwapFreeze = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Freeze", false];

    // jQuery Eflex Swap | Collapse Extension
    var jQueryEflexSwapCollapse = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse", false];
    var jQueryEflexSwapCollapseSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.Selector", ".c-brand--form--seminar__event"];
    var jQueryEflexSwapCollapseContinueLink = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.ContinueLink", ".c-brand--form--seminar__continue"];
    var jQueryEflexSwapCollapseBackLink = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.BackLink", ".c-brand--form--seminar__goback"];
    var jQueryEflexSwapCollapseContainer = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.ContainerSelector", ".c-brand--form--seminar > .c-brand--form__item"];
    var jQueryEflexSwapCollapseActiveClasses = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.ActiveClasses", "animate-and-fade-in"];
    var jQueryEflexSwapCollapseInactiveClasses = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Swap.Collapse.InactiveClasses", "animate-and-fade-out"];

    // jQuery Eflex Play
    var jQueryEflexPlay = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Enable", false];
    var jQueryEflexPlaySelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Selector", "#video-video1199"];
    var jQueryEflexPlaySource = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.Source", "null"];
    var jQueryEflexPlayPaginateSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Play.PaginateSelector", "#playlist"];

    // jQuery Eflex Link
    var jQueryEflexLink = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.Enable", false];
    var jQueryEflexLinkSelector = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.Selector", ".cart-button"];
    var jQueryEflexLinkText = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.Text", "Changed"];
    var jQueryEflexLinkClasses = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.Classes", "confirm-button"];
    var jQueryEflexLinkToggle = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.Toggle", true];
    var jQueryEflexLinkDisableAfter = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.DisableAfter", 0];
    var jQueryEflexLinkPreserveContent = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.PreserveContent", false];
    var jQueryEflexLinkSwapClasses = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.SwapClasses", true];
    var jQueryEflexLinkEventType = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.EventType", "click"];
    var jQueryEflexLinkOnInit = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.OnInit", null];
    var jQueryEflexLinkOnBefore = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.OnBefore", null];
    var jQueryEflexLinkOnAfter = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.OnAfter", null];
    var jQueryEflexLinkSyncShoppingCart = SettingsManager.ContextSettings["FrameworkJS/CSS.Eflex.Link.SyncShoppingCart", false];

    // Dtm Style
    var usingDtmStyle = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Enable", SettingsManager.ContextSettings["FrameworkJS/CSS.EnableDtmStyle", false]];
    var usingDtmStyleUpgradeForm = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.UpgradeForm", true];
    var usingDtmStyleRevertOFRT = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.RevertOrderFormReviewTable", false];
    var usingIncognitoMode = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.IncognitoMode", false];
    var enableSingleVideoPlayback = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.SingleVideoPlayback", false];
    var enableHideUpsellImgOnMobile = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.HideUpsellImgOnMobile", true];
    var autoMoveRequiredDisclaimer = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.RequiredFieldDisclaimer", true];
    var supportNumericKeyboard = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.SupportNumericKeyboard", true];
    var supportEmailKeyboard = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.SupportEmailKeyboard", true];
    var showOrderFormOnMobile = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.ShowOrderFormOnMobile", false];
    var togglePagesOnMobile = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.TogglePagesOnMobile", true];
    var addViewFullSite = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.AddViewFullSite", false];
    var hideViewFullSite = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.HideViewFullSite", false];

    // Lightbox : Dtm Style
    var lightboxScript = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Script", string.Empty];
    var lightboxStylesheet = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Stylesheet", string.Empty];

    // Form Title : Dtm Style
    var enableFormTitle = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.FormTitle.Enable", false];

    // Order
    var EnableOrderForm = SettingsManager.ContextSettings["Order.EnableOrderform", true];

    // Email Opt In
    var enableEmailOptIn = SettingsManager.ContextSettings["EmailOptIn.Enabled", false];
    var defaultCheckedEmailOptIn = SettingsManager.ContextSettings["EmailOptIn.CheckboxDefaultChecked", false] || (ViewData["EmailOptIn"] as string ?? "false").ToLower().Contains("true");
    var emailOptInHtml = SettingsManager.ContextSettings["EmailOptIn.CheckboxHtml", ""];

    // Secure Checkout
    var enableSecureCheckout = SettingsManager.ContextSettings["FrameworkJS/CSS.SecureCheckout.Enable", false];
    var hideSecureCheckoutCloud = SettingsManager.ContextSettings["FrameworkJS/CSS.SecureCheckout.HideCloudDomain", false] && DtmContext.IsProxyIpAddress;

    // MailCheck
    var enableMailCheck = SettingsManager.ContextSettings["FrameworkJS/CSS.MailCheck.Enable", false];

    // Question Groups
    var enableQuestionGroups = SettingsManager.ContextSettings["Questions.Enable", false];

    
    // Responsive Mode
    var enableResponsiveMode = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.ResponsiveMode", false];

    // Cookie Consent
    var enableCookieConsent = SettingsManager.ContextSettings["CookieConsent.Enable", false];
    var cookieConsentCountryCodes = SettingsManager.ContextSettings["CookieConsent.CountryCodes", string.Empty];

    if (enableCookieConsent && !string.IsNullOrEmpty(cookieConsentCountryCodes) && cookieConsentCountryCodes.Split(',').Any())
    {
        var cookieName = "_gip_c";
        var cookie = Request.Cookies[cookieName];
        var countryCode = cookie != null && !string.IsNullOrWhiteSpace(cookie.Value)
            ? cookie.Value
            : null;
        if (string.IsNullOrWhiteSpace(countryCode))
        {
            GeoIpRepository geoRepo = new GeoIpRepository();
            var ctry = geoRepo.GetCountry(DtmContext.HostAddress);
            countryCode = ctry.CountryCode;
            Response.Cookies.Add(new HttpCookie(cookieName, countryCode)
            {
                Expires = DateTime.Now.AddMinutes(Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Cookie.GeoIPExpirationInMinutes", 10080]),
                HttpOnly = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Cookie.SetHttpOnly", false],
                Secure = Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Cookie.SetSecure", false],
                Domain = HttpContext.Current.Request.Url.DnsSafeHost.Replace("www.", "."),
                Path = "/"
            });
        }
        var countryCodes = cookieConsentCountryCodes.Split(',').Select(x => x.Trim());
        enableCookieConsent = (string.IsNullOrWhiteSpace(countryCode) || countryCodes.Contains(countryCode));
    }

    //InsureShip
    var enableInsureShip = SettingsManager.ContextSettings["DTM.ClientSites.InsureShip.Enabled", false];

    //MobileOptIn
    var enableMobileOptIn = SettingsManager.ContextSettings["MobileOptIn.Enabled", false];
    var defaultCheckedMobileOptIn = SettingsManager.ContextSettings["MobileOptIn.CheckboxDefaultChecked", false] || (ViewData["MobileOptIn"] as string ?? "false").ToLower().Contains("true");
    var mobileOptInHtml = SettingsManager.ContextSettings["MobileOptIn.CheckboxHtml", "By submitting my contact info, I consent to receive marketing messages, updates, offers, and notifications as recurring text messages sent automatically to my mobile phone; agree to the terms, conditions & privacy policy posted at TextRules.US; and understand that my mobile carrier&apos;s standard message and data rates may apply. I also understand that I can order without text notifications simply by Unchecking the box above and can unsubscribe from text notifications anytime simply by replying STOP."];

    //Title Field
    var enableTitle = SettingsManager.ContextSettings["Title.Enable", false];
    var titleOptions = SettingsManager.ContextSettings["Title.Options", "Mr.,Mrs.,Ms."];
    var titleDefaultText = SettingsManager.ContextSettings["Title.DefaultText", "Choose a Title"];
    var titleLabelText = SettingsManager.ContextSettings["Title.LabelText", "Title:"];

    var navPartnerSelectors = SettingsManager.ContextSettings["TBD", "[data-test-id=\"ChatWidgetButton\"], [data-test-id=\"ChatWidgetMobileButton\"]"];

    //SurchX
    var enableSurchx = SettingsManager.ContextSettings["SurchX.Enable", false] && SettingsManager.ContextSettings["OrderFormReview.ShowReviewTable", false];
    var surchxApiToken = SettingsManager.ContextSettings["SurchX.ApiToken", string.Empty];
    var surchxCampaign = SettingsManager.ContextSettings["SurchX.Campaign", DtmContext.CampaignCode];
    var surchxFeeText = SettingsManager.ContextSettings["SurchX.DisplayFeeText", "Transaction Fee of ${fee} will be applied"];


%>

<script src="/shared/js/jquery.eflex.fw.js"></script>

<%
    if (enableMailCheck)
    {%>
<link rel="stylesheet" href="/shared/css/mailcheck/mailcheck.css">
<script src="/shared/js/mailcheck.min.js"></script>
<%}
%>
<%if (enableQuestionGroups)
    { %>
<script src="/shared/js/mustache.js"></script>

<%
    var questionLayoutId = SettingsManager.ContextSettings["Questions.LayoutId", -1];
    if (questionLayoutId == 9)
    {%>
    
        <%Html.RenderPartial("ClassActionMustacheTemplates");%>

    <%}
    else
    {%>
        <%= DtmContext.Layouts
               .Where(l => l.Id == SettingsManager.ContextSettings["Questions.LayoutId", -1])
               .Select(l => l.Html)
               .FirstOrDefault() %>
    <%}%>

<%} %>
<%if (enableCookieConsent)
    { %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.js"></script>
<%} %>

<script id="DTMFWJS" >

    if (!Model) {
        // check if responsive mode is enabled and convert string to boolean
        switch ('<%= enableResponsiveMode %>') {
            case 'True': case true: var inResponsiveMode = true; break;
            case 'False': case false: var inResponsiveMode = false; break;
        }

        // if responsive mode, model is mobile
        var Model = {

            IsMobile: inResponsiveMode ? true : "<%= Model.IsMobile %>"

        };
    }

    if (!DtmContext) {
        var DtmContext = {

            Page: {

                IsStartPageType: "<%= DtmContext.Page.IsStartPageType %>",

                PageType: "<%= DtmContext.Page.PageType %>"

            },

            OfferCode: "<%= DtmContext.OfferCode %>",

            Version: "<%= DtmContext.Version %>",

            PageCode: "<%= DtmContext.PageCode %>",

            Campaign: {

                CampaignName: "<%= DtmContext.Campaign.CampaignName %>"

            }

        };
    }
	/* @Config
	* --------------------------------------------------------------------- */
    // add support for custom jQuery select 
    // ex: $("element").is(":inviewport");
    $.extend($.expr[":"], {
        inviewport: function (element) {
            let result = false;
            const coords = element.getBoundingClientRect();

            if (coords.x <= window.innerWidth
                && coords.y <= window.innerHeight
                && coords.x >= 0 && coords.y >= 0) {
                result = true;
            };

            return result;
        }
    });

    // get eFlex object
    var eflex = $.eflex();
    // get mastermind object
    var master = $.eflex('mastermind');
    // turn on live mode
    $.eflex('live');
    // set DTM object
    var _dtm = {};
    // set eFlex object
    var _eflex = {};

    // set this property to detect the use of framework JS
    _dtm.useFramework = true;

    // set shopping cart object
    _dtm.ShoppingCart = { items: {} };


	/* @Data Type Conversions
	* --------------------------------------------------------------------- */
    // convert string to boolean data type
    Model.IsMobile = master.calc('parseBoolean', { string: Model.IsMobile }).func;


	/* @Path Observer
	* --------------------------------------------------------------------- */
    // checks if a url exists
    _dtm.ifExists = function (url, args) {
        args = args || {};
        args.researchByExtension = args.researchByExtension || undefined;
        args.success = args.success || undefined;

        // set new HTTP request
        var http = new XMLHttpRequest();
        // pass url into the head
        try {
            http.open('HEAD', url, false);
            http.send();
        } catch (e) {
            console.log(e.message);
        }

        // if we want to research when the initial search fails
        if (http.status === 404 && typeof (args.researchByExtension) === 'object') {
            // get length of extensions
            var len = args.researchByExtension.length;
            // filter through all extension types
            $.each(args.researchByExtension, function (index, ext) {
                // replace url former extension with new extension
                url = url.substr(0, url.lastIndexOf('.')) + ext;
                // halt on researching once we reach the last iteration
                args.researchByExtension = index === len - 1 ? args.researchByExtension : false;
                // check if file name with new extension exists
                _dtm.ifExists(url, args);
            });

            // if we want to pass back the returned url when search is successful
        } else if (http.status === 200 && typeof (args.success) === 'function') {
            args.success(url);

            // return status
        } else {
            return http.status != 404;
        }
    };


	/* @Native Modifiers
	* --------------------------------------------------------------------- */
    // store og alert method
    window.nativeAlert = window.alert;

    // set vse alert method
    _dtm.alert = function (data, target, cb) {
        // set callback function
        var cb = cb || function () { };
        // set fragment
        var frag = document.createDocumentFragment();
        // set validation summary error container
        var vse = document.createElement('div');
        // add classes to vse
        vse.className = 'validation-summary-errors o-box--msg-error';

        // set unordered list
        var ul = document.createElement('ul');
        // convert string into array based on line breaks
        var a = data.split('\n');

        // iterate each item
        for (var i = 0; i < a.length; i++) {
            // check if item is blank
            if (a[i] === '') {
                // remove it from array
                a.splice(i, 1);
            } else {
                // create html tags
                var node = i === 0 ? document.createElement('span') : document.createElement('li');
                // replace tabs
                node.innerHTML = a[i].replace(/\t/g, '');
                // check if item is required field
                if (i !== 0) {
                    // add node to the ul
                    ul.appendChild(node);
                    // otherwise,
                } else {
                    // add node to the fragment
                    vse.appendChild(node);
                }
            }
        }
        // add unordered list to the fragment
        vse.appendChild(ul);
        frag.appendChild(vse);

        // set array for potential error targets
        var e_target = target || [
            $('#vse'),
            $('form').find('span[style="color: #FF0000; font-weight: bold"]'),
            $('form').find('span[style="color: rgb(255, 0, 0); font-weight: bold;"]'),
            $('.vse')
        ];

        // check if error target is an array
        if ($.isArray(e_target)) {
            // set error counter
            var e_count = 0;

            // cycle each target
            $.each(e_target, function (index, value) {
                // check if element exists
                if (value.length > 0) {
                    // insert frag into element
                    value.html(vse);
                    e_target = value;
                } else {
                    // otherwise, add this to error counter
                    e_count++;
                }
            });

            // check if array length matches number of errors - means basically none of the above options exist
            if (e_target.length === e_count) {
                // prepend the frag to the form
                $('form').prepend(frag);
            }
        } else {
            // insert the frag into custom target
            e_target.html(frag);
        }

        // check if scroll override exists
        if (e_target.data('vse-scroll') === undefined) {
            // scroll to vse
            $.scrollTo('.validation-summary-errors');
        }

        $('[data-vse-button]').removeClass('hide');

        //Saving error message to pixelService
        var errors = {};

        for (var i = 0; i < a.length; i++) {

            var message = a[i].replace('\t', '');

            errors["Error " + i] = message;

        }

        $.post('/shared/services/pixelservice.ashx?at=error', errors);

        if (typeof errorsObj !== "undefined" && (typeof _AdaErrors != "undefined" && _AdaErrors))
        {
            triggerEvent('handleErrorValidationMapping', errorsObj);           
        }


        return cb(data, e_target);

    };

    // redefine new alert method
    window.alert = function (data) {
        // check if returned data contains validation from common.js
        var validationHeaders = 'Please correct the following issues|Corrija los siguientes problemas|Veuillez corriger les probl�mes suivants';
        var result = (data && typeof (data) == "string" && data.match(validationHeaders)) || '';

        switch (result.length > 0) {
            case true:
                _dtm.alert(data, null, function (data, target) {
                    try {
                        _dtm.callbackAlert(data, target);
                    } catch (e) {
                        console.log(e.message);
                    }
                });
                break;
            case false:
                window.nativeAlert(data);
                break;
        }
    };

    // streamline custom validation with common.js
    _dtm.includeValidation = function (data, target) {
        var vse = $('.validation-summary-errors ul');
        if (vse.length !== 1) {
            vse.prepend($('<li class="error_msg">' + data + '</li>'));
        } else {
            target.fadeSlideDown();
        }
    };

	<%
    if (enableSecureCheckout && !hideSecureCheckoutCloud)
    {
        Html.RenderPartial("SecureCheckout");
    }

    if (enableMailCheck)
    {
        Html.RenderPartial("MailCheck");
    }

    if (enableFormTitle)
    {
        Html.RenderPartial("SetFormTitleJS");
    }

    if (enableQuestionGroups)
    {
        Html.RenderPartial("QuestionGroupsJS");
    }

    if (enableCookieConsent)
    {
        Html.RenderPartial("CookieConsentJS");
    }
    %>



    // Disables / hides order links
    _dtm.disableOrderLinks = function () {

        // get subpage text nav list
        $('.subpage-text-nav').contents().filter(function () {
            // filter by keyword
            var filter = $(this).text().match(/order/i) || '';
            // iterate each node and check if it contains the keyword
            if (filter.length > 0) {
                // hide element
                $(this).hide();
                // check if next sibling is a text node
                if (this.nextSibling.nodeType === 3) {
                    // remove the unnecessary text node
                    this.nextSibling.data = this.nextSibling.data.slice(0, -1);
                }
            }
        });

    };

    // Move Method
    _dtm.move = function (attr) {
        // get jQuery method from data attribute
        var data = attr.selector;
        // check if selector contains brackets
        var dataAttr = (data.match(/\[([^\]]+)]/g)) || '';

        // check if selector is blank
        if (dataAttr.length === 0) {
            $.each(attr.get(0).attributes, function (k, v) {
                if (v.nodeName.match(/prepend/g) || v.nodeName.match(/append/g)) {
                    data = v.nodeName;
                }
            });
        }

        // strip out brackets and data prefix
        data = data.replace(/[\[\]']+/g, '');
        data = data.substr(data.indexOf('-') + 1);

        // get target selector
        var target = attr.data(data);

        // check if using append or prepend
        if (data.match(/append/g)) {
            attr.appendTo($(target));
        } else if (data.match(/prepend/g)) {
            attr.prependTo($(target));
        }

    };

    // sets a scroll listener to watch for when the window approaches an element
    _dtm.scrollAlert = function (args) {
        args = args || {};
        // set target element
        var $target = args.$target || $('[data-scroll-alert]');
        // set data attribute
        var data = args.data || 'scroll-alert';
        // set classes
        var classes = args.classes || 'in-range';

        // check if alert mode is enabled
        if ($target.data(data) === true) {
            $(window).scroll(function () {
                // check if scroll position is within range of the toggle button
                if (($(window).scrollTop() + ($(window).height() / 1.3)) > $target.offset().top) {
                    $target.addClass(classes);
                } else {
                    $target.removeClass(classes);
                }
            });
        }
    };

	/* @Automated Steps Generator
	* --------------------------------------------------------------------- */
    // dynamically assigns step numbering on the order form
    _dtm.automateSteps = function (options) {
        var options = options || {};
        // get setting for step header from International CM
        var text = options.text || '<%= SettingsManager.ContextSettings["OrderFormReview.StepHeaderText"] %>';
        // check if string contains only white spaces or tabs
        var isWhiteSpace = function (str) {
            return str.replace(/\s/g, "").length === 0;
        };

        // check if text contains a string and contains characters
        if (typeof text === "string" && text.length > 0 && !isWhiteSpace(text)) {
            // get visiblity state for the OFRT step
            <% if (SettingsManager.ContextSettings["OrderFormReview.ShowReviewTable", false])
    { %>
            var showReviewTable = true;
            <% }
    else
    { %>
            var showReviewTable = false;
            <% } %>

            // get regex pattern
            var regex = options.regex || /([a-zA-Z]*)(?=\s|:)/i;
            // get element to search by
            var $form = options.$form || $("#form");
            // get step text by regex match
            var matches = text.match(regex);

            // check if any matches are found
            if (matches !== null) {
                // get the first match found
                var step = matches[0];

                // make sure first match is not a white space
                if (!isWhiteSpace(step)) {
                    var stepRegex = new RegExp(step, "i");
                    // store matches from the document 
                    var nodes = [];
                    // filter element and collect all matches
                    $form.find("strong, b").filter(function (index, node) {
                        var hasMatch = node.innerText.match(stepRegex);

                        if (hasMatch !== null) {
                            nodes.push(node);
                        }
                    });
                    // set y increment to add each step number 
                    var y = 1;
                    // iterate all matches and replace the current number with ascending order
                    nodes.forEach(function (node) {
                        // assign the matching step element from the DOM into a variable 
                        var $step = $(node);
                        // check if step is within reviewOrder
                        var isReviewTable = $step.closest("#reviewOrder").length;
                        // check if reviewOrder is visible or if the step is not within reviewOrder
                        if (isReviewTable && showReviewTable || !isReviewTable) {
                            $step.text($step.text().replace(/\d+/, y));
                            y++;
                        }
                    });
                }
            } else {
                console.warn("_dtm.automateSteps: There were no matches found for the given text.");
            }
        } else {
            console.warn("_dtm.automateSteps: Cannot process text either because it is not a string or it is an empty string.");
        }
    }

    // creates a stylized toggle button
    _dtm.getLanguageToggle = function (data) {

        // set entity decoder
        var decodeHtmlEntity = function (str) {
            return str.replace(/&#(\d+);/g, function (match, dec) {
                return String.fromCharCode(dec);
            });
        };

        data = data || {};
        // check if data object is not empty
        if (!$.isEmptyObject(data)) {
            // set up button template
            data.class = 'icon-' + data.flag || data.id;

            // set up button template
            var html = '<div class="row-to-center center-margin">';
            html += '<div class="col language__flag right-padding"><span class="' + data.class + '"></span></div>';
            html += '<div class="col left-padding"><span class="language__txt">' + data.text + '</span></div>';
            html += '</div>';
            // get button
            var $btn = $(html);
            // get text
            var text = $btn.find('.language__txt').text();

            // set data array to test for the cta pattern
            $.each([
                { cta: 'cliquez ici!' },
                { cta: 'cliquez ici' },
                { cta: 'haga click aqu&#237;!' },
                { cta: 'haga click aqu&#237;' },
                { cta: 'click here!' },
                { cta: 'click here' },
            ], function (key, val) {
                // test for pattern match
                var cta = (text.match(new RegExp(decodeHtmlEntity(val.cta), 'i'))) || '';
                // check if match was found
                if (cta.length > 0) {
                    // wrap the cta in and style
                    $btn.html($btn.html().replace(cta[0], '<span class="language__cta">' + cta[0] + '</span>'));
                    return false;
                }
            });

            // apply each of the SVG paths to the button
            for (var i = 1; i <= data.SVGPathCount; i++) {
                $('<span class="path' + i + '"></span>').appendTo($btn.find('.' + data.class));
            }

            // search for the data lan toggle
            $('[data-lan-toggle="' + data.id + '"]').html($btn).attr('href', data.link)
                .addClass('animate language-button language-button--' + data.id);
        }

    };

    // retrieves label snippets and initailizes the language toggles
    _dtm.setLanguageToggles = function () {

        var setResponsive = function ($this) {
            // check if vertical mode is enabled
            if ($this.data('lan-theme') === 'vertical' && $this.data('lan-responsive') !== undefined) {
                // get switch width
                var _w = $this.data('lan-switch-at');
                if (typeof (_w) === 'undefined') {
                    // get container
                    var $container = $('#content_top').length > 0 ? $('#content_top') : $('#formWrap');
                    _w = $container.outerWidth(true);
                }

                // check if responsive header mode is enabled
                if ($this.data('lan-responsive') === 'header') {
                    var $anchor, method,
                        uid = Math.random(),
                        updateToggle = function () {
                            // check if window width is less than wrapper
                            if ($(window).width() < _w) {
                                $this.attr('data-lan-theme', 'default')
                                    .addClass('is-device').prependTo($('body'));
                            } else {
                                $this.attr('data-lan-theme', 'vertical')
                                    .removeClass('is-device')[method]($anchor);
                            }
                        };

                    // search for either previous or next sibling
                    switch (true) {
                        case $this.next().length > 0:
                            $anchor = $this.next();
                            method = 'insertBefore';
                            break;
                        case $this.prev().length > 0:
                            $anchor = $this.prev();
                            method = 'insertAfter';
                            break;
                    }

                    // set anchor position
                    $anchor.attr('data-lan-anchor', uid);

                    // otherwise, check if responsive form mode is enabled
                } else if ($this.data('lan-responsive') === 'form') {
                    var updateToggle = function () {
                        // check if window width is less than wrapper
                        if ($(window).width() < $container.outerWidth(true)) {
                            $this.addClass('is-device');
                        } else {
                            $this.removeClass('is-device');
                        }
                    };
                }

                updateToggle();
                $(window).resize(function () { updateToggle(); });
            }
        };

        $.each([
            {
                id: 'us',
                text: '<%= LabelsManager.Labels["LanguageTextForUS"] ?? SettingsManager.ContextSettings["Language.LanguageTextForUS"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForUS"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForUS"] %>',
                SVGPathCount: 5
            },
            {
                id: 'ca',
                text: '<%= LabelsManager.Labels["LanguageTextForCA"] ?? SettingsManager.ContextSettings["Language.LanguageTextForCA"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForCA"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForCA"] %>',
                SVGPathCount: 2
            },
            {
                id: 'fr',
                flag: 'ca',
                text: '<%= LabelsManager.Labels["LanguageTextForFR"] ?? SettingsManager.ContextSettings["Language.LanguageTextForFR"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForFR"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForFR"] %>',
                SVGPathCount: 2
            },
            {
                id: 'es',
                text: '<%= LabelsManager.Labels["LanguageTextForES"] ?? SettingsManager.ContextSettings["Language.LanguageTextForES"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForES"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForES"] %>',
                SVGPathCount: 15
            },
            {
                id: 'au',
                text: '<%= LabelsManager.Labels["LanguageTextForAU"] ?? SettingsManager.ContextSettings["Language.LanguageTextForAU"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForAU"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForAU"] %>',
                SVGPathCount: 5
            },
            {
                id: 'uk',
                text: '<%= LabelsManager.Labels["LanguageTextForUK"] ?? SettingsManager.ContextSettings["Language.LanguageTextForUK"] %>',
                link: '<%= LabelsManager.Labels["LanguageLinkForUK"] ?? SettingsManager.ContextSettings["Language.LanguageLinkForUK"] %>',
                SVGPathCount: 4
            }
        ], function (key, val) {
            // check if the language text & language link fields aren't empty
            if (val.text.length > 0 && val.link.length > 0) {
                _dtm.getLanguageToggle({
                    id: val.id,
                    flag: val.flag || val.id,
                    text: val.text,
                    link: val.link,
                    SVGPathCount: val.SVGPathCount
                });
            }
        });

        // get all toggle buttons
        $('[data-lan-toggle]').each(function () {
            var $this = $(this);

            // enable append / prepend mode
            _dtm.move($this);

            // set responsive mode
            setResponsive($this);

            // set alert mode
            _dtm.scrollAlert({ $target: $this, data: 'lan-alert', classes: 'in-range' });
        });
    };

    _dtm.setLanguageToggles();

    // restyle for express checkout feature
    _dtm.expressCheckout = function (args) {
        // set args
        args = args || {};

        /* Public Variables */
        // set option default
        args.option = args.option || $('.checkout-option');
        // set target default
        args.target = args.target || args.option.find('label');
        // set input default
        args.input = args.input || args.option.find('input');

        // set submit default
        args.submit = args.submit || $('#AcceptOfferButton');
        // set disclaimer default
        args.disclaimer = args.disclaimer || $('.c-brand--form__submission');
        // set payment type attribute
        args.getPaymentTypeBy = args.getPaymentTypeBy || 'id';
        // use jQuery Eflex Draw
        args.jQueryEflexDraw = args.jQueryEflexDraw || {};
        args.jQueryEflexDraw.enable = args.jQueryEflexDraw.enable !== undefined ? args.jQueryEflexDraw.enable : args.jQueryEflexDraw.enable || true;
        args.jQueryEflexDraw.icon = args.jQueryEflexDraw.icon || 'radio-checkbox';
        // set classes default
        args.classes = args.classes || {
            card: 'checkout-theme-base',
            paypal: 'checkout-theme-base',
            amazon: 'checkout-theme-base'
        };

        // set up dynamic PayPal button
        args.addPayPalButton = args.addPayPalButton !== undefined ? args.addPayPalButton : true;
        // set up dynamic Venmo button
        args.addVenmoButton = args.addVenmoButton !== undefined ? args.addVenmoButton : false;

		<% /* Check if Braintree is enabled */ %>
        <% var enabledProcessorCodes = SettingsManager.ContextSettings["ExpressCheckout.EnabledProcessorCodes", String.Empty]; %>
        <% if (enabledProcessorCodes.Contains("Braintree"))
    { %>
        /**
         * @param {Boolean} addPayPalButton - enables/disables dynamic paypal button to generate on the site
         * */
        args.addPayPalButton = false;
        /**
         * @param {Object} submit - assign the submit button
         * */
        args.submit = $('#braintreeSubmit');
		<% } %>

        /* Private Variables */
        // set was submit default
        var wasSubmit = false;
        var olabel = (function () {
            if (args.submit.is('button')) {
                return args.submit.text();
            } else {
                return args.submit.val();
            }
        })();
        // get original classes
        var oclasses = args.submit.attr('class');
        // create a new payment button
        var makeButton = function (PaymentType, ImageUrl) {
            try {
                return $('<input/>', {
                    type: 'image',
                    style: 'display: block',
                    class: 'block is-' + PaymentType + ' is-express-checkout-image AcceptOfferButton u-mar--center',
                    src: ImageUrl,
                    id: 'id_' + PaymentType
                });
            } catch (e) {
                return e.message;
            }
        };

        // check if we're creating a PayPal button
        if (args.addPayPalButton) {
            var $img__paypal = makeButton('PayPal', function () {
                return $.grep(_expressCheckoutEngine.Items, function (n, i) {
                    return n.type.match(/PayPal/i);
                })[0].downImageUrl;
            });
        }

        // check if we're creating a Venmo button
        if (args.addVenmoButton) {
            var $img__venmo = makeButton('Venmo', function () {
                return $.grep(_expressCheckoutEngine.Items, function (n, i) {
                    return n.type.match(/Venmo/i);
                })[0].downImageUrl;
            });
        }

        /* Hide disclaimer text by default */
        args.disclaimer.hide();

        if (typeof (args.classes) === 'object') {
            // classes were passed as an object
            args.option.each(function (k, v) {
                // get current payment type
                var paymentType = $(v).attr(args.getPaymentTypeBy);
                // iterate each of the classes
                $.each(args.classes, function (x, y) {
                    // check if class key matches payment type
                    if (paymentType.match(new RegExp(x, 'i'))) {
                        // add correct class
                        $(v).addClass(y);
                    }
                });
            });
        } else {
            // classes were passed as a string
            args.classes = args.classes || 'checkout-theme-base';
            // wrap in label tag and apply styling
            args.option.addClass(args.classes);
        }

        // move each input tag into it's label tag
        args.input.each(function (index, value) {
            // trigger eflex draw
            $(value).prependTo($(value).siblings('label'));
            // check if using jQuery Eflex Draw
            if (args.jQueryEflexDraw.enable) {
                $(value).eflex({
                    type: 'draw', icon: args.jQueryEflexDraw.icon, classes: 'u-mar--right'
                });
            }
        });

        $('.c-brand--form__cc--label').hide();

        // make amazon button center
        $('.AmazonPayments').addClass('fn--center');

        args.input.on('click', function () {
            // get current payment type
            var paymentType = $(this).attr('id');

            // if we are not using an image to display the button
            if (args.submit.attr('type') === 'submit' || wasSubmit === true) {
                // check if paypal option was chosen
                if (paymentType.match(/PayPal/i)) {
                    $btn = args.submit.siblings('.is-paypal');
                    // check if express checkout image doesn't exist in the DOM
                    if ($btn.length === 0 && args.addPayPalButton) {
                        // insert express checkout image after submit button
                        $img__paypal.insertAfter(args.submit);
                    }
                    // hide submit button
                    args.submit.hide();
                    // show express checkout image
                    $btn.removeClass('hide');
                    args.submit.siblings('.is-express-checkout-image:not(.is-PayPal)').addClass('is--hidden');
                    args.submit.siblings('.is-PayPal').removeClass('is--hidden');

                    // detach from any styling
                    args.submit.removeClass().addClass('ec--img');

                    wasSubmit = true;
                    // if amazon was chosen
                } else if (paymentType.match(/Amazon/i)) {
                    // hide submit button
                    args.submit.hide();
                    // detach from any styling
                    args.submit.removeClass().addClass('ec--img');
                    // if venmo was chosen
                } else if (paymentType.match(/Venmo/i)) {
                    // check if express checkout image doesn't exist in the DOM
                    if (args.addVenmoButton) {
                        $img__venmo.insertAfter(args.submit);
                    }

                    // hide submit button
                    args.submit.hide();
                    args.submit.siblings('.is-express-checkout-image:not(.is-Venmo)').addClass('is--hidden');
                    args.submit.siblings('.is-Venmo').removeClass('is--hidden');

                    // detach from any styling
                    args.submit.removeClass().addClass('ec--img');
                }
            }

            // check if credit card option was chosen, show credit card disclaimer
            if (paymentType.match(/Card/gi)) {
                args.disclaimer.show();

                // change submit type back to normal
                args.submit.removeClass()
                    .addClass(oclasses).show();

                args.submit.siblings('.is-express-checkout-image').addClass('is--hidden');
                // otherwise, assume other payment methods, hide credit card disclaimer
            } else {
                args.disclaimer.hide();
            }

            triggerEvent('_dtmExpressCheckoutPaymentClick', {
                detail: {
                    args: args, paymentType: paymentType, wasSubmit: wasSubmit, original: {
                        classes: oclasses, label: olabel
                    }
                }
            });

        });

        // if express checkout image is clicked, trigger submission
        $('body').on('click', '.is-paypal, .is-Venmo', function (evt) {
            evt.preventDefault();
            args.submit.trigger('click');
        });

    };


	/* --------------------------------------------------------------------- *

	/* jQuery eFlex | Models

	* --------------------------------------------------------------------- */
    (function ($, document, window, undefined) {

        // jQuery Eflex Draw
        eflex.effects.draw = function (self, master, build, error) {
            /**
             * Determines if the label's htmlFor string value matches the input's id string value which if both match, then they represent the same identity.
             * @param label HTMLLabelElement
             * @param input HTMLInputElement
             */
            const forLabelMatchesInputId = function (label, input) {
                return label.htmlFor === input.id;
            }

            /**
             * Determines if the label's control element matches the input control element which if both match, then they are the same element.
             * @param label HTMLLabelElement
             * @param input HTMLInputElement
             */
            const labelMatchesInput = function (label, input) {
                return input && label && label.control ? label.control === input : false;
            }

            /**
             * Takes an element representing a form control and predicts if it is an orphan element that isn't contained in a label. If the prediction is true, communicate with the appropriate input control.
             * @param label HTMLLabelElement
             * @param input HTMLInputElement
             */
            const updateControlByOrphanElement = function (label, input) {
                if (!labelMatchesInput(label, input) || !forLabelMatchesInputId(label, input)) {
                    if (!input.disabled) {
                        input.checked ^= 1;
                    }
                }
            }

            var draw = construct(Object, function (draw, options, deferred) {

                this.draw = draw;
                this.icon = draw.data('eflex-icon') || options.icon || 'radio-checkbox';
                this.classes = draw.data('eflex-classes') || options.classes || '';
                this.svg = '<svg class="eflex-checkmark__svg ' + this.classes + '" viewBox="0 0 52 52"><circle class="eflex-checkmark__circle" cx="26" cy="26" r="25" fill="none"/><path class="eflex-checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/></svg>';

                this[this.icon]();

            }, {
                toggleStatus: function (_this) {
                    //_this.prop('checked', true);
                    //_this.next().attr('aria-checked', true);
                },

                "radio-checkbox": function (_this) {
                    var self = _this || this;

                    // check if the parent container doesn't already have the eflex styling hook
                    if (!self.draw.parent().hasClass('eflex-checkmark')) {
                        self.draw.attr('data-eflex', 'draw');
                        self.parent = self.draw.parent().addClass('eflex-checkmark');
                        // hide original input type
                        self.draw.css({
                            "display": "inline",
                            "position": "absolute",
                            "opacity": "0",
                            "top": "0",
                            "left": "0"
                        });

                        var $svg = $(this.svg);

                        // insert new svg checkbox
                        $svg.insertAfter(self.draw);

                        const input = self.draw.get(0);
                        const label = $svg.closest("label").get(0);

                        $svg.on("click", updateControlByOrphanElement.bind(this, label, input));
                    }
                },

                checkmark: function (_this) {
                    var self = _this || this;

                    // check if the parent container doesn't already have the eflex styling hook
                    if (!self.draw.parent().hasClass('eflex-checkmark')) {
                        self.draw.attr('data-eflex', 'draw');
                        self.parent = self.draw.parent().addClass('eflex-checkmark');
                        // hide original input type
                        self.draw.hide();

                        var $svg = $(this.svg);

                        // set aria role based on input type
                        $svg.attr('role', self.draw.attr('type'));

                        // check for aria attribution
                        if (typeof self.draw.data('eflex-aria-labelledby') !== 'undefined') {
                            $svg.attr('aria-labelledby', self.draw.data('eflex-aria-labelledby'));
                        }

                        // insert new svg checkbox
                        $svg.insertAfter(self.draw);

                        self.draw.on('click', function () {
                            self.toggleStatus($(this));
                        });
                    }

                    // add tabulation support
                    self.parent.on('keypress', function (event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode === 13) {
                            $(this).find('[data-eflex="draw"]').trigger('click');
                        }
                    });
                }

            });

            draw(self.$elem, self.options, new $.Deferred());
        };


        // jQuery Eflex Link
        eflex.effects.link = function (self, master, build, error) {

            var link = construct(Object, function (link, options, deferred) {

                this.link = link;
                this.status = false;
                this.eventType = options.eventType || 'click';
                this.disableAfter = link.data('eflex-disable-after') || options.disableAfter || 0;
                this.counter = 0;

                // text
                this.text = link.data('eflex-text') || options.text || 'Changed';

                // text label
                this.textLabel = link.data('eflex-text-label') || options.textLabel || $('[data-code-label]');

                // css classes
                this.classes = link.data('eflex-classes') || options.classes || 'confirm-button';

                // preserve content
                this.preserveContent = master.calc('setDefault', {
                    setting: link.data('eflex-preserve-content'), default: master.calc('setDefault', {
                        setting: options.preserveContent, default: false
                    }).func
                }).func;

                // swap classes
                this.swapClasses = master.calc('setDefault', {
                    setting: link.data('eflex-swap-classes'), default: master.calc('setDefault', {
                        setting: options.swapClasses, default: true
                    }).func
                }).func;

                // toggle state
                this.toggle = master.calc('setDefault', {
                    setting: link.data('eflex-toggle'), default: master.calc('setDefault', {
                        setting: options.toggle, default: true
                    }).func
                }).func;

                this.originalText = link.text();
                this.originalClasses = link.attr('class');

                this.onInit = options.onInit || function () { };
                this.onBefore = options.onBefore || function () { };
                this.onAfter = options.onAfter || function () { };

                this.deferred = deferred;
                this.init();

            }, {

                add: function (_this) {
                    // get link object
                    var self = _this || this;
                    var links = [];
                    links.push(self.link);

                    if (self.additionalLinks != null) {
                        links = links.concat(self.additionalLinks);
                    }
                    links.forEach(function (l) {
                        if (self.swapClasses) {
                            l.removeClass();
                        }

                        l.addClass(self.classes);

                        if (!self.preserveContent) {
                            l.html(self.text);
                        } else {
                            l.find(self.textLabel).html(self.text);
                        }

                        if (self.disableAfter > 0) {
                            if (self.counter === self.disableAfter) {
                                l.css({ 'pointer-events': 'none', 'cursor': 'default' });
                            } else {
                                l.css({ 'pointer-events': 'all', 'cursor': 'pointer' });
                            }
                        }
                    });
                    self.status = true;
                },

                update: function (_this, selector) {
                    // get link object
                    var self = _this || this;
                    var links = [];
                    links.push(self.link);

                    if (self.additionalLinks != null) {
                        links = links.concat(self.additionalLinks);
                    }
                    links.forEach(function (l) {
                        if (!self.status) {
                            if (!self.preserveContent) {
                                l.html('Updating...');
                            } else {
                                l.find(self.textLabel).html('Updating...');
                            }
                            setTimeout(function () {
                                if (!self.status) {
                                    _eflex.link.methods.add(self);
                                }
                            }, 500);
                        }
                        else {
                            if (!self.preserveContent) {
                                l.html('Updating...');
                            } else {
                                l.find(self.textLabel).html('Updating...');
                            }
                            setTimeout(function () {
                                if (self.status) {
                                    if (!self.preserveContent) {
                                        l.html(self.text);
                                    } else {
                                        l.find(self.textLabel).html(self.text);
                                    }
                                }
                            }, 500);

                        }
                    });
                },

                remove: function (_this) {
                    // get link object
                    var self = _this || this;
                    var links = [];
                    links.push(self.link);

                    if (self.additionalLinks != null) {
                        links = links.concat(self.additionalLinks);
                    }

                    links.forEach(function (l, idx) {
                        l.removeClass(self.classes);

                        if (self.swapClasses) {
                            l.addClass(self.originalClasses);
                        }

                        if (!self.preserveContent) {
                            l.html(self.originalText);
                        } else {
                            l.find(self.textLabel).html(self.originalText);
                        }

                        if (self.disableAfter > 0) {
                            if (self.counter !== self.disableAfter) {
                                l.css({ 'pointer-events': 'all', 'cursor': 'pointer' });
                                if (idx == links.length) {
                                    self.counter = 0;
                                }
                            } else {
                                l.css({ 'pointer-events': 'all', 'cursor': 'pointer' });
                                if (idx == links.length) {
                                    self.counter = 0;
                                }
                            }
                        }
                    });
                    self.status = false;
                },

                setBefore: function (_this) {
                    // get link object
                    var self = _this || this;

                    master.trigger('callback', {
                        onState: self.onBefore,
                        obj: self
                    });

                    self.link.trigger({
                        type: 'eflex/link/onBefore', self: self
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                init: function (_this) {
                    // get link object
                    var self = _this || this;

                    master.trigger('callback', {
                        onState: self.onInit,
                        obj: self
                    });

                    self.link.trigger({
                        type: 'eflex/link/onInit', self: self
                    });

                    self.link.on('click', function () {
                        self.setBefore().done(function () {

							<% if (!jQueryEflexLinkSyncShoppingCart)
    { %>
                                if (!(self.status)) {
                                    self.add();
                                } else {
                                    if (self.toggle === true) {
                                        self.remove();
                                    }
                                }
							<% } %>
                                master.trigger('callback', {
                                    onState: self.onAfter,
                                    obj: self
                                });

                                self.link.trigger({
                                    type: 'eflex/link/onAfter', self: self
                                });

                            });

                        });
                }

            });

            link(self.$elem, self.options, new $.Deferred());

        };


		<%-- check if jQuery Eflex Slider is enabled --%>
		<% if (enablejQueryEflexSlider)
    { %>

		/* @Slider
		* --------------------------------------------------------------------- *

			@desc : creates the slider effect
			@params : accepts the effect, config and action objects
			@demo :

				@Shorthand
				$('.js-eflex--slider').eflex( 'slider' );

				@Longhand
				$('.js-eflex--slider').eflex({
					type: 'slider',
					sliderType: 'carousel',
					nav: $('.js-eflex--slider__nav'),
					navType: 'button',
					navLabel: 'next',
					paginate: $('.js-eflex--slider__paginav'),
					paginateType: 'li',
					htmlWrapper: 'div',
					cssWrapper: 'slider-wrapper',
					animationType: 'revert',
					duration: 500,
					easing: 'swing',
					eventType: 'click',
					auto: false,
					onBefore: function ( self, currentIndex ) {
						console.log( self );
					},
					onAfter : function ( self, oldIndex ) {
						console.log( self );
					}
				});

		* --------------------------------------------------------------------- */
        eflex.effects.slider = function (self, master, build, error) {

            var slider = construct(Object, function (slider, options, deferred) {

                // set element
                this.slider = slider;
                this.slides = this.slider.children();
                this.allSlides = this.slides.length;

                // set indexes
                this.currentIndex = 0;
                this.preIndex = this.allSlides;
                this.postIndex = 1;
                this.startArrayAt = 0;

                // set slider type
                this.sliderType = slider.data('eflex-slider-type') || options.sliderType || 'revert';
                // set settings object for slider type
                this.settings = {};
                this.settings[this.sliderType] = {};

                // set active slide
                this.activeSlideItem = 'data-js-eflex-active-item';
                this.activeClass = options.activeClass || 'is-selected';

                // set timer
                this.timer = undefined;
                this.play = true;

                // set axis and direction
                this.axis = slider.data('eflex-axis') || options.axis || 'horizontal';
                this.direction = slider.data('eflex-direction') || options.direction;
                // validate direction belongs to correct axis
                if (this.axis === 'vertical') {
                    if (this.direction === 'left' || this.direction === 'right') {
                        this.direction = 'top';
                    }
                } else {
                    if (this.direction === 'top' || this.direction === 'bottom' || this.direction === undefined) {
                        this.direction = 'left';
                    }
                }

                // check if browser supports 3d transforms
                var support3d = master.search('style', {
                    prop: 'transform',
                    value: 'translate3d(0px, 0px, 0px)',
                    prefix: true
                }).func;

                if (support3d.value !== false) {
                    // set animation style (jQuery or CSS3)
                    this.animationType = slider.data('eflex-animation-type') || options.animationType || 'jQuery';
                } else {
                    this.animationType = 'jQuery';
                }

                // effect config
                this.duration = slider.data('eflex-duration') || options.duration || 600;
                this.delay = slider.data('eflex-delay') || options.delay || 3000;
                this.easing = master.calc('easing', {
                    easing: slider.data('eflex-easing') || options.easing, animationType: this.animationType
                }).func || 'linear';

                // event handler
                this.eventType = slider.data('eflex-event-type') || options.eventType || 'click';

                // auto play
                this.auto = master.calc('setDefault', {
                    setting: slider.data('eflex-auto'), default: master.calc('setDefault', {
                        setting: options.auto, default: true
                    }).func
                }).func;

                // pause on hover
                this.pauseOnHover = master.calc('setDefault', {
                    setting: slider.data('eflex-pause-on-hover'), default: master.calc('setDefault', {
                        setting: options.pauseOnHover, default: false
                    }).func
                }).func;

                // pause on scroll
                this.pauseOnScroll = master.calc('setDefault', {
                    setting: slider.data('eflex-pause-on-scroll'), default: master.calc('setDefault', {
                        setting: options.pauseOnScroll, default: false
                    }).func
                }).func;

                // pause on inactive window
                this.pauseOnInActiveWindow = master.calc('setDefault', {
                    setting: slider.data('eflex-pause-on-inactive-window'), default: master.calc('setDefault', {
                        setting: options.pauseOnInActiveWindow, default: false
                    }).func
                }).func;

                // responsive mode
                this.responsive = master.calc('setDefault', {
                    setting: slider.data('eflex-responsive'), default: master.calc('setDefault', {
                        setting: options.responsive, default: true
                    }).func
                }).func;

                // scale by element
                if (this.responsive) {
                    this.scaleByElement = $(slider.data('eflex-scale-by')) || options.scaleByElement || this.slider.parent();
                    if (this.scaleByElement.length === 0 || this.scaleByElement.selector === 'parent') {
                        this.scaleByElement = this.slider.parent();
                    }

                    // check if slider is in a link tag
                    if (this.slider.closest('a').length > 0) {
                        if (this.slider.closest('a').css('display') !== 'block') {
                            this.slider.closest('a').addClass('js-eflex-fade-protector block');
                        }

                        // otherwise, check if slider's parent is a block level element
                    } else if (this.slider.parent().css('display') !== 'block') {
                        this.slider.wrap($('<div />', {
                            class: 'js-eflex-fade-protector block'
                        }));
                    }
                } else {
                    this.scaleByElement = this.slider;
                }

                // await mode
                this.await = slider.data('eflex-await') || options.await || false;

                // swipe gesture mode
                this.swipe = master.calc('setDefault', {
                    setting: slider.data('eflex-swipe'), default: master.calc('setDefault', {
                        setting: options.swipe, default: false
                    }).func
                }).func;

                // css media queries
                this.cssMediaQueries = master.calc('setDefault', {
                    setting: slider.data('eflex-css-media-queries'), default: master.calc('setDefault', {
                        setting: options.cssMediaQueries, default: false
                    }).func
                }).func;

                // nav
                this.nav = master.calc('setDefault', {
                    setting: slider.data('eflex-nav'), default: master.calc('setDefault', {
                        setting: options.nav, default: true
                    }).func
                }).func;

                this.navType = slider.data('eflex-nav-type') || options.navType || 'button';
                this.navLabel = slider.data('eflex-nav-label') || options.navLabel || 'next';
                this.navCurrentElement = undefined;

                // paginate
                this.paginate = master.calc('setDefault', {
                    setting: slider.data('eflex-paginate'), default: master.calc('setDefault', {
                        setting: options.paginate, default: true
                    }).func
                }).func;

                this.paginateType = slider.data('eflex-paginate-type') || options.paginateType || 'li';
                this.paginateCurrentElement = undefined;

                // video support
                this.mediaMode = master.calc('setDefault', {
                    setting: slider.data('eflex-media-mode'), default: master.calc('setDefault', {
                        setting: options.mediaMode, default: true
                    }).func
                }).func;

                // wrappers
                this.htmlWrapper = slider.data('eflex-html-wrapper') || options.htmlWrapper || 'div';
                // NOTE: cssWrapper currently serves no purpose since the wrapper is within the slider
                this.cssWrapper = slider.data('eflex-css-wrapper') || options.cssWrapper || 'slider-inner';
                this.slider.wrapInner($(
                    document.createElement(this.htmlWrapper)
                ));
                this.sliderInner = this.slider.children();
                this.sliderOuter = this.slider.parent();

                // namespaces
                this.classname = options.classname || undefined;
                this.navSuffix = options.navSuffix || '--nav';

                // utility accessors
                this.options = options;
                this.deferred = deferred;

                // callbacks
                this.onInit = options.onInit || function () { };
                this.onBefore = options.onBefore || function () { };
                this.onAfter = options.onAfter || function () { };

                this.get = {

                    reversePos: function (_this, dir) {
                        var self = _this || this;
                        var val = 0;

                        switch (dir) {
                            case 'width':
                            default:
                                // update slide positions based on current width of slider
                                for (var j = 0, i = self.allSlides - 1; i >= 0; i--, j++) {
                                    if (i === self.currentIndex) {
                                        val = -(self.itemsWidth[self.currentIndex]) * j;
                                    }
                                }
                                break;
                            case 'height':
                                // update slide positions based on current width of slider
                                for (var j = 0, i = self.allSlides - 1; i >= 0; i--, j++) {
                                    if (i === self.currentIndex) {
                                        for (var x = 1; x <= j; x++) {
                                            val += -(self.itemsHeight[x]);
                                        }
                                    }
                                }
                                break;
                        }

                        return val;
                    },

                    // set position value
                    pos: function (_this, init) {
                        var self = _this || this;
                        // set sum value
                        var sum = init || 0;
                        // add current position based on the height array
                        for (var i = 0; i < self.currentIndex; i++) {
                            sum += self.itemsHeight[i + self.startArrayAt];
                        }

                        return sum;
                    }

                };

                // initializer
                // if await mode is enabled
                if (this.await) {
                    var self = this;
                    (function () {
                        // set check to fire initializer
                        var i = 0;

                        try {
                            // when await action occurs
                            $(window).on(self.await, function () {
                                // check if a fire hasn't occurred
                                if (i === 0) {
                                    // initialize the slider
                                    self.init();
                                    // set check to prevent refire
                                    i = 1;
                                }
                            });
                        } catch (e) {
                            console.log(e.message);
                        }
                    })();
                    // otherwise
                } else {
                    // initialize the slider
                    this.init();
                }

            }, {

                // create new object
                style: construct(master.style, function (_this, options) {

                    // invoke css method
                    this.css(_this, options);

                }, {

                    css: function (_this, options) {
                        // cache slider object
                        var self = _this;

                        // apply class name to slider for access
                        this.classname({
                            el: _this.slider,
                            options: options,
                            callback: function (slider, classname) {
                                self.classname = classname;
                            }
                        });
                    }

                }),

                // This method collects slide width and height values in an array, then builds the slides
                cycle: function (_this, init) {
                    // cache slider object
                    var self = _this || this;
                    // set up array to collect item widths
                    self.itemsWidth = self.itemsWidth || [];
                    // set up array to collect item heights
                    self.itemsHeight = self.itemsHeight || [];
                    // set up condition to see if widths are equal
                    self.isSameWidth = null;
                    // set up condition to see if heights are equal
                    self.isSameHeight = null;
                    // set up to add total width sum
                    self.sumWidth = 0;
                    // set up to add total height sum
                    self.sumHeight = 0;

                    // set slider type attribute
                    self.slider.attr({
                        'data-js-eflex': self.options.type
                    }).addClass('animate');

                    // set slider inner type attributes
                    self.sliderInner.attr({
                        'data-js-eflex-container': self.options.type,
                        'data-js-eflex-type': self.sliderType,
                        'data-js-eflex-axis': self.axis
                    });

                    // cycle through all slides
                    self.slides.each(function (index, value) {
                        // cache current slide
                        var $slide = $(value);

                        // assign a numeric id to the slide
                        $slide.attr({ 'data-js-eflex-item': index });
                    });

                    // cycle through all slides
                    self.slides.each(function (index, value) {
                        // cache current slide
                        var $slide = $(value);

                        if (init) {
                            // check if slide is absolute positioned
                            if ($slide.css('position') === 'absolute') {
                                // set to relative in order to get accurate measurements
                                $slide.css({ 'position': 'relative' });
                            }
                        }

                        // check if slide width returns 0
                        if ($slide.width() === 0) {
                            // get width from outer container
                            $slide.width(self.sliderOuter.width());
                        }

                        // check if slide height returns 0
                        if ($slide.height() === 0) {
                            // check if slider height returns 0
                            if (self.slider.height() === 0) {
                                // get height from outer container
                                $slide.height(self.sliderOuter.height());
                                // check if slider has min-height property
                            } else if (self.slider.css('min-height') !== 'none') {
                                // get height from slider's min-height
                                $slide.height(self.slider.css('min-height'));
                            } else {
                                // get height from slider
                                $slide.height(self.slider.height());
                            }
                        }

                        if (init) {
                            // add width to array
                            self.itemsWidth.push(self.slider.width());
                            // add height to array
                            self.itemsHeight.push($slide.height());
                        }
                    });

                    // check if widths are equal
                    self.isSameWidth = master.search('isSame', self.itemsWidth).func;

                    // if they are not the same
                    if (!self.isSameWidth) {
                        // set first index equal to the max width
                        self.itemsWidth[0] = master.search('maxLength', {
                            items: self.slides,
                            length: 'outerWidth'
                        }).func;
                    }

                    self.maxHeight = master.search('maxLength', {
                        items: self.slides,
                        length: 'outerHeight'
                    }).func;

                    // cycle through all slides
                    self.slides.each(function (index, value) {
                        // cache current slide
                        var $slide = $(value);

                        if (init) {
                            // apply width to slide and order by layer
                            $slide.css({
                                'width': self.itemsWidth[index], 'height': self.itemsHeight[index], 'z-index': self.allSlides - index
                            });
                        }

                        // add width to the sum
                        self.sumWidth += self.itemsWidth[index];
                        // add height to the sum
                        self.sumHeight += self.itemsHeight[index];
                    });

                    // check if using carousel or revert slider
                    if (self.sliderType === 'carousel' || self.sliderType === 'revert') {
                        if (self.axis === 'vertical') {
                            // apply sum to the slider and wrap it in a container
                            self.sliderInner.css({ 'width': self.itemsWidth[0], 'height': self.sumHeight });
                        } else {
                            // apply sum to the slider and wrap it in a container
                            self.sliderInner.css({ 'width': self.sumWidth, 'height': self.itemsHeight[0] });
                        }
                    } else {
                        // apply sum to the slider and wrap it in a container
                        self.sliderInner.css({ 'width': self.sumWidth, 'height': self.itemsHeight[self.currentIndex] });
                    }

                },

                destroy: function (_this) {
                    // get slider object
                    var self = _this || this;

                    try {
                        // remove all attributes and classes from the slider
                        self.slider.removeAttr('data-js-eflex').removeAttr('style');
                        // remove all attriubtes and classes from all slides
                        self.slides.each(function (index, value) {
                            $(value).removeAttr('data-js-eflex-item').removeAttr('style').removeAttr('data-js-eflex-active-item');
                            $(value).appendTo(self.slider);
                        });
                        // remove the inner wrapper
                        self.slider.find('[data-js-eflex-container]').remove();
                        // remove navigation
                        self.slider.siblings('[data-js-eflex-nav]').remove();
                        self.slider.siblings('[data-js-eflex-paginate]').remove();
                    } catch (e) {
                        console.log(e.message);
                    }

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method sets up the slides based on the slider type
                setSlides: function (args) {
                    // get slider object
                    var self = args.self || this;
                    // set init
                    var init = typeof args.init !== 'undefined' ? args.init ? true : false : false;

                    // get or set width coordinates
                    args.width = args.width || self.slides.outerWidth(true);
                    // get or set height coordinates
                    args.height = args.height || self.slides.outerHeight(true);
                    // set reversable width and height object
                    args.reverse = args.reverse || {};
                    // set reversable width
                    args.reverse.width = args.reverse.width || self.get.reversePos(self);
                    // set reverable height
                    args.reverse.height = args.reverse.height || self.get.pos(self, -(self.sumHeight - self.itemsHeight[0]));

                    // reverse the order of each slide (ex: CBA instead of ABC)
                    args.reverse.slides = function () {
                        self.slides.each(function (i, slide) {
                            self.sliderInner.prepend(slide);
                        });
                    };

                    // recycle slider sizes
                    self.cycle(self, false);

                    // check slider type
                    switch (self.sliderType) {
                        case 'carousel':
                            if (init) {
                                // set slides to absolute so they stack on top of each other
                                self.slides.css({ 'position': 'absolute', 'opacity': 1 });
                                // set the first slide as active slide
                                self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true');
                            }

                            // check animation type
                            switch (self.animationType) {
                                case 'jQuery':
                                    if (init) {
                                        if (self.axis === 'vertical') {
                                            //args.height = self.direction === 'top' ? -args.height : args.height;
                                            args.height = self.itemsHeight[self.currentIndex + 1];
                                            // update top value to match new slide height
                                            self.slides.css({ 'top': args.height }).eq(self.currentIndex).css({ 'top': 0 });
                                        } else {
                                            args.width = self.direction === 'right' ? args.width : -args.width;
                                            // update left value to match new slide width
                                            self.slides.css({ 'left': args.width }).eq(self.currentIndex).css({ 'left': 0 });
                                        }
                                    }
                                    break;
                                case 'CSS3':
                                    // update translate X value to match new slide width
                                    self.slides.css({
                                        'transform': 'translate3d(' + -args.width + 'px, 0, 0)',
                                        'transition': 'none'
                                    }).eq(self.currentIndex).css({ 'transform': 'translate3d(0, 0, 0)' });
                                    break;
                            }
                            break;

                        // set init values for the revert slider
                        case 'revert':
                            // check axis
                            if (init) {
                                // set slides to absolute so they stack on top of each other
                                self.slides.css({ 'opacity': 1 });

                                switch (self.axis) {
                                    case 'vertical':
                                        if (self.direction === 'bottom') {
                                            // reverse slide order
                                            args.reverse.slides();
                                            // set array indexer at 1
                                            self.startArrayAt = 1;
                                            // CSS3
                                            if (self.animationType === 'CSS3') {
                                                // update translate Y value to match new slide width
                                                self.sliderInner.css({ 'transform': 'translate3d(0, ' + args.reverse.height + 'px, 0)', 'transition': 'none' });
                                                // jQuery
                                            } else {
                                                // update top value to match new slide width
                                                self.sliderInner.css({ 'top': args.reverse.height });
                                            }
                                        }
                                        break;
                                    case 'horizontal':
                                        // if using right direction
                                        if (self.direction === 'right') {
                                            // reverse slide order
                                            args.reverse.slides();
                                            // CSS3
                                            if (self.animationType === 'CSS3') {
                                                // update translate X value to match new slide width
                                                self.sliderInner.css({ 'transform': 'translate3d(' + args.reverse.width + 'px, 0, 0)', 'transition': 'none' });
                                                // jQuery
                                            } else {
                                                // set left position back so 1st slide is in view
                                                self.sliderInner.css({ 'left': args.reverse.width });
                                            }
                                            // if using left direction
                                        } else {
                                            // CSS3
                                            if (self.animationType === 'CSS3') {
                                                // update translate X value to match new slide width
                                                self.sliderInner.css({ 'transform': 'translate3d(' + -(self.currentIndex * args.width) + 'px, 0, 0)', 'transition': 'none' });
                                                // jQuery
                                            } else {
                                                // update left value to match new slide width
                                                self.sliderInner.css({ 'left': -(self.currentIndex * args.width) });
                                            }
                                        }
                                        break;
                                }
                            }
                            break;

                        // set init values for the fader
                        case 'fade':
                            if (init) {
                                // set slides to absolute so they stack on top, equalize z-index and set opacity to 0%
                                self.slides.css({ 'position': 'relative', 'z-index': 1, 'opacity': 0 });
                                // set first slide as active slide, raise z-index to top and set opacity to 100%
                                self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true').css({ 'z-index': 2, 'opacity': 1 });
                            }

                            // check animation type
                            switch (self.animationType) {
                                case 'jQuery':
                                    // update left value to match new slide width multiplied by current index
                                    self.slides.each(function (index, value) {
                                        $(value).css({ 'left': -(index * args.width) });
                                    });
                                    break;
                                case 'CSS3':
                                    // update translate X value to match new slide width multiplied by current index
                                    self.slides.each(function (index, value) {
                                        $(value).css({ 'transform': 'translate3d(' + -(index * args.width) + 'px, 0, 0)' });
                                    });
                                    break;
                            }
                            break;
                    }

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method prepares the callback function to run
                setCallback: function (_this, status) {
                    // cache slider object
                    var self = _this || this;

                    // check if media is supported
                    if (self.mediaMode) {
                        // detect video on current slider
                        self.media.HTML5.onCurrentVideo(self);
                    }

                    // update post index value
                    self.postIndex = master.search('pos', {
                        obj: { currentIndex: self.currentIndex },
                        sum: self.allSlides,
                        dir: function () {
                            return typeof (self.nav) !== 'boolean'
                                ? self.nav.find(self.navCurrentElement).data('dir')
                                : 'next';
                        },
                        label: self.navLabel
                    }).func;

                    // trigger on before callback function
                    master.trigger('callback', {
                        onState: self[status] || self.onInit,
                        obj: self
                    });

                    // trigger eflex slider event
                    master.trigger('event', {
                        name: status + 'EflexSlider',
                        data: {
                            detail: { eflex: self, master: master }
                        }
                    });

                    // trigger jQuery version of eflex slider event
                    self.slider.trigger({
                        type: 'eflex/slider/' + status,
                        self: self
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method controls the playback of the slider
                playback: function (control, _this) {
                    // cache slider object
                    var self = _this || this;
                    // get current slide id
                    var cacheIndex = self.currentIndex;

                    // set timer
                    master.calc('timer', {
                        self: self,
                        status: control,
                        delay: self.delay,
                        onTrue: function () {

                            // set on before state
                            self.setCallback(self, 'onBefore').done(function () {
                                // check if slider is active
                                if (self.play === true && self.slider.is(':visible')) {
                                    // set transition and on complete, set on after state
                                    self.ready(self, self.currentIndex, self.navLabel).done(function () {
                                        self.setCallback(self, 'onAfter');
                                    });
                                }
                            });
                        },
                        onFalse: function () { }
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;

                },

                // This method refreshes the slider
                refresh: function (_this, dir) {
                    // cache slider object
                    var self = _this || this;

                    // pause slider
                    self.playback(false).done(function () {
                        if (self.play === true) {
                            // ready
                            self.ready(self, self.currentIndex, dir).done(function () {
                                // resume slider
                                self.playback(self.auto);
                            });
                        }
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method updates the size of the slider before transit
                updateSliderSize: function (_this) {
                    // cache slider object
                    var self = _this || this,
                        // get current slide
                        current = self.slides.eq(self.currentIndex);

                    // check if slider is visible in the DOM
                    if (self.slider.is(':visible')) {
                        // update each width based on new width
                        self.itemsWidth[self.currentIndex] = self.slider.width();

                        //console.log('update', self.slider.width());

                        // check if slide contains multiple html tags
                        if (current.children().length > 1) {
                            // update each height based on new height
                            self.itemsHeight[self.currentIndex] = current.outerHeight(true);
                        } else {
                            // update each height based on new height
                            self.itemsHeight[self.currentIndex] = current.children().outerHeight(true);
                        }

                    }

                    // update slider to new height
                    master.search('cycle', {
                        obj: { a: self.slider, b: self.sliderInner, c: current },
                        callback: function (index, value) {
                            value.height(self.itemsHeight[self.currentIndex]);
                        }
                    });

                    // update each slide width to match slider width
                    self.slides.width(self.slider.width());

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method updates the pagination menu with the current styling class
                updatePaginate: function (_this) {
                    // set cached object or inherit object
                    var self = _this || this;

                    if (self.paginate !== false) {
                        // remove active class from all element
                        self.paginate.find(self.paginateType).removeClass(self.activeClass);
                        // update active class to current element
                        self.paginate.find(self.paginateType).eq(self.currentIndex).addClass(self.activeClass);
                    }

                    if (self.nav !== false) {
                        // remove active class from all element
                        self.nav.find(self.navType).removeClass(self.activeClass);
                        // update active class to current element
                        self.nav.find(self.navCurrentElement).addClass(self.activeClass);
                    }
                },

                // This method handles any images that are set to lazy load
                lazyLoad: function (_this, args) {
                    // get slider object
                    var self = _this || this;
                    // get args
                    args = args || {};
                    // get current slide
                    var $slide = args.slide || self.slides.eq(self.currentIndex);
                    // search for lazy attribute
                    var $lazy = $slide.find('[data-src]');
                    // set image finder
                    var imgsFound = 0;

                    // iterate each image
                    $lazy.each(function (item, img) {
                        var $img = $(img);

                        // check if element is an image tag
                        if (img.nodeName === 'IMG') {
                            // check if src attribute doesn't match lazy attribute
                            if ($img.attr('src') !== $img.data('src')) {
                                // replace src attribute with lazy attribute
                                $img.attr('src', $img.data('src'));
                                imgsFound++;
                            }
                            // otherwise element is not image so must be placeholder container
                        } else {
                            // generate dynamic image node
                            var $getImg = $('<img />');

                            // cycle the placeholder container
                            $img.each(function () {
                                // get all attributes from the placeholder container
                                $.each(this.attributes, function () {
                                    $getImg.attr(this.name, this.value);
                                });
                            });
                            // set source & alt attributes from data attributes
                            $getImg.attr({
                                src: $img.data('src'), alt: $img.data('alt')
                            });

                            // replace the placeholder container with dynamic image tag
                            $img.replaceWith($getImg);
                            imgsFound++;
                        }
                    });

                    // check if images were set to lazy load
                    if (imgsFound > 0) {
                        $slide.find('[data-src]').on('load', function () {
                            // when image loads, return callback
                            return args.complete(true);
                        });
                    } else {
                        return args.complete(false);
                    }
                },

                // This method retrieves the current index and prepares the slider for transit
                ready: function (_this, index, dir) {
                    // set cached object or inherit object
                    var self = _this || this;

                    // set current index
                    self.currentIndex = index || self.currentIndex;
                    // update pre-index value
                    self.preIndex = self.currentIndex;

                    // get current slide
                    master.search('pos', {
                        obj: self,
                        sum: self.allSlides,
                        dir: dir,
                        label: self.navLabel
                    });

                    // update post-index value
                    self.postIndex = self.currentIndex;

                    // run lazy load
                    self.lazyLoad(self, {
                        complete: function () {
                            self.triggerResize(self, false).done(function () {
                                // run transition based on slider type
                                master.browser('animate', {
                                    self: self,
                                    method: self.sliderType,
                                    args: {
                                        dir: dir,
                                        index: index
                                    }
                                });
                                self.updatePaginate();
                            });
                        }
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method re-enables the navigation & pagination links
                enableLinks: function (_this) {
                    var self = _this || this;

                    // enable nav link
                    build.dynamic('enableLink', { links: self.nav, linkType: self.navType });
                    // enable paginate link
                    build.dynamic('enableLink', { links: self.paginate, linkType: self.paginateType });
                },

                // This method makes the transit mechanics public based on slider type
                extend: function (exportable) {
                    // cache slider object
                    var self = this,
                        set = self.settings[self.sliderType];

                    // set export status
                    exportable = master.calc('setDefault', { boolean: exportable, default: true }).func;
                    // set extendable to true
                    self.extendable = true;

                    // set init method
                    set.init = function (args) {
                        // set args object
                        args = args || {};
                        // set args dir
                        args.dir = args.dir || self.navLabel;

                        // get active slide id
                        this.activeSlideId = self.slider.find('[' + self.activeSlideItem + ']').data('js-eflex-item');
                        // get target slide id
                        this.targetSlideId = self.slides.eq(self.currentIndex).data('js-eflex-item');
                        // get length of slide
                        this.length = self.axis === 'vertical' ? self.maxHeight : self.itemsWidth[self.currentIndex];
                        // set reference point based on axis
                        this.axis = self.axis === 'vertical' ? 'top' : 'left';
                        // set route based on direction
                        this.route = args.dir === 'next' ? -this.length : this.length;
                        // set route objects
                        this.coords = this.coords || { a: {}, b: {}, c: {}, d: {} };
                        // set position
                        this.pos = {};
                        // set position axis
                        this.pos[this.axis] = 0;
                    };

                    // check slider type
                    switch (self.sliderType) {
                        case 'revert':
                            set.animate = function (options) {
                                switch (self.animationType) {
                                    case 'CSS3':
                                        self.sliderInner.css({
                                            'transition': 'all ' + self.duration + 'ms ' + self.easing,
                                            'transform': 'translate3d(' + (options.x || 0) + 'px, ' + (options.y || 0) + 'px, ' + (options.z || 0) + 'px)'
                                        });
                                        break;
                                    case 'jQuery':
                                    default:
                                        self.sliderInner.animate(options, self.duration, self.easing, function () {
                                            // enable slider controls
                                            self.enableLinks();
                                        });
                                        break;
                                }
                            };

                            set.transitionEnd = function () {
                                // set bind transition event listener
                                self.sliderInner.on('transitionend webkitTransitionEnd oTransitionEnd', function () {
                                    // unbind transition event listener
                                    self.sliderInner.off('transitionend webkitTransitionEnd oTransitionEnd');
                                    // enable slider controls
                                    self.enableLinks();
                                });
                            };
                            break;
                        case 'carousel':
                            // set route method
                            set.setRoutes = function (boolean, args) {
                                args = args || {};
                                coords = args.coords || set.coords;
                                route = args.route || set.route;
                                axis = args.axis || set.axis;
                                master.search('cycle',
                                    {
                                        obj: coords, args: boolean, callback: function (index, value, args, i) {
                                            coords[index][axis] = boolean[i] ? route : -route;
                                        }
                                    });
                                if (args.use) {
                                    set.routeCalled = true;
                                }
                            };

                            // set animate method
                            set.animate = function (options) {
                                // check animation type
                                switch (self.animationType) {
                                    case 'CSS3':
                                        // get active slide item and animate it
                                        self.slider.find('[' + self.activeSlideItem + ']').css({
                                            'transition': 'all ' + self.duration + 'ms ' + self.easing,
                                            'transform': 'translate3d(' + (options.x || 0) + 'px, ' + (options.y || 0) + 'px, ' + (options.z || 0) + 'px)'
                                        });
                                        break;
                                    case 'jQuery':
                                    default:
                                        if (self.axis === 'vertical') {
                                            set.coords.a.left = 0;
                                            set.coords.c.left = 0;
                                        } else {
                                            set.coords.a.top = 0;
                                            set.coords.c.top = 0;
                                        }

                                        // get active slide item and animate it
                                        self.slider.find('[' + self.activeSlideItem + ']').animate(set.coords.a, self.duration, self.easing, function () {
                                            // reset top css property for active slide item
                                            self.slider.find('[' + self.activeSlideItem + ']').css(set.coords.b).removeAttr(self.activeSlideItem);
                                        });

                                        self.slides.eq(self.currentIndex)
                                            .css(set.coords.c)
                                            .animate(set.pos, self.duration, self.easing, function () {
                                                self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true');
                                                self.slides.not(':eq(' + self.currentIndex + ')').css(set.coords.d);
                                                // enable slider controls
                                                self.enableLinks();
                                            });
                                        break;
                                }
                            };

                            // set move current slide method (CSS method only)
                            set.moveCurrentSlide = function (options) {
                                self.slides.eq(self.currentIndex).css({
                                    'transition': 'none',
                                    'transform': 'translate3d(' + (options.x || 0) + 'px, ' + (options.y || 0) + 'px, ' + (options.z || 0) + 'px)'
                                });

                                // resolve deferred state and return complete status
                                return master.deferred('promise', self.deferred).func;
                            };

                            // reset slide method
                            set.resetSlide = function () {
                                // weird hack that allows the slide to animate right
                                self.slides.css('transform');
                                // set transition and animate x-axis property ( length of slider *2 - length of slider )
                                self.slides.eq(self.currentIndex).css({
                                    'transition': 'all ' + self.duration + 'ms ' + self.easing,
                                    'transform': 'translate3d(0px, 0px, 0px)'
                                });
                            };

                            // transition method
                            set.transitionEnd = function () {
                                // set bind transition event listener
                                self.slides.on('transitionend oTransitionEnd webkitTransitionEnd', function () {
                                    // unbind transition event listener
                                    self.slides.off('transitionend oTransitionEnd webkitTransitionEnd');
                                    // remove active attribute
                                    self.slider.find('[' + self.activeSlideItem + ']').removeAttr(self.activeSlideItem);
                                    // set active attribute to current slide
                                    self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true');
                                    // enable slider controls
                                    self.enableLinks();
                                });
                            };
                            break;
                        case 'fade':
                            set.animate = function (args) {
                                // set opacity of current index to 100%
                                self.slides.eq(self.currentIndex).css({ 'opacity': 1, 'transition': 'none' });

                                switch (self.animationType) {
                                    case 'CSS3':
                                        // find active slide and animate opacity to 0%
                                        self.slider.find('[' + self.activeSlideItem + ']').css({
                                            'transition': 'opacity ' + self.duration + 'ms ' + self.easing,
                                            'opacity': 0
                                        });

                                        // set bind transition event listener
                                        self.slides.on('transitionend oTransitionEnd webkitTransitionEnd', function () {
                                            console.log('transition has ended');
                                            // unbind transition event listener
                                            self.slides.off('transitionend oTransitionEnd webkitTransitionEnd');
                                            // remove active attribute and set z-index back to base level
                                            self.slider.find('[' + self.activeSlideItem + ']').removeAttr(self.activeSlideItem).css({ 'z-index': 1 });
                                            // get current slide, set as active slide and raise z-index to top
                                            self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true').css({ 'z-index': 2 });
                                            // enable slider controls
                                            self.enableLinks();
                                        });
                                        break;
                                    case 'jQuery':
                                    default:
                                        // find active slide and animate opacity to 0%
                                        self.slider.find('[' + self.activeSlideItem + ']').animate({
                                            'opacity': 0
                                        }, self.duration, self.easing, function () {
                                            // remove active attribute and set z-index back to base level
                                            self.slider.find('[' + self.activeSlideItem + ']').removeAttr(self.activeSlideItem).css({ 'z-index': 1 });
                                            // get current slide, set as active slide and raise z-index to top
                                            self.slides.eq(self.currentIndex).attr(self.activeSlideItem, 'true').css({ 'z-index': 2 });
                                            // enable slider controls
                                            self.enableLinks();
                                        });
                                        break;
                                }
                            };
                            break;
                    }

                    // check if extend is set to export
                    if (exportable) {
                        set.init();
                        set.override = true;
                    }
                },

                // This method controls the mechanics for revert slider type
                revert: function (_this, args) {
                    // cache slider object
                    var self = _this || this,
                        set = self.settings[self.sliderType];

                    // run init method
                    set.init(args);

                    // if using jQuery animation
                    if (self.animationType === 'jQuery') {
                        if (self.axis === 'vertical') {
                            if (self.direction === 'top') {
                                self.animateValue = -(self.get.pos(self, 0));
                            } else {
                                self.animateValue = self.get.pos(self, -(self.sumHeight - self.itemsHeight[0]));
                            }
                            set.animate({ 'top': self.animateValue });
                        } else {
                            if (self.direction === 'right') {
                                self.animateValue = self.get.reversePos(self);
                            } else {
                                self.animateValue = -(self.currentIndex * self.slides.outerWidth(true));
                            }
                            set.animate({ 'left': self.animateValue });
                        }

                        // if using CSS3 animation
                    } else {
                        if (self.axis === 'vertical') {
                            if (self.direction === 'top') {
                                self.animateValue = -(self.get.pos(self, 0));
                            } else {
                                self.animateValue = self.get.pos(self, -(self.sumHeight - self.itemsHeight[0]));
                            }
                            set.animate({ y: self.animateValue });
                        } else {
                            if (self.direction === 'right') {
                                self.animateValue = self.get.reversePos(self);
                            } else {
                                self.animateValue = -(self.currentIndex * self.slides.outerWidth(true));
                            }
                            set.animate({ x: self.animateValue });
                        }

                        set.transitionEnd();

                    }

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method controls the mechanics for carousel slider type
                carousel: function (_this, args) {
                    // cache slider object
                    var self = _this || this,
                        set = self.settings[self.sliderType];

                    // set direction to next if undefined
                    if (args.dir === undefined) { args.dir = 'next'; }
                    // run init
                    set.init(args);

                    // check if slide id and nav slide id doesn't match
                    if (set.activeSlideId !== set.targetSlideId) {

                        // if using jQuery animation
                        if (self.animationType === 'jQuery') {
                            // check if routes haven't been overridden

                            if (!set.override || set.routeCalled === undefined) {
                                // set routes based on axis
                                self.direction === 'top' || self.direction === 'right'
                                    ? set.setRoutes([false, true, true, false])
                                    : set.setRoutes([true, false, false, false]);
                            }
                            // animate slide
                            set.animate();

                            // if using CSS3 animation
                        } else {
                            // check if routes haven't been overridden
                            if (!set.override || set.routeCalled === undefined) {
                                // set routes based on axis
                                self.direction === 'top' || self.direction === 'right'
                                    ? set.setRoutes([false, true])
                                    : set.setRoutes([true, false]);
                            }

                            if (self.axis === 'vertical') {

                                set.animate({ y: set.coords.a[set.axis] });
                                set.moveCurrentSlide({ y: set.coords.b[set.axis] }).then(set.resetSlide);

                            } else {

                                set.animate({ x: set.coords.a[set.axis] });
                                set.moveCurrentSlide({ x: set.coords.b[set.axis] }).then(set.resetSlide);

                            }

                            set.transitionEnd();

                        }

                    }

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method controls the mechanics for fade slider type
                fade: function (_this, args) {
                    // get slider object
                    var self = _this || this,
                        set = self.settings[self.sliderType];

                    // run init method
                    set.init(args);

                    // check if slide id and nav slide id doesn't match
                    if (set.activeSlideId !== set.targetSlideId) {

                        set.animate(args);

                    }

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method controls the first and last slides position for carousel
                dir: function (dir) {
                    // cache slider object
                    var self = this;

                    // rotate slides based on direction
                    switch (dir) {
                        case 'next':
                            self.slider.children(':first-child').insertAfter(self.slider.children(':last-child'));
                            break;
                        case 'prev':
                            self.slider.children(':last-child').insertBefore(self.slider.children(':first-child'));
                            break;
                    }

                },

                // This method determines if the slider will auto-rotate
                checkIfAutoPlay: function (_this) {
                    // get slider object
                    var self = _this || this;

                    // resume slider
                    self.playback(self.auto);

                    // resolve deferred state and return complete status
                    master.deferred('promise', self.deferred).func;
                },

                triggerResize: function (_this, init) {
                    // get slider object
                    var self = _this || this;
                    // set init
                    init = typeof init !== 'undefined' ? init ? true : false : true;

                    // check if using css media queries
                    if (!self.cssMediaQueries) {
                        // set max-width equal to original width of slider
                        self.slider.css({ 'width': '100%', 'max-width': Math.ceil(self.scaleByElement.width()) });
                    }

                    self.updateSliderSize().done(function () {
                        self.setSlides({
                            init: init,
                            width: self.slider.width(),
                            height: self.slider.height()
                        });
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                // This method handles making the slider adaptable in an responsive design
                isResponsive: function (_this) {
                    // get slider object
                    var self = _this || this;

                    // check if slider is responsive
                    if (self.responsive) {
                        // set timer
                        var timer;

                        var triggerTimer = function () {
                            // stop timer
                            clearTimeout(timer);

                            // set timer to resume after duration completes
                            timer = setTimeout(function () {
                                self.playback(self.auto);
                            }, self.delay);

                            // pause slider and resize it
                            self.playback(false).done(function () {
                                if (self.slider.is(':visible')) {
                                    refireResizeMethod(3, true);
                                }
                            });
                        };

                        var refireResizeMethod = function (x, status) {
                            var x = x || 1, i = 0;
                            var execute = function (i) {
                                setTimeout(function () {
                                    self.triggerResize(self, status);
                                    if (i < x) {
                                        i = i + 1;
                                        execute(i);
                                    }
                                }, 100);
                            };
                            execute(i);
                        };

                        // if window is resized, pause the animation
                        $(window).resize(triggerTimer);
                        $(window).on('orientationchange', function () {
                            refireResizeMethod(3, false);
                        });
                    }

                    // check if using css media queries
                    if (!self.cssMediaQueries) {
                        // set max-width equal to original width of slider
                        self.slider.css({ 'width': '100%', 'max-width': self.itemsWidth[0] });
                    }

                },

                // This method handles pause/play based whether the window is inactive
                isInActiveWindow: function (_this) {
                    // get slider object
                    var self = _this || this;
                    // set timer
                    self.activeWindowTimer = null;

                    self.API.pauseRotation = function (self) {
                        // stop timer
                        clearTimeout(self.activeWindowTimer);
                        // pause slider
                        self.playback(false).done(function () {
                            try {
                                // get inactive feedback
                                throw error.fetch('log', 'isInactive').func;
                            }
                            catch (e) {
                                // push feedback out to user
                                error.send('message', e);
                            }
                        });
                    };

                    self.API.playRotation = function (self) {
                        // set timer to resume after first delay
                        self.activeWindowTimer = setTimeout(function () {
                            try {
                                // get active feedback
                                throw error.fetch('log', 'isActive').func;
                            }
                            catch (e) {
                                // push feedback out to user
                                error.send('message', e);
                            }
                            finally {
                                // resume the slider
                                self.playback(self.auto);
                            }
                        }, self.delay);
                    };

                    // if tab is inactive
                    $(window).blur(function () {
                        self.API.pauseRotation(self);
                    });

                    // if tab is active
                    $(window).focus(function () {
                        self.API.playRotation(self);
                    });

                },

                // This method handles pause/play based whether the window is scrolling
                isScrolling: function (_this) {
                    // get slider object
                    var self = _this || this;
                    // set timer
                    var timer;

                    // if window is scrolled, pause the animation
                    $(window).scroll(function () {
                        // stop timer
                        clearTimeout(timer);

                        // set timer to resume after duration completes
                        timer = setTimeout(function () {
                            self.playback(self.auto);
                        }, self.delay);

                        // pause slider
                        self.playback(false);
                    });
                },

                // This method handles video support
                supportMedia: function (_this) {
                    // get slider object
                    var self = _this || this;

                    self.media = {

                        // Methods for YouTube video support
                        YT: {

                            video: function (_this) {
                                // get YouTube object
                                var _yt = _dtm.getYouTube();

                                // get slider object
                                var self = _this || this;
                                // get all YT iframes from slider
                                var videos = self.slider.find('iframe[src*="' + _yt.config.verify + '"]');

                                // check if videos exist
                                if (videos.length > 0) {
                                    // set array to store each new YT player
                                    self.media.YT.player = [];
                                }

                                // run limit to control instant refresh
                                var run = 0;

                                // private method that pauses all videos in a slider
                                var updateVideo = function () {
                                    // get all player objects
                                    $.each(self.media.YT.player, function (index, value) {
                                        // pause
                                        value.pauseVideo();
                                    });

                                    // resume slider
                                    self.play = true;

                                    // check if the element is either prev or next
                                    if ($(this).find('[data-dir]').length > 0 && run === 1) {
                                        // instant refresh the slider
                                        self.refresh(self, self.navCurrentElement.data('dir'));
                                        // reset run limit
                                        // otherwise, element is paginated
                                    } else if ($(this).find('[data-dir]').length === 0 && run === 1) {
                                        self.refresh(self, undefined);
                                    }
                                    run = 0;

                                };

                                $('html').on('dtm/youtube', function (yt) {
                                    // iterate each YT video
                                    videos.each(function (index, video) {
                                        yt.api[$(video).attr('id')].b.b.events.onReady = function (event) {
                                            self.slider.trigger('eflex/onYouTubeReady');
                                        };

                                        yt.api[$(video).attr('id')].b.b.events.onReady({
                                            target: yt.api[$(video).attr('id')],
                                            data: null
                                        });

                                        // re-assign the YT API back to the media player object
                                        self.media.YT.player[index] = yt.api[$(video).attr('id')];
                                    });
                                });

                                $('html').on('dtm/youtube/play', function (yt) {
                                    videos.each(function (index, video) {
                                        // get youtube video from slider and check if it is playing
                                        if (yt.api.data === 1 && $(yt.api.target.a).attr('id') === $(video).attr('id')) {
                                            // trigger custom eflex youtube event
                                            self.slider.trigger('eflex/onYouTubePlay');
                                            // pause slider state
                                            self.play = false;
                                            run = 1;
                                        }
                                    });
                                });

                                $('html').on('dtm/youtube/pause', function (yt) {
                                    videos.each(function (index, video) {
                                        // get youtube video from slider and check if it is paused
                                        if (yt.api.data === 2 && $(yt.api.target.a).attr('id') === $(video).attr('id')) {
                                            // trigger custom eflex youtube event
                                            self.slider.trigger('eflex/onYouTubePause');
                                            // resume slider state
                                            self.play = true;
                                        }
                                    });
                                });

                                $('html').on('dtm/youtube/end', function (yt) {
                                    videos.each(function (index, video) {
                                        // get youtube video from slider and check if it has ended
                                        if (yt.api.data === 0 && $(yt.api.target.a).attr('id') === $(video).attr('id')) {
                                            // trigger custom eflex youtube event
                                            self.slider.trigger('eflex/onYouTubeEnd');
                                            // resume slider state
                                            self.play = true;
                                            // update to the next slide
                                            self.refresh(self, 'next');
                                        }
                                    });
                                });
                            }

                        },

                        // Methods for standard HTML5 video support
                        HTML5: {

                            setRemote: function (_this) {
                                // get slider object
                                var self = _this || this;
                                // run limit to control instant refresh
                                var run = 0;

                                // private method that pauses all videos in a slider
                                var updateVideo = function () {

                                    // check if video is playing
                                    if (self.slider.find('video').length > 0) {
                                        // get all videos
                                        self.slider.find('video').each(function (index, value) {
                                            // pause
                                            value.pause();
                                        });
                                        // resume slider
                                        self.play = true;

                                        // check if the element is either prev or next
                                        if ($(this).find('[data-dir]').length > 0 && run === 1) {
                                            // instant refresh the slider
                                            self.refresh(self, self.navCurrentElement.data('dir'));
                                            // reset run limit
                                        }
                                        run = 0;
                                    }
                                };

                                // get each video in slider
                                self.slider.find('video').each(function () {
                                    // set run limit when video plays
                                    this.addEventListener('playing', function () { run = 1; });
                                });
                                self.slider.find('video').on('pause', updateVideo);

                                if (self.paginate !== false) {
                                    self.paginate.on('click', updateVideo);
                                }

                                if (self.nav !== false) {
                                    self.nav.on('click', updateVideo);
                                }

                            },

                            onCurrentVideo: function (_this) {
                                // get slider object
                                var self = _this || this;

                                // get current slide and check for video
                                var video = self.slides.eq(self.currentIndex).find('video');

                                // check if video is playing
                                if (video.length > 0 && !(video.get(0).paused)) {
                                    // pause slider
                                    self.play = false;
                                    // check when video finishes
                                    video.off().on('ended', function () {
                                        // resume slider
                                        self.play = true;
                                        self.refresh(self, 'next');
                                    });
                                }

                            },

                            video: function (_this) {
                                // get slider object
                                var self = _this || this;

                                // detect current video
                                self.media.HTML5.onCurrentVideo(self);
                                // set up remote
                                self.media.HTML5.setRemote(self);
                            }

                        }

                    };

                },

                setTouch: function () {
                    // get slider object
                    var self = this;
                    // set touch object
                    self.touch = {};
                    window.slider = {};
                    // set no equation property
                    self.touch.noEquation = false;

                    self.sliderInner.on('touchstart', function (event) {
                        // Test for flick
                        self.touch.longTouch = false;
                        // pause slider
                        self.playback(false);

                        setTimeout(function () {
                            window.slider.longTouch = true;
                        }, 250);

                        // Get the original touch position.
                        self.touch.touchstartx = event.originalEvent.touches[0].pageX;
                    });

                    self.sliderInner.on('touchmove', function (event) {
                        if (self.play) {
                            // Update touch position
                            self.touch.touchmovex = event.originalEvent.touches[0].pageX;
                            // Zero out multiplier
                            self.touch.multiplier = self.sliderType === 'revert' ? self.currentIndex : 0;
                            // Calcuate distance to translate slider inner
                            self.touch.movex = self.touch.multiplier * self.itemsWidth[self.currentIndex] + (self.touch.touchstartx - self.touch.touchmovex);

                            // get current slide
                            var $current = self.slides.eq(self.currentIndex);
                            // fetch next or first slide
                            var $next = $current.next().length > 0 ? $current.next() : self.slides.eq(0);
                            // fetch previous or last slide
                            var $prev = $current.prev().length > 0 ? $current.prev() : self.slides.eq(self.allSlides - 1);

                            switch (self.sliderType) {
                                case 'fade':
                                    // Set result
                                    self.touch.result = 0.5;

                                    // if swipe gesture moves past the initial touch
                                    if (self.touch.touchmovex > self.touch.touchstartx) {
                                        // set equation
                                        self.touch.equation = 1 + (self.touch.movex * 0.01);
                                        // display previous slide for current slide to fade into
                                        self.lazyLoad(self, {
                                            slide: $prev,
                                            complete: function () {
                                                $prev.css({ 'opacity': 1 });
                                            }
                                        });
                                    } else {
                                        // Set equation
                                        self.touch.equation = 1 - (self.touch.movex * 0.01);
                                        // display next slide for current slide to fade into
                                        self.lazyLoad(self, {
                                            slide: $next,
                                            complete: function () {
                                                $next.css({ 'opacity': 1 });
                                            }
                                        });
                                    }

                                    // Update opacity based on equation
                                    $current.css({ 'opacity': self.touch.equation });
                                    break;
                                case 'revert':
                                    // Set result
                                    self.touch.result = 0.5;
                                    // if swipe gesture moves past the initial touch
                                    if (self.touch.touchmovex > self.touch.touchstartx) {
                                        // set equation
                                        self.touch.equation = 1 - (self.touch.movex * 0.01);
                                    } else {
                                        // Set equation
                                        self.touch.equation = 1 - (self.touch.movex * 0.01);
                                    }
                                    switch (self.animationType) {
                                        case 'CSS3':
                                            self.sliderInner.css({
                                                'transition': 'none', 'transform': 'translate3d(' + -self.touch.movex + 'px, 0, 0)'
                                            });
                                            break;
                                        case 'jQuery':
                                        default:
                                            self.sliderInner.css({ 'left': -self.touch.movex });
                                            break;
                                    }
                                    break;
                                case 'carousel':
                                    switch (self.animationType) {
                                        case 'CSS3':
                                            $current.css({
                                                'transition': 'none', 'transform': 'translate3d(' + -self.touch.movex + 'px, 0, 0)'
                                            });
                                            break;
                                        case 'jQuery':
                                        default:
                                            $current.css({ 'left': -self.touch.movex });
                                            break;
                                    }
                                    break;
                            }
                        }
                    });

                    self.sliderInner.on('touchend', function (event) {
                        // Get the original touch position.
                        self.touch.touchendx = event.originalEvent.pageX;
                        // set status
                        self.touch.status = false;
                        // resume slider
                        self.playback(self.auto);

                        // get positive touch position
                        self.touch.absMove = Math.abs(self.currentIndex * self.itemsWidth[self.currentIndex] - self.touch.movex);

                        if (self.touch.absMove > self.itemsWidth[self.currentIndex] / 2 || self.touch.longTouch === false) {
                            // set direction
                            self.touch.dir = self.touch.movex > self.touch.multiplier * self.itemsWidth[self.currentIndex] ? 'next' : 'prev';

                            if (self.touch.touchstartx !== self.touch.touchendx) {
                                // set on before state
                                self.setCallback(self, 'onBefore').done(function () {
                                    // check if slider is active
                                    if (self.play) {
                                        // set transition and on complete, set on after state
                                        self.ready(self, self.currentIndex, self.touch.dir).done(function () {
                                            self.setCallback(self, 'onAfter');
                                        });
                                    }
                                });
                            } else {
                                switch (self.sliderType) {
                                    case 'fade':
                                        self.slides.eq(self.currentIndex).css({ 'opacity': 1 });
                                        break;
                                }
                            }
                        }
                    });

                },

                // This method handles all of the mechanics of the slider
                init: function () {
                    // get slider object
                    var self = this;

                    // 1. add class names
                    self.style(self, self.options);

                    // 2. set slide widths
                    self.cycle(self, true);

                    // 3. set slide coordinates
                    self.setSlides({ init: true, width: self.slides.outerWidth(true) });

                    // 4. check if slider will use a nav
                    build.nav('init', {
                        self: self,
                        nav: self.nav,
                        navType: self.navType,
                        target: self.slider
                    });

                    // 5. check if slider will use a paginate
                    build.paginate('init', {
                        self: self,
                        paginate: self.paginate,
                        paginateType: self.paginateType,
                        target: self.slider,
                        items: self.slides
                    });

                    // 6. add video support
                    self.supportMedia();

                    // 7. add swipe gesture support
                    if (self.swipe) {
                        self.setTouch();
                    }

                    self.API = Object.getPrototypeOf(self);
                    self.setCallback(self, 'onInit').done(function () {

                        // check if extend method has not been executed already
                        if (self.extendable === undefined) {
                            // run extend method and pause export
                            self.extend(false);
                        }

                        // check if slider supports video
                        if (self.mediaMode) {
                            // add html5 video support
                            self.media.HTML5.video(self);
                            // add YT video support
                            self.media.YT.video(self);
                        }

                        // 7. check if auto play is set
                        self.checkIfAutoPlay();

                        // 8. pause slider if user hovers it
                        if (self.pauseOnHover) {
                            master.browser('autoHover', {
                                obj: self,
                                el: self.slider,
                                auto: self.auto,
                                callback: self.playback
                            });
                        }

                        // 9. check if slider is responsive
                        self.isResponsive(self);

                        // 10. check if window is active
                        if (self.pauseOnInActiveWindow) {
                            self.isInActiveWindow(self);
                        }

                        // 11. check if window is scrolling
                        if (self.pauseOnScroll) {
                            self.isScrolling(self);
                        }

                    });
                }

            });

            slider(self.$elem, self.options, new $.Deferred());

        };

		<% } %>

		<% if (jQueryEflexScale)
    { %>

        /* @Scale
        * --------------------------------------------------------------------- *

            @desc : scales an element based on it's aspect ratio
            @params : accepts the element
            @demo :

                @Shorthand
                $('.video-js').eflex( 'scale' );

        * --------------------------------------------------------------------- */
        eflex.effects.scale = function (self, master, error) {

            var scale = construct(Object, function (scale, options, deferred) {

                /* element */
                this.scale = scale;

                /* scale element */
                this.scaleByElement = scale.data('eflex-scale-by') || options.scaleByElement || this.scale.parent();
                // when scale anchor can't be found or set to default, set anchor to direct parent
                if (this.scaleByElement.length === 0 || this.scaleByElement === 'default') {
                    this.scaleByElement = this.scale.parent();
                } else {
                    // get matching selector method from DOM traversal
                    this.getElementBy = scale.data('eflex-get-element-by') || options.getElementBy || false;
                    // get matching selector name from scale
                    this.matchSelector = scale.data('eflex-match-selector') || options.matchSelector;

                    // when a method is provided
                    if (this.getElementBy) {
                        try {
                            // set scale anchor based on method and match selector
                            this.scaleByElement = this.scale[this.getElementBy](this.matchSelector);

                            // when match can't be found, look for available scale anchor
                            if (this.scaleByElement.length === 0) {
                                this.scaleByElement = options.scaleByElement;
                            }
                        } catch (e) {
                            console.log(e.message);
                        }
                    }
                }

                /* coordinates */
                this.coords = {};

                /* callbacks */
                this.onInit = scale.data('eflex-on-init') || options.onInit || function () { };
                this.onBefore = scale.data('eflex-on-before') || options.onBefore || function () { };
                this.onAfter = scale.data('eflex-on-after') || options.onAfter || function () { };

                this.deferred = deferred;

                this.init();

            }, {

                resize: function () {
                    /*
                    var self = this,
                        par = self.container;
                    */
                    var self = this;

                    self.setCallback(self, 'onBefore').done(function () {
                        //par.css({ 'display' : 'block', 'width' : self.scaleByElement.width() });

                        master.calc('aspectRatio', {
                            el: self.scale,
                            newWidth: self.scaleByElement.width(),
                            oriWidth: self.coords.oriWidth,
                            oriHeight: self.coords.oriHeight
                        });

                        //par.css({ 'height' : self.scale.height() });

                        self.setCallback(self, 'onAfter');
                    });

                },

                // This method prepares the callback function to run
                setCallback: function (_this, status) {
                    // cache scroll object
                    var self = _this || this;

                    // trigger callback function
                    master.trigger('callback', {
                        onState: self[status] || self.onInit,
                        obj: self
                    });

                    // trigger eflex event
                    master.trigger('event', {
                        name: status + 'EflexScale',
                        data: {
                            detail: { eflex: self, master: master }
                        }
                    });

                    // trigger jQuery version of eflex event
                    self.scale.trigger({
                        type: 'eflex/scale/' + status,
                        self: self
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                init: function () {
                    var self = this;

                    self.setCallback(self, 'onInit').done(function () {
                        self.coords.oriWidth = self.scale.width();
                        self.coords.oriHeight = self.scale.height();

                        // get new dimensions
                        self.resize();

                        $(window).resize(function () {
                            self.resize();
                        });
                    });
                }
            });

            scale(self.$elem, self.options, new $.Deferred());

        }

		<% } %>

		<% if (jQueryEflexScroll)
    { %>

        /* @Scroll Effect
        * --------------------------------------------------------------------- *

            @desc : creates the Scroll effect
            @params : accepts the element, effect and action objects
            @demo :

                @Shorthand
                $('a[href^="#"]').eflex( 'scroll' );

                @Longhand
                $('[href^="#"]').eflex({
                    type: 'scroll',
                    duration: 1500,
                    easing: 'easeInOutExpo',
                    eventType: 'click',
                    target: $('html, body'),
                    onBefore: function ( self ) {
                        console.log( self );
                    },
                    onAfter: function ( self ) {
                        console.log( self );
                    }
                });

        * --------------------------------------------------------------------- */
        eflex.effects.scroll = function (self, master) {

            var scroll = construct(Object, function (scroll, options, deferred) {

                this.scroll = scroll;

                /* actions */
                this.eventType = scroll.data('eflex-event-type') || options.eventType || 'click';
                if (this.scroll.is('label') || this.scroll.is('input')) {
                    this.eventType = 'change';
                }

                // target
                this.target = master.calc('setDefault', {
                    setting: scroll.data('eflex-target'), default: master.calc('setDefault', {
                        setting: options.target, default: this.scroll.attr('href') || this.scroll
                    }).func
                }).func;

                if (typeof (this.target) === 'string') {
                    this.target = $(this.target);
                }

                // is triggerable
                this.trigger = master.calc('setDefault', {
                    setting: scroll.data('eflex-trigger'), default: master.calc('setDefault', {
                        setting: options.trigger, default: false
                    }).func
                }).func;

                // can freeze
                this.freeze = master.calc('setDefault', {
                    setting: scroll.data('eflex-freeze'), default: master.calc('setDefault', {
                        setting: options.freeze, default: false
                    }).func
                }).func;

                // set anchor
                this.anchor = master.calc('setDefault', {
                    setting: scroll.data('eflex-anchor'), default: master.calc('setDefault', {
                        setting: options.anchor, default: $('html, body')
                    }).func
                }).func;

                /* callbacks */
                this.onInit = scroll.data('eflex-on-init') || options.onInit || function () { };
                this.onBefore = scroll.data('eflex-on-before') || options.onBefore || function () { };
                this.onAfter = scroll.data('eflex-on-after') || options.onAfter || function () { };

                /* effects */
                this.duration = scroll.data('eflex-duration') || options.duration || 1500;
                this.easing = scroll.data('eflex-easing') || options.easing || 'easeInOutExpo';
                this.offset = scroll.data('eflex-offset') || options.offset;

                /* utility accessors */
                this.options = options;
                this.deferred = deferred;

                this.init();

            }, {

                transition: function (_this) {
                    var self = _this || this,
                        retargetOffsetTimer;

                    // check if anchor point is set
                    if (self.target.length > 0) {
                        // check if offset position is not set
                        // attempt to check if offset position doesn't exist in the anchor point
                        if (typeof (self.target.offset() == 'undefined')) {
                            var retargetOffset = function () {
                                clearTimeout(retargetOffsetTimer);
                                try {
                                    self.offset = $(self.target).offset().top;
                                } catch (e) {
                                    retargetOffsetTimer = setTimeout(retargetOffset, 100);
                                }
                            };
                            retargetOffset();
                            // assign offset based on anchor point's offset position
                        } else {
                            self.offset = $(self.target).offset().top;
                        }
                        //}

                        self.setCallback(self, 'onBefore').done(function () {
                            if (!self.freeze) {
                                self.anchor.stop().animate({
                                    scrollTop: self.offset
                                },
                                    self.duration, self.easing, function () {
                                        self.setCallback(self, 'onAfter');
                                    });
                            }
                        });
                    }

                    self.deferred.resolve();
                    return self.deferred.promise();
                },

                // This method prepares the callback function to run
                setCallback: function (_this, status) {
                    // cache scroll object
                    var self = _this || this;

                    // trigger on before callback function
                    master.trigger('callback', {
                        onState: self[status] || self.onInit,
                        obj: self
                    });

                    // trigger eflex slider event
                    master.trigger('event', {
                        name: status + 'EflexScroll',
                        data: {
                            detail: { eflex: self, master: master }
                        }
                    });

                    // trigger jQuery version of eflex slider event
                    self.scroll.trigger({
                        type: 'eflex/scroll/' + status,
                        self: self
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                init: function () {
                    var self = this;

                    self.setCallback(self, 'onInit').done(function () {
                        switch (self.trigger) {
                            case true:
                                self.transition(self);
                                break;
                            case false:
                                master.trigger('action', {
                                    el: self.scroll,
                                    actor: self.eventType,
                                    func: function (e) {
                                        e.preventDefault();
                                        self.transition(self);
                                    }
                                });
                                break;
                        }
                    });
                }

            });

            scroll(self.$elem, self.options, new $.Deferred());

        }

		<% } %>

		<% if (jQueryEflexStretch)
    { %>

        /* @Stretch
        * --------------------------------------------------------------------- *

            @desc : extends a container to fill up white space
            @params : accepts the effect, config and action objects
            @demo :

                @Shorthand
                $('.l-footer').eflex( 'stretch' );

        * --------------------------------------------------------------------- */
        eflex.effects.stretch = function (self, master) {

            var stretch = construct(Object, function (stretch, options, deferred) {

                /* element */
                this.stretch = stretch;
                this.max = 0;

                this.animationType = options.animationType || 'resize';

                this[this.animationType]();

            }, {

                max: 0,

                global: {
                    w: $(window).width(),
                    h: $(window).height()
                },

                elems: {
                    nodes: {
                        html: null,
                        h: 0
                    },
                    target: {
                        html: null,
                        h: 0
                    }
                },

                match: function () {
                    var res = (this.max < this.global.h) ? true : false;
                    return res;
                },

                cycle: function (target, nodes) {
                    var self = this;

                    nodes.each(function (index, value) {
                        switch ($(value).get(0).tagName) {
                            case 'LINK': case 'SCRIPT': case 'IFRAME': case 'STYLE':
                                break;
                            default:
                                // check if element is not part of the HUD snippet editor
                                if (typeof $(value).data('sn-id') === 'undefined') {
                                    self.max += $(value).outerHeight(true);
                                }
                                break;
                        }
                    });

                    return this.match();
                },

                init: function () {
                    var target = this.stretch,
                        nodes = target.siblings();

                    this.elems.nodes.html = nodes;
                    this.elems.nodes.h = nodes.outerHeight(true);

                    this.elems.target.html = target;
                    this.elems.target.h = target.outerHeight(true);

                    return this.cycle(target, nodes);
                },

                resize: function () {

                    if (this.init() != false) {
                        var vh = this.global.h - this.max;
                        this.elems.target.html.outerHeight(vh);
                    } else {
                        var th = this.elems.target.html.h;
                        this.elems.target.html.height(th);
                    }

                },

                bottom: function (elem) {
                    $('html, body').addClass('js-eflex--viewport');

                    if (this.init(elem) != false) {
                        this.elems.target.html.addClass('js-eflex--stretch');
                    } else {
                        this.elems.target.html.removeClass('js-eflex--stretch');
                    }
                }

            });

            stretch(self.$elem, self.options, new $.Deferred());

        }

		<% } %>

		<% if (jQueryEflexGroup)
    { %>

		/* @Group
		* --------------------------------------------------------------------- *

			@desc : extends a container to fill up white space
			@params : accepts the effect, config and action objects
			@demo :

				@Shorthand
				$('.c-brand--form--seminar').eflex( 'group' );

				@Longhand
				$('.c-brand--form--seminar').eflex({
					type : 'group',
					group : 'data-group',
					title : 'data-title',
					content : 'data-content',
					custom : 'data-seminar-area-group'
				});

		* --------------------------------------------------------------------- */
        eflex.effects.group = function (self, master) {

            var group = construct(Object, function (group, options, deferred) {

                /* element */
                this.el = group;
                this.group = options.group || 'data-group';
                this.item = options.item || 'data-item';
                this.content = options.content || 'data-content';

                this.el.trigger({ type: 'eflex/group/onInit', self: this });
                this.cycle();

            }, {

                // set attribute array
                a: [],

                cycle: function () {
                    // get group object
                    var self = this;

                    // iterate each group item
                    this.el.children().each(function (index, value) {
                        // get attribute and add to attribute array
                        self.a.push(value.getAttribute(self.group));
                    });

                    // run bundle method
                    this.bundle();
                },

                filter: function (a) {
                    var counts = {};
                    for (var i = 0; i <= a.length; i++) {
                        if (counts[a[i]] === undefined) {
                            counts[a[i]] = 1;
                        } else {
                            ++counts[a[i]];
                        }
                    }
                    return counts;
                },

                query: function (attr, value) {
                    return '[' + attr + '="' + value + '"]';
                },

                bundle: function () {
                    // get group object
                    var self = this;

                    // iterate each attribute value from array
                    $.each(this.filter(this.a), function (key, value) {
                        var groupAttr = self.query(self.group, key),
                            itemAttr = self.query(self.item, key);

                        var group = self.el.find(groupAttr),
                            item = self.el.find(itemAttr);

                        if (value > 1) {
                            item.appendTo(group);
                            group.slice(1).remove();
                        }
                        self.wrap(item, key);
                    });
                },

                wrap: function (item, key) {
                    var self = this;
                    item = self.el.find(self.query(self.item, key));
                    item.wrapAll($(document.createElement('div'))
                        .attr(self.content || self.group, key));

                    self.el.trigger({ type: 'eflex/group/onAfter', self: self });
                }

            });

            group(self.$elem, self.options, new $.Deferred());

        }

		<% } %>

		<% if (jQueryEflexSwap)
    { %>

		/* @Swap
		* --------------------------------------------------------------------- *

			@desc : swaps between items revealing the selected item while hidling the rest
			@params : accepts the effect, config and action objects
			@demo :

				@Shorthand
				$('.c-brand--form--seminar').eflex( 'swap' );

				@Longhand
				$('.c-brand--form--seminar').eflex({
					type : 'swap',
					group : 'data-group',
					title : 'data-title',
					classes : 'select'
					eventType : 'click',
					startEffect : 'slideDown',
					endEffect : 'slideUp',
					duration : 400,
					easing : 'swing',
					isVisible : undefined,
					onAfter : function(self) {

					}
				});

		* --------------------------------------------------------------------- */
        eflex.effects.swap = function (self, master, build, error) {

            var swap = construct(Object, function (swap, options, deferred) {
                /* element */
                this.swap = swap;

                /* counter */
                this.count = 0;

                /* controller */
                this.pause = false;

                /* html hooks */
                this.title = options.title || 'data-title';
                this.content = options.content || 'data-content';
                this.custom = options.custom || 'data-custom';
                this.group = options.group || 'data-group';
                this.ungrouped = options.ungrouped || 'data-has-ungrouped-seminars';
                this.active = options.active || 'data-active-classes';

                this.$active = $(master.search('selectAttr', {
                    attr: this.active
                }).func);

                this.toggleActiveClasses = this.$active.attr(this.active);

                // check if browser supports 3d transforms
                var support3d = master.search('style', {
                    prop: 'transform',
                    value: 'translate3d(0px, 0px, 0px)',
                    prefix: true
                }).func;

                if (support3d.value !== false) {
                    // set animation style (jQuery or CSS3)
                    this.animationType = options.animationType || 'jQuery';
                } else {
                    this.animationType = 'jQuery';
                }

                /* effects & animation */
                this.startEffect = options.startEffect || 'slideDown';
                this.endEffect = options.endEffect || 'slideUp';

                /* speed & easing */
                switch (this.startEffect || this.endEffect) {
                    case 'show':
                    case 'hide':
                        this.duration = null;
                        this.easing = null;
                        break;
                    default:
                        this.duration = options.duration || 400;
                        this.easing = master.calc('easing', {
                            easing: options.easing, animationType: this.animationType
                        }).func || 'linear';
                        break;
                }

                /* css hook */
                this.classes = options.classes || 'select';
                this.activeClasses = options.activeClasses || 'animate-and-fade-in';
                this.inactiveClasses = options.inactiveClasses || 'animate-and-fade-out';

                /* event type */
                this.eventType = options.eventType || 'click';

                /* deferred */
                this.deferred = deferred;

                /* visibility */
                this.isVisible = options.isVisible;
                this.freeze = options.freeze || false;

                /* ADA support | enable aria attribution */
                this.enableAria = master.calc('setDefault', {
                    setting: swap.data('eflex-aria'), default: master.calc('setDefault', {
                        setting: options.enableAria, default: false
                    }).func
                }).func;

                /* callback */
                this.onInit = options.onInit || function () { };
                this.onBefore = options.onBefore || function () { };
                this.onAfter = options.onAfter || function () { };
                this.linkto = options.linkto || null;

                /* init */
                // invoke pre-callback function
                master.trigger('callback', this.onInit(this));
                // invoke custom initalizer method
                this.swap.trigger({ type: 'eflex/swap/onInit', self: this });

                // check if visibility is hidden and pre-hide all tabs
                if (this.isVisible === undefined || this.isVisible === false) {
                    this.disappear();
                }
                this.stealth();

            }, {

                disappear: function () {
                    // get swap object
                    var self = this;
                    // iterate each item
                    this.swap.each(function (index, value) {
                        // get content attribute
                        var name = $(value).attr(self.content);

                        // get title attribute selector
                        var title = $(value).find(master.search('selectAttr', {
                            attr: self.title,
                            value: name
                        }).func);

                        // get content attribute selector
                        var content = $(value).find(master.search('selectAttr', {
                            attr: self.content,
                            value: name
                        }).func);

                        // check animation type
                        switch (self.animationType) {
                            // if using CSS3 animation
                            case 'CSS3':
                                group.css({
                                    'max-height': 0, 'overflow': 'hidden',
                                    'transition': 'all ' + self.duration + 'ms ' + self.easing
                                });
                                break;
                            // if using jQuery animation
                            case 'jQuery':
                                content.hide();
                                break;
                        }

                        // check if aria attribution is supported
                        if (self.enableAria) {
                            // set aria expanded to false | aria hidden to true
                            title.attr('aria-expanded', false);
                            content.attr('aria-hidden', true);
                        }
                    });
                },

                shadowDance: function (obj, visible) {
                    $.each(obj, function (index, value) {
                        $(value)[visible]();
                    });
                },

                move: function ($this, title, content) {
                    // get swap object
                    var self = this;

                    // get value of current title
                    var link = $this.attr(self.title);
                    // get title within the scope of the current swap model
                    var $title = self.swap.find(title);
                    // get content within the scope of the current swap model
                    var $content = self.swap.find(content);

                    // clear all instances of css hook
                    $title.removeClass(self.classes)
                        .find(self.$active).removeClass(self.toggleActiveClasses);

                    // iterate through all items and check for a match
                    master.search('cycle', {
                        obj: $title,
                        callback: function (index, value, args) {
                            if ($(value).attr(self.title) === link) {
                                // check for visibility and if not frozen
                                self.switchClass = $(args[index]).is(':visible') && !(self.freeze) ? 'removeClass' : 'addClass';
                                // add css hook to current item
                                $(value)[self.switchClass](self.classes);

                                // check if aria attribution is supported
                                if (self.enableAria) {
                                    // update aria expanded status
                                    $(value).attr('aria-expanded', $(args[index]).is(':visible') && !(self.freeze) ? false : true);
                                }

                                // check if data active attribute exists
                                if ($(value).find(self.$active).length > 0) {
                                    // convert data active attribute value to css class
                                    $(value).find(self.$active)[self.switchClass](self.toggleActiveClasses);
                                }
                            }
                        },
                        args: $content
                    });

                    // iterate through all items and check for a match
                    master.search('cycle', {
                        obj: $content,
                        callback: function (index, value, args) {
                            if ($(value).attr(self.content) === args) {
                                // check for visibility and if not frozen
                                self.toggleEffect = $(value).is(':visible') && !(self.freeze) ? self.endEffect : self.startEffect;

                                // run start effect on active item
                                $(value)[self.toggleEffect](self.duration, self.easing).promise().then(function () {
                                    // check if aria attribution is supported
                                    if (self.enableAria) {
                                        // update aria hidden status
                                        $(value).attr('aria-hidden', $(value).is(':visible') && !(self.freeze) ? false : true);
                                    }

                                    // scroll to active item
                                    try {
                                        $(value).eflex({
                                            type: 'scroll',
                                            target: $($(value).attr(self.content)),
                                            trigger: true,
                                            duration: self.duration,
                                            easing: self.easing
                                        });
                                    } catch (e) {
                                        console.log(e.message);
                                    }
                                });
                            } else {
                                // check if linkto option exists and if tabs aren't frozen
                                if (self.linkto === null && !self.freeze) {
                                    // run end effect on inactive items
                                    $(value)[self.endEffect](self.duration, self.easing);
                                }
                            }
                        },
                        args: $this.attr(self.title)
                    });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                getOnBefore: function (_this, title, content) {
                    // get swap object
                    var self = this;

                    // invoke pre-callback function
                    master.trigger('callback', self.onBefore(self, _this, title, content));
                    // invoke custom event before swap effect fires
                    self.swap.trigger({ type: 'eflex/swap/onBefore', self: self, _this: _this, title: title, content: content });

                    // resolve deferred state and return complete status
                    return master.deferred('promise', self.deferred).func;
                },

                stealth: function (_this, $elem, trigger) {
                    // get swap object
                    var self = _this || this;
                    // set title selector
                    var title = master.search('selectAttr', { attr: self.title }).func;
                    // set content selector
                    var content = master.search('selectAttr', { attr: self.content }).func;

                    // check if aria attribution is supported
                    if (self.enableAria) {
                        // add tabulation support
                        self.swap.find(title).attr('tabindex', 0);
                        // NOTE: let the screen reader interpret the content inside immediately instead of reading it as a group
                        //self.swap.find(content).attr('tabindex', 0);
                    }

                    var onReady = function ($elem) {
                        // reveal current item
                        self.move($elem, title, content).done(function () {
                            // run post-callback function
                            master.trigger('callback', self.onAfter(self, $elem, title, content));
                            // invoke custom event after swap effect fires
                            self.swap.trigger({ type: 'eflex/swap/onAfter', self: self, $elem: $elem, title: title, content: content });
                        });
                    };

                    if (trigger) {
                        onReady($elem);
                    } else {
                        // set event type
                        self.swap.find(title).off().on(self.eventType, function () {
                            // get current item
                            var $elem = $(this);

                            // run pre-callback function
                            self.getOnBefore($elem, title, content).done(function () {
                                if (!self.pause) {
                                    onReady($elem);
                                }
                            });
                        });
                    }

                },

                toggle: function (obj, el) {
                    // get swap object
                    var self = this;
                    var $form = $(master.search('selectAttr', { attr: self.custom }).func);
                    var $form__target = $(document.getElementById($form.attr(self.custom)));
                    $form__target = $form__target.length > 0 ? $form__target : $form;

                    // check if item has css hook and count is set to 0
                    if (el.$this.hasClass(self.classes) && self.count === 0) {
                        // hide items, containers and linkto
                        master.search('cycle', {
                            obj: {
                                a: self.swap,
                                b: obj.container,
                                d: obj.linkto
                            },
                            callback: function (index, value, args) {
                                value.hide();
                            }
                        });

                        // show current item, items container and form
                        master.search('cycle', {
                            obj: {
                                a: self.wrap,
                                b: self.wrap.closest(obj.container),
                                c: $form
                                    .removeClass(self.inactiveClasses)
                                    .addClass(self.activeClasses),
                                d: self.wrap.closest($(master.search('selectAttr', {
                                    attr: self.content
                                }).func)),
                                e: obj.linkback,
                                f: el.$this.find(obj.linkto)
                            },
                            callback: function (index, value, args) {
                                value.show();
                                // check if we're working with the form
                                if (index === 'c') {
                                    // scroll to the form
                                    try {
                                        setTimeout(function () {
                                            $form__target.eflex({
                                                type: 'scroll',
                                                trigger: true
                                            }).focus();
                                        }, 100);
                                    } catch (e) {
                                        console.log(e.message);
                                    }
                                }
                            }
                        });

                        master.search('cycle', {
                            obj: $(master.search('selectAttr', {
                                attr: self.content
                            }).func),
                            callback: function (index, value, args) {
                                if ($(value).attr(self.content) === args) {
                                    $(value).show();
                                } else {
                                    $(value).hide();
                                }
                            },
                            args: el.$this.attr(self.title)
                        });

                        // update count to 1
                        self.count = 1;
                    }
                },

                collapse: function (obj, el) {
                    // get swap object
                    var self = this;
                    self.linkto = obj.linkto;
                    // get closest wrapper by it's content attribute
                    self.wrap = el.$this.closest($(master.search('selectAttr', {
                        attr: self.content
                    }).func));

                    // check if linkto option exists
                    if (obj.linkto.length === 0) {
                        self.toggle(obj, el);
                    } else {
                        // reset all linktos
                        obj.linkto.hide();
                        // show current linkto
                        self.wrap.find(obj.linkto).show();

                        // set event type
                        master.trigger('action', {
                            el: obj.linkto,
                            actor: 'click',
                            func: function (e) {
                                self.toggle(obj, el);
                            }
                        });
                    }

                    self.reset(obj);
                    return false;
                },

                reset: function (obj) {
                    var self = this;

                    // set event type
                    master.trigger('action', {
                        el: obj.linkback,
                        actor: 'click',
                        func: function (e) {
                            // hide items, containers and linkto
                            master.search('cycle', {
                                obj: {
                                    a: $(this),
                                    b: $(master.search('selectAttr', {
                                        attr: self.custom
                                    }).func)
                                        .removeClass(self.activeClasses)
                                        .addClass(self.inactiveClasses),
                                    c: $(master.search('selectAttr', {
                                        attr: self.group
                                    }).func),
                                    d: obj.linkto
                                },
                                callback: function (index, value, args) {
                                    if (self.swap.closest(master.search('selectAttr', {
                                        attr: self.ungrouped
                                    }).func).length > 0) {
                                        if (index === 'a') {
                                            value.hide();
                                        }
                                    } else {
                                        if (!self.isVisible) {
                                            value.hide();
                                        } else {
                                            if (index !== 'c') {
                                                value.hide();
                                            }
                                        }
                                    }
                                }
                            });

                            // look for closest aria attribute and set focus to it
                            try {
                                obj.container.eq(0).find(master.search('selectAttr', { attr: 'aria-expanded' }).func).focus();
                            } catch (e) {
                                console.log(e.message);
                            }

                            // show current item, items container and form
                            master.search('cycle', {
                                obj: {
                                    a: obj.container,
                                    c: $(master.search('selectAttr', {
                                        attr: self.content
                                    }).func),
                                },
                                callback: function (index, value, args) {
                                    value.show();
                                }
                            });

                            self.$active.removeClass(self.toggleActiveClasses);

                            // remove css class trigger
                            $(document.getElementsByClassName(self.classes)).each(function (key, val) {
                                $(val).removeClass(self.classes);
                            });

                            // clear any checkboxes
                            $(master.search('selectAttr', {
                                attr: self.title
                            }).func).each(function (key, val) {
                                $(val).find('input').prop('checked', false);
                            });

                            self.count = 0;

                            return false;
                        }
                    });
                }

            });

            swap(self.$elem, self.options, new $.Deferred());

        }

		<% } %>

		<% if (jQueryEflexPlay)
    { %>

		/* @Play
		* --------------------------------------------------------------------- *

			@desc : swaps between items revealing the selected item while hidling the rest
			@params : accepts the effect, config and action objects
			@demo :

				@Shorthand
				$('.video-playlist').eflex( 'play' );

				@Longhand
				$('.video-playlist').eflex({
					type : 'play',
					paginate : $('#playlist')
				});

		* --------------------------------------------------------------------- */
        eflex.effects.play = function (self, master, build, error) {

            var play = construct(Object, function (play, options, deferred, selector) {

                // player
                this.play = play;
                this.selector = selector;
                this.source = play.data('eflex-source') || options.source || null;
                this.sourceCount = this.source.split(',').length || 0;

                // classes
                this.activeClass = play.data('eflex-active-class') || options.activeClass || 'is-selected';

                // video support
                this.isNative = this.play.hasClass('video-js') ? false : true;
                this._yt = _dtm.getYouTube();
                this._v = _dtm.getVimeo();

                // api support
                this.api = options.api || {};
                this.api.vimeo = 'vimeo' in this.api
                    ? this.api.vimeo : 'api' in _dtm
                        ? _dtm.api.vimeo : {};

                this.api.youtube = 'youtube' in this.api
                    ? this.api.youtube : 'api' in _dtm
                        ? _dtm.api.youtube : {};

                // nav
                this.nav = master.calc('setDefault', {
                    setting: play.data('eflex-nav'), default: master.calc('setDefault', {
                        setting: options.nav, default: true
                    }).func
                }).func;

                this.navType = options.navType || 'button';
                this.navLabel = options.navLabel || 'next';
                this.navCurrentElement = undefined;

                // paginate
                this.paginate = master.calc('setDefault', {
                    setting: play.data('eflex-paginate'), default: master.calc('setDefault', {
                        setting: options.paginate, default: true
                    }).func
                }).func;
                this.paginateType = play.data('eflex-paginate-type') || options.paginateType || 'li';
                this.paginateCurrentElement = undefined;

                // event type
                this.eventType = master.calc('setDefault', {
                    setting: play.data('eflex-event-type'), default: master.calc('setDefault', {
                        setting: options.eventType, default: 'click'
                    }).func
                }).func;

                // callback
                this.onAfter = options.onAfter || function () { };



                // init
                this.init();

            }, {

                insert: function () {
                    // get play object
                    var self = this;

                    // remove active state from links
                    self.paginate.find(self.paginateType)
                        .removeClass(self.activeClass);

                    // add active state to current link
                    self.paginateCurrentElement.addClass(self.activeClass);

                    // iterate each video object
                    master.search('cycle', {
                        obj: self.source.split(','),
                        callback: function (index, value, args) {
                            // strip white-spaces
                            value = value.replace(' ', '');

                            // check if current link id matches id of video object id
                            if (index === args) {
                                try {
                                    _dtm.controlHTML5Video({ video: self.play });
                                    // check if using native HTML5 video
                                    switch (self.isNative) {
                                        case true:
                                            // get video element by it's selector
                                            var video = document.querySelector(self.selector);
                                            // get jQuery version of video element
                                            var $video = $(video);

                                            // iterate each source tag and update type and source attributes
                                            master.search('cycle', {
                                                obj: $video.find('source'),
                                                callback: function (k, v) {
                                                    // get extension names
                                                    var ext = $(v).attr('src').substr($(v).attr('src').lastIndexOf('.') + 1);
                                                    // update source attribute
                                                    v.setAttribute('src', value + '.' + ext);
                                                    // update type attribute
                                                    v.setAttribute('type', $(v).attr('type') || 'video/' + ext);
                                                }
                                            });

                                            // load new video
                                            $video.load();
                                            // play new video
                                            video.play();
                                            break;
                                        case false:
                                            // check which API is being used
                                            switch (true) {
                                                // if using YouTube API
                                                case self._yt.isYouTubeLoaded:
                                                    // update player by YouTube ID
                                                    self.api.youtube[self.play.attr('id')].loadVideoById(value);
                                                    break;
                                                // if using Vimeo JS API
                                                case self._v.isVimeoLoaded:
                                                    // update player by Vimeo ID
                                                    self.api.vimeo[self.play.attr('id')].loadVideo(value).then(function (id) {
                                                        // play updated video
                                                        self.api.vimeo[self.play.attr('id')].play();
                                                    });
                                                    break;
                                                // if using Video JS API as default
                                                case self.play.hasClass('video-js'):
                                                default:
                                                    _V_(self.selector).src([
                                                        { type: 'video/mp4', src: value + '.mp4' },
                                                        { type: 'video/webm', src: value + '.webm' },
                                                        { type: 'video/ogg', src: value + '.ogv' }
                                                    ]);
                                                    _V_(self.selector).play();
                                                    break;
                                            }
                                            break;
                                    }
                                    // enable paginate link
                                    build.dynamic('enableLink', { links: self.paginate, linkType: self.paginateType });
                                } catch (e) {
                                    console.log(e.message);
                                }
                            }
                        },
                        // current link outputs numeric id
                        args: self.paginateCurrentElement.data('js-eflex-index')
                    });
                },

                filterSource: function () {
                    // get play object
                    var self = this;

                    // check the video tag
                    switch (self.play.get(0).nodeName) {
                        // check if the video is an iframe
                        case 'IFRAME':
                            switch (true) {
                                // check if iframe points to YouTube
                                case self._yt.verifyYouTubeBySrc({ $id: self.play }):
                                    self._yt.isYouTubeLoaded = true;
                                    break;
                                // check if iframe points to Vimeo
                                case self._v.verifyVimeoBySrc({ $id: self.play }):
                                    self._v.isVimeoLoaded = true;
                                    break;
                                default:
                                    break;
                            }
                            // disable native mode
                            self.isNative = false;
                            break;
                    }
                },

                init: function () {
                    // get play object
                    var self = this;

                    // check source out
                    self.filterSource();

                    // set up paginated list of video links
                    build.paginate('init', {
                        self: self,
                        paginate: self.paginate,
                        paginateType: self.paginateType,
                        target: self.play,
                        items: self.sourceCount
                    });

                    self.onAfter(self);
                }
            });

            play(self.$elem, self.options, new $.Deferred(), self.selector);

        }

		<% } %>

        // Swap Method
        _dtm.swap = function ($elem, $target, css, scrollByElement, logic) {

            $elem = $elem || $('[data-swap-nav]');
            $target = $target || $('[data-swap-target]');
            css = css || 'slide-from-bottom';
            scrollByElement = scrollByElement || $(window);

            var logic = logic || function () {
                if (window.scrollY > $target.position().top) {
                    return true;
                } else {
                    return false;
                }
            };

            var swap = function () {
                if (logic(scrollByElement)) {
                    if (!($elem.hasClass(css))) {
                        $elem.addClass(css);
                    }
                } else {
                    if ($elem.hasClass(css)) {
                        $elem.removeClass(css);
                    }
                }
            };

            swap();
            scrollByElement.on('scroll', swap);
        }

        _dtm.AddFancyboxClass = function () {

            var $this = $(this);
            var attr = $($this).attr("data-fancybox-url");

            if (typeof attr == typeof undefined || attr == false) {
                $this = $('[data-fancybox-url]');
            }

            // check if the node is an anchor node
            if ($this.is('a')) {
                // check if the href is pointing to the snippet file
                if ($this.attr('href').match(/shared\/snippet.html/, 'i')) {
                    // add snippet method for support
                    $this.attr('data-fancybox-method', 'snippet');
                }
                // replace href with fancybox url and add the class along with ajax request
                $this.attr('href', $this.attr('data-fancybox-url')).addClass('has-fancybox fancybox.ajax');
            }
        };

        _dtm.eflexLink = function (selector, args) {
            var setEflexState = function (event) {
                var data = event.detail;
                if (data != null && data.key != null && data.state != null) {
                    var item = _dtm.ShoppingCart.items[data.key];
                    if (item != null) {
                        switch (data.state.toLowerCase()) {
                            case "add":
                                _eflex.link.methods.add(item);
                                break;
                            case "update":
                                _eflex.link.methods.update(item);
                                break;
                            case "remove":
                                _eflex.link.methods.remove(item);
                                break;
                        }
                    }
                }
            };

            var setEflexLink = function (selector) {
                $(selector).eflex({
                    type: 'link',
                    disableAfter: args.disableAfter,
                    eventType: args.eventType,
                    preserveContent: args.preserveContent,
                    swapClasses: args.swapClasses,
                    toggle: args.toggle,
                    text: args.text,
                    classes: args.classes,
                    onInit: function () {
                        // set args object
                        args = args || {};
                        // get jQuery object
                        args.$elem = $(selector) || $('[data-code]');

                        // get data-attribute name
                        var data = selector,
                            data = data.replace(/[\[\]']+/g, ''),
                            data = data.substr(data.indexOf('-') + 1);

                        // add flag to ensure execution happens once
                        var readyMethodState = false;

                        if (_dtm.ShoppingCart.items[this.obj.link.data(data)] == null) {
                            _dtm.ShoppingCart.items[this.obj.link.data(data)] = this.obj;
                        }
                        else {
                            if (_dtm.ShoppingCart.items[this.obj.link.data(data)].additionalLinks == null) {
                                _dtm.ShoppingCart.items[this.obj.link.data(data)].additionalLinks = [];
                            }
                            _dtm.ShoppingCart.items[this.obj.link.data(data)].additionalLinks.push(this.obj.link);
                        }

                        registerEvent('ChangeToggleButtonState', setEflexState);

                        if (!readyMethodState) {
                            // set access point to eflex link
                            _eflex.link = { methods: Object.getPrototypeOf(this.obj) };
                            // set ready state to true
                            readyMethodState = true;
                        }

                        triggerEvent('ToggleButtonInitialized');
                        args.onInit(this.obj);
                    },
                    onBefore: args.onBefore,
                    onAfter: args.onAfter
                });
            };

            // strip white-spaces and set new array based on comma separation
            var getSelectors = selector.replace(' ', '').split(',');
            // check if we're passing multiple data attribute names
            if (getSelectors.length > 1) {
                // iterate each data attribute name
                $.each(getSelectors, function (k, v) {
                    setEflexLink(v);
                });
                // otherwise, assume we're working with a single data attribute name
            } else {
                setEflexLink(selector);
            }

        };

        // Shopping Cart support with jQuery Eflex Link
        _dtm.ShoppingCart.eflexLink = function (args) {
            // set args object
            args = args || {};
            // get jQuery object
            args.$elem = args.$elem || $('[data-code]');

            // get data-attribute name
            var data = args.$elem.selector,
                data = data.replace(/[\[\]']+/g, ''),
                data = data.substr(data.indexOf('-') + 1);

            // add flag to ensure execution happens once
            var readyMethodState = false;
            var readyCartChange = false;

            var filterItems = function () {
                // get items from cart
                var items = _dtmShoppingCart.SearchItems();
                // set new deferred
                var $d = new $.Deferred();

                // get each item
                for (var i = 0; i < items.length; i++) {
                    // check if product code doesn't exist
                    if (typeof _dtm.ShoppingCart.items[items[i].id] === 'undefined') {
                        // get all product codes from the cart
                        for (var item in _dtm.ShoppingCart.items) {
                            // check if product codes match
                            if (items[i].id.match(new RegExp(item, 'i'))) {
                                // assign product code to id
                                items[i].id = item;
                                // add new product match
                                items[item] = items[i];
                            }
                        }
                    }
                }

                // get each item from cart
                for (var item in _dtm.ShoppingCart.items) {
                    // check if product code is not undefined
                    if (typeof items[item] !== 'undefined') {
                        // update counter with quantity
                        _dtm.ShoppingCart.items[items[item].id].counter = items[item].qty;
                        // invoke add method on element
                        _eflex.link.methods.add(_dtm.ShoppingCart.items[item]);
                        // otherwise, assume quantity is zeroed out
                    } else {
                        // invoke remove method on element
                        _eflex.link.methods.remove(_dtm.ShoppingCart.items[item]);
                    }
                }

                $d.resolve();
                return $d.promise();
            };

            var updateCart = function () {
                // check if ready state is false
                if (!readyCartChange) {

                    filterItems().done(function () {
                        args.$elem.trigger({ type: 'dtm/eflex/cartReady', self: args });
                    });
                    // change state to false
                    readyCartChange = true;

                    // otherwise, update on user interaction with eflex link
                } else if (typeof (args.getItem) !== 'undefined') {
                    // get current item
                    var item = _dtmShoppingCart.SearchItems(args.getItem);

                    // check if toggle mode is enable and if counter is not zeroed out
                    if (args.toggle && _dtm.ShoppingCart.items[args.getItem].counter > 0) {

                        if (typeof (args.getItem) !== 'undefined') {
                            // get action code
                            var ac = $('input[name*=ActionCode][value*=' + args.getItem + ']');
                            // check if action code exists
                            if (ac.length > 0) {
                                // get value of action code
                                var index = ac.attr('name').replace('ActionCode', '');
                                // get action quantity based on action code value
                                var aq = $('#ActionQuantity' + index);

                                // check if action quantity exists
                                if (aq.length > 0) {
                                    // zero out action quantity
                                    aq.val('0');
                                    // push update to framework
                                    aq.trigger('change');
                                    // update counter with quantity
                                    _dtm.ShoppingCart.items[args.getItem].counter = 0;
                                    // invoke remove method on element
                                    _eflex.link.methods.remove(_dtm.ShoppingCart.items[args.getItem]);
                                }
                            }
                        }

                        // otherwise, check if items have been added to cart
                    } else if (item.TotalQuantity > 0) {
                        // update counter with quantity
                        _dtm.ShoppingCart.items[args.getItem].counter = item.qty;
                        // invoke add method on element
                        //_eflex.link.methods.add(_dtm.ShoppingCart.items[args.getItem]);
                        filterItems();
                        // otherwise, assume quantity is zeroed out
                    } else {
                        // invoke remove method on element
                        _eflex.link.methods.remove(_dtm.ShoppingCart.items[args.getItem]);
                    }
                    // delete the current item reference
                    delete args.getItem;

                    // otherwise, update based on user action with shopping cart
                } else {
                    filterItems().done(function () {
                        args.$elem.trigger({ type: 'dtm/eflex/cartReady', self: args });
                    });
                }
            };

            // run eflex link
            args.$elem.eflex({
                type: 'link',
                disableAfter: args.disableAfter,
                eventType: args.eventType,
                preserveContent: args.preserveContent,
                swapClasses: args.swapClasses,
                toggle: args.toggle,
                text: args.text,
                classes: args.classes,
                onInit: function () {
                    // get toggle status
                    args.status = this.obj.status;

                    // check if there are multiple instances of the same data attribute
                    if (this.obj.link.data(data) in _dtm.ShoppingCart.items) {
                        // re-target element based on attribute selector
                        _dtm.ShoppingCart.items[this.obj.link.data(data)].link = $(master.search('selectAttr', {
                            attr: 'data-' + data,
                            value: this.obj.link.data(data)
                        }).func);
                        // otherwise, assign eflex link to the items object
                    } else {
                        _dtm.ShoppingCart.items[this.obj.link.data(data)] = this.obj;
                    }

                    if (!readyMethodState) {
                        // set access point to eflex link
                        _eflex.link = { methods: Object.getPrototypeOf(this.obj) };
                        // set ready state to true
                        readyMethodState = true;
                    }

                    args.onInit(this.obj);
                },
                onBefore: args.onBefore,
                onAfter: args.onAfter
            });

            // intercept after event
            args.$elem.on('eflex/link/onAfter', function (eflex) {
                // get current item
                args.getItem = eflex.self.link.attr('data-' + data);
                // get current status
                args.getStatus = eflex.self.status;
            });

            // listen for cart change
            registerEvent('CartChange', updateCart);
        };

        // Redirect Method
        _dtm.redirect = function (url) {
            var s = window.location.href.split('?');
            var query = '';
            var regex = '<%= SettingsManager.ContextSettings["Seminar.UrlParameterFilter"] ?? "(o)" %>';

            try {
                regex = RegExp(regex, 'i');
            } catch (e) {

            }

            if (s[1] != undefined) {
                var qs = s[1].split('&');
                $(qs).each(function (index, value) {
                    if (!regex.test(value)) {
                        query += value + '&';
                    }
                });
            }

            query = query.substring(0, query.length - 1);
            var q = query != null && query != '' ? (url.indexOf('?') < 0 ? '?' : '&') + query : '';

            window.location = url + q;
        }

        // Fancybox method
        _dtm.getFancybox = function (o) {
            const root = document.querySelector("#DTMFWJS");

            // get fancybox script
            const $script = $('script[src*="fancybox"]');
            // get fancybox stylesheet
            const $link = $('link[href*="fancybox"]');

            o = o || {};
            // set desired fancybox script
            o.js = o.js || '/shared/js/fancybox/2.1.5/jquery.fancybox.pack.js';
            // set desired fancybox stylesheet
            o.css = o.css || '/shared/js/fancybox/2.1.5/jquery.fancybox.min.css';

            // check if fancybox js file doesn't exist
            if ($script.length === 0) {
                // set up js for fancybox and load it before fw js
                const script = document.createElement("script");
                script.src = o.js;
                root.insertAdjacentElement("beforebegin", script);
            }

            // check if fancybox css file doesn't exist
            if ($link.length === 0) {
                // set up css for fancybox and load it before fw js
                const link = document.createElement("link");
                link.rel = "stylesheet";
                link.href = o.css;
                root.insertAdjacentElement("beforebegin", link);
            }
        };

        _dtm.requestScript = {

            // public property : sets a cache filter to prevent dupe events from firing
            cache: [],

            // public property : sets a configuration space for dependencies
            dictionary: [],

            // public method : checks if a dependency already exists in the DOM
            exists: function (file) {
                return $('script[src*="' + file + '"]').length > 0 ? true : false;
            },

            // public method : filters dictionary and handles dependency support
            get: function () {
                var self = this;

                $.each(this.dictionary, function () {
                    var file = $('script[src*="' + this.file + '"]');
                    var namespace = this.name;

                    if ($.inArray(namespace.toLowerCase(), self.cache) === -1) {
                        if (!self.exists(this.file)) {
                            $.getScript(this.dir + this.file).done(function (data, textStatus, jqxhr) {
                                self.callback(namespace, { data: data, textStatus: textStatus, jqxhr: jqxhr });
                            });
                        } else {
                            self.callback(namespace, namespace + ' is already installed');
                        }
                        self.cache.push(namespace.toLowerCase());
                    }
                });
            },

            // public method : returns an event to the user when dependency is available
            callback: function (namespace, response) {
                try {
                    window['get' + namespace](response);
                } catch (e) {
                }

                $('html').trigger({ type: namespace + ':ready', response: response });
            }

        };

        // Sets up a grid and separates it by the label
        _dtm.setUpsellGridByLabel = function () {
            // get comment node that contains upsell video
            var div = $('<div>').html($('.c-brand--upsell .c-brand__txt').html()),
                comment = div.contents().filter(function () {
                    return this.nodeType === 8;
                });
            // get comment node and test if first index is undefined
            comment = comment.get(0) || comment.get(1);

            try {
                // get node
                var node = $('<div>').html(comment.nodeValue);
                // get upsell code
                var code = node.find('[data-upsell-label-code]');

                // if the code attribute exists
                if (code.length > 0) {
                    // cycle each label
                    node.find('[data-upsell-label]').each(function (index, value) {
                        // insert the label before the target code
                        $(value).insertBefore($('#' + $(value).data('upsell-label-code')));
                    });
                }
            } catch (e) {
                console.log(e.message);
            }
        };

        // Sets video to play on upsell page
        _dtm.enableUpsellVideo = function () {
            // get comment node that contains upsell video
            var div = $('<div>').html($('.c-brand--upsell .c-brand__txt').html()),
                comment = div.contents().filter(function () {
                    return this.nodeType === 8;
                }).get(1);
            // get video container
            var $video = $('[data-upsell-video]');

            try {
                // check if upsell video attribute exists
                if ($video.length > 0) {
                    // add node value to attribute
                    $video.html(comment.nodeValue).addClass('u-mar--top');

                    // if video contains video-js
                    if ($video.find('.video-js').length > 0) {
                        var id = $video.find('.video-js').attr('id');
                        try {
                            // try to load in Video JS API
                            _V_(document.getElementById(id), {}, function () {

                            });
                        } catch (e) {
                            console.log('error in executing video js: ' + e.message);
                        }
                        // else if video depends on Vimeo and we're viewing mobile
                    } else if ($video.find('iframe[src*="vimeo"]').length > 0 && Model.IsMobile) {
                        try {
                            // get Vimeo video
                            var $vimeo = $video.find('iframe[src*="vimeo"]');
                            // sync video to Vimeo API when iframe loads
                            $vimeo.on('load', function () {
                                _dtm.getVimeo($vimeo);
                            });
                            // when Vimeo video is synced with Vimeo API
                            $('html').on('dtm/vimeo', function () {
                                // make Vimeo video responsive
                                _dtm.makeVimeoResponsive();
                            });
                        } catch (e) {
                            console.log('error in making Vimeo video responsive: ' + e.message);
                        }
                        // else if video depends on YouTube and we're viewing mobile
                    } else if ($video.find('iframe[src*="youtube"]').length > 0 && Model.IsMobile) {
                        try {
                            // get YouTube video
                            var $youtube = $video.find('iframe[src*="youtube"]');
                            // sync video to YouTube API when iframe loads
                            $youtube.on('load', function () {
                                _dtm.getYouTube($youtube);
                            });
                            // when YouTube video is synced with YouTube API
                            $('html').on('dtm/youtube', function () {
                                // make YouTube video responsive
                                _dtm.makeYouTubeResponsive();
                            });
                        } catch (e) {
                            console.log('error in making YouTube video responsive: ' + e.message);
                        }
                    }
                }
            } catch (e) {
                console.log(e.message);
            }

        };

        // method used to add a new API
        _dtm.addAPI = function () {
            // set api object
            var _api = {},
                objectCompleteTimer,
                methodCompleteTimer;

            // checks if the given content contains specific data
            _api.verifyBySrc = function (args) {
                try {
                    if (args.content.indexOf(args.verify) === -1) {
                        return false;
                    } else {
                        return true;
                    }
                } catch (e) {
                    console.log(e.message);
                }
            };

            // sets an id to a given element
            _api.setId = function (args) {
                // set index
                args.index = args.index || 0;
                // set the callback function
                args.callback = args.callback || function () { };

                // check if id exists in the DOM
                if (!args.$id.attr('id')) {
                    // assign unique id
                    args.$id.attr('id', args.uniqueid + args.index);
                }
                return args.callback(args);
            };

            // cycles through the API methods and returns a complete object
            _api.whenAPIReady = function (args) {
                // set the callback function
                args.callback = args.callback || function () { };
                // set the speed of each check
                args.speedIndex = args.speedIndex || 100;

                var whenMethodsAreComplete = function (value) {
                    clearTimeout(methodCompleteTimer);
                    // if object is not empty and the length of that object surpasses a certain limit
                    if (!$.isEmptyObject(value) && Object.keys(value).length > args.APIMethodLimit) {
                        return args.callback(args);
                    } else {
                        methodCompleteTimer = setTimeout(function () {
                            whenMethodsAreComplete(value);
                        }, args.speedIndex);
                    }
                };

                // determines if an object is empty and refires until it is complete
                var whenObjectIsComplete = function () {
                    clearTimeout(objectCompleteTimer);
                    // check if the api object is not empty
                    if (!$.isEmptyObject(args.APIObject)) {
                        // cycle the object
                        master.search('cycle', {
                            obj: args.APIObject,
                            callback: function (index, value, args, i) {
                                // on the first run, check when the object completely loads
                                if (i === 0) {
                                    whenMethodsAreComplete(value);
                                }
                            }
                        });
                        // otherwise, refire the function in the next interval
                    } else {
                        objectCompleteTimer = setTimeout(function () {
                            whenObjectIsComplete();
                        }, args.speedIndex);
                    }
                };
                whenObjectIsComplete();
                return args.APIObject;
            };

            _api.setAPIByElement = function (args) {
                // set callback function
                args.callback = args.callback || function () { };

                // check whether the JavaScript API exists
                _dtm.searchFileByJS({
                    file: args.configSrc,
                    create: true,
                    onSuccess: function (status) {
                        // if status returns successful
                        if (status) {
                            // apply success status to the API load status property
                            args.APILoadStatus = status;

                            // check whether string element or object element was passed
                            switch (true) {
                                // element was passed as a string
                                case typeof (args.el) === 'string':
                                    var $el = $('#' + args.el);
                                    if (_api.verifyBySrc({ content: $el.attr('src'), verify: args.verify })) {
                                        // check if id exists in the DOM
                                        _api.setId({
                                            $id: $el, uniqueid: args.uniqueid, callback: function () {
                                                return args.callback({ $id: $el, options: args.options, status: status });
                                            }
                                        });
                                    }
                                    break;
                                // element was passed as an object
                                case typeof (args.el) === 'object':
                                    // iterate each element
                                    args.el.each(function (index, value) {
                                        var $value = $(value);
                                        if (_api.verifyBySrc({ content: $value.attr('src'), verify: args.verify })) {
                                            _api.setId({
                                                $id: $value, index: index, uniqueid: args.uniqueid,
                                                callback: function () {
                                                    return args.callback({ $id: $value, options: args.options, status: status });
                                                }
                                            });
                                        }
                                    });
                                    break;
                            }
                        }
                    }
                });
            };

            return _api;
        };

        // searches DOM for a JavaScript file and returns a boolean based on whether it exists
        _dtm.searchFileByJS = function (args) {
            args.afterCreate = args.afterCreate || function () { };
            args.onSuccess = args.onSuccess || function () { };
            args.onFail = args.onFail || function () { };

            // check if script doesn't already exist in the DOM
            if ($('html').find('script[src="' + args.file + '"]').length === 0) {
                // check if we want to add the script dynamically
                if (args.create) {
                    var tag = document.createElement('script');
                    tag.src = args.file;
                    var firstScriptTag = document.getElementsByTagName('script')[0];
                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
                    tag.onload = function () {
                        args.afterCreate(true);
                        args.onSuccess(true);
                    };
                }
                return args.onFail(false);
            } else {
                return args.onSuccess(true);
            }
        };

        // gets the Vimeo API
        _dtm.getVimeo = function (el, options) {
            // set object
            var _v = {};
            // get the DTM API method
            var _api = _dtm.addAPI();

            // set config object
            _v.config = {
                uniqueid: 'dtm',
                src: 'https://player.vimeo.com/api/player.js',
                verify: 'player.vimeo.com'
            };

            // checks if the video contains the source to Vimeo
            _v.verifyVimeoBySrc = function (args) {
                return _api.verifyBySrc({ content: args.$id.attr('src'), verify: _v.config.verify });
            };

            // set Vimeo API
            _v.setVimeoAPI = function (args) {
                args.options = args.options || {};
                if (!args.$id.hasClass('has-dtm-vimeo')) {
                    try {
                        // create new Vimeo Player
                        _v.api[args.$id.attr('id')] = new Vimeo.Player(args.$id.attr('id'), args.options);
                        args.$id.addClass('has-dtm-vimeo');
                    } catch (e) {
                        console.log(e.message);
                    }
                }
            };

            // sets the element to bind with YouTube API
            _v.setVimeo = function (el, options) {
                _v.isVimeoLoaded = window.isVimeoLoaded || false;

                // check if an argument was passed
                if (typeof (el) !== 'undefined') {
                    // check if the element exists in the DOM
                    if (el.length > 0) {
                        // set new api object
                        _v.api = {};

                        // set up the Vimeo API by the element
                        _api.setAPIByElement({
                            el: el,
                            options: options,
                            verify: _v.config.verify,
                            configSrc: _v.config.src,
                            uniqueid: _v.config.uniqueid,
                            APILoadStatus: _v.isVimeoLoaded,
                            callback: function (args) {
                                _v.isVimeoLoaded = args.status;
                                if (typeof (window.isVimeoLoaded) === 'undefined') {
                                    window.isVimeoLoaded = _v.isVimeoLoaded;
                                }
                                _v.setVimeoAPI({ $id: args.$id, options: args.options });
                            }
                        });

                        // ready the Vimeo API to launch when complete
                        return _api.whenAPIReady({
                            APIObject: _v.api,
                            speedIndex: 100,
                            APIMethodLimit: 1,
                            callback: function (args) {
                                // trigger ready state
                                $('html').trigger({
                                    type: 'dtm/vimeo', api: _v.api
                                });
                                try {
                                    triggerEvent('dtm/vimeo', _v.api);
                                } catch (e) {
                                    console.log(e.message);
                                }
                            }
                        });
                    } else {
                        return _v;
                    }
                } else {
                    return _v;
                }

            };

            return _v.setVimeo(el, options);
        };

        // gets the YouTube API
        _dtm.getYouTube = function (el, options) {
            // set object
            var _yt = {};
            // get the DTM API method
            var _api = _dtm.addAPI();

            // set config object
            _yt.config = {
                jsapi: 'enablejsapi=1',
                uniqueid: 'dtm',
                src: 'https://www.youtube.com/iframe_api',
                verify: 'www.youtube.com/embed/'
            };

            // checks if the video contains the source to YouTube
            _yt.verifyYouTubeBySrc = function (args) {
                return _api.verifyBySrc({ content: args.$id.attr('src'), verify: _yt.config.verify });
            };

            // set YouTube API
            _yt.setYouTubeAPI = function (args) {
                args.options = args.options || {};
                // get source
                var src = args.$id.attr('src');
                // check if iframe doesn't already have the query
                if (!src.match(new RegExp(_yt.config.jsapi, 'g'))) {
                    // set query operator based on whether the question mark is set
                    var query = src.indexOf('?') === -1 ? '?' : '&';
                    args.$id.attr('src', src + query + _yt.config.jsapi);
                }

                var getAPI = function () {
                    try {
                        _yt.api[args.$id.attr('id')] = new YT.Player(args.$id.attr('id'), args.options);
                    } catch (e) {
                        setTimeout(getAPI, 100);
                    }
                };

                if (!args.$id.hasClass('has-dtm-youtube')) {
                    getAPI();
                    args.$id.addClass('has-dtm-youtube');
                }
            };

            // sets the element to bind with YouTube API
            _yt.setYouTube = function (el, options) {
                _yt.isYouTubeLoaded = window.isYouTubeLoaded || false;

                // check if an argument was passed
                if (typeof (el) !== 'undefined') {
                    // check if the element exists in the DOM
                    if (el.length > 0) {
                        // defined api object
                        _yt.api = {};

                        // set up the Vimeo API by the element
                        _api.setAPIByElement({
                            el: el,
                            options: options,
                            verify: _yt.config.verify,
                            configSrc: _yt.config.src,
                            uniqueid: _yt.config.uniqueid,
                            APILoadStatus: _yt.isYouTubeLoaded,
                            callback: function (args) {
                                _yt.isYouTubeLoaded = args.status;
                                if (typeof (window.isYouTubeLoaded) === 'undefined') {
                                    window.isYouTubeLoaded = _yt.isYouTubeLoaded;
                                }
                                _yt.setYouTubeAPI({ $id: args.$id, options: args.options });
                            }
                        });

                        // ready the Vimeo API to launch when complete
                        return _api.whenAPIReady({
                            APIObject: _yt.api,
                            speedIndex: 100,
                            APIMethodLimit: 50,
                            callback: function (args) {
                                // trigger ready state
                                $('html').trigger({
                                    type: 'dtm/youtube', api: _yt.api
                                });
                                try {
                                    triggerEvent('dtm/youtube', _yt.api);
                                } catch (e) {
                                    console.log(e.message);
                                }
                            }
                        });
                    } else {
                        return _yt;
                    }
                } else {
                    return _yt;
                }

            };

            return _yt.setYouTube(el, options);
        };

        // controls HTML5 video
        _dtm.controlHTML5Video = function (args) {
            var pauseHTML5Video = function (video) {
                // check if video isn't set to bypass pause mode
                if ($(video).data('pause') !== false) {
                    // check if video uses video-js api
                    if ($(video).hasClass('vjs-tech')) {
                        // pause video
                        _V_($(video).closest('.video-js').attr('id')).pause();
                    } else {
                        video.pause();
                    }
                }
            };

            // get each HTML5 video
            $('video').each(function () {
                // get id of each video
                var id = $(this).attr('id');
                if (typeof (args.video) !== 'undefined') {
                    // check for each video that isn't currently playing
                    if (this != args.video.get(0)) {
                        pauseHTML5Video(this);
                    }
                } else if (args.pauseAll) {
                    pauseHTML5Video(this);
                }
            });
        };

        // controls video types: HTML5, YouTube, Vimeo
        _dtm.controlVideo = function () {
            $('html').on('dtm/youtube/play', function (event) {
                try {
                    // get current video by id
                    var id = $(event.api.target.a).attr('id');
                    // get all YouTube videos
                    $.each(_dtm.api.youtube, function (index, value) {
                        // check if id doesn't match current video id
                        if (id !== index && !$('#' + id).data('pause')) {
                            // pause video
                            _dtm.api.youtube[index].pauseVideo();
                        }
                    });
                } catch (e) { }
                try {
                    // pause all Vimeo videos
                    $.each(_dtm.api.vimeo, function (index, value) {
                        value.pause();
                    });
                } catch (e) { }
                try {
                    _dtm.controlHTML5Video({ pauseAll: true });
                } catch (e) { }
            });

            $('html').on('dtm/vimeo', function (vimeo) {
                $.each(_dtm.api.vimeo, function (index, value) {
                    value.on('play', function () {
                        try {
                            // pause all YouTube videos
                            $.each(_dtm.api.youtube, function (index, value) {
                                _dtm.api.youtube[index].pauseVideo();
                            });
                        } catch (e) { }
                        try {
                            // pause all HTML5 videos
                            _dtm.controlHTML5Video({ pauseAll: true });
                        } catch (e) { }
                    });
                });
            });

            // allow all videos to pause when a current video is playing
            $('video').on('playing', function () {
                try {
                    _dtm.controlHTML5Video({ video: $(this) });
                } catch (e) { }
                try {
                    // pause all YouTube videos
                    $.each(_dtm.api.youtube, function (index, value) {
                        _dtm.api.youtube[index].pauseVideo();
                    });
                } catch (e) { }
                try {
                    // pause all Vimeo videos
                    $.each(_dtm.api.vimeo, function (index, value) {
                        value.pause();
                    });
                } catch (e) { }
            });
        };

        _dtm.mobile = {

            get: {
                vfs: {
                    link: function () {
                        return $('[href*="?dm=d"]');
                    },
                    container: function () {
                        return $('.l-header');
                    },
                    placeholder: function () {
                        return this.container().length ? this.container() : this.link();
                    }
                }
            },

            setResponsiveList: function () {
                // Responsive lists
                $('.c-list--nav').eflex({
                    type: 'list',
                    onAfter: function (self, result) {
                        var css = {
                            col: 'o-grid__col',
                            row: 'o-grid--block u-pad--vert'
                        };

                        if (!result) {
                            self.list.children()
                                .removeClass(css.col)
                                .addClass(css.row);
                        } else {
                            self.list.children()
                                .removeClass(css.row)
                                .addClass(css.col);
                        }
                    }
                });
            },

            setResponsiveFooter: function (args) {
                args = args || {};
                args.$this = args.$this || $('.l-footer__in .c-list--nav');

                var css = {
                    box: 'has-responsive-footer o-box u-vw--100 u-pad--reset fn--left @mv-bg--white',
                    row: 'o-grid--block u-pad--reset',
                    btn: 'o-grid--block u-pad o-pos',
                    icon: {
                        arrow: 'icon-chevron-thin-right o-pos__abs--center--vert o-pos__abs--right u-pad'
                    }
                };

                args.$this.children().each(function (index, value) {
                    if (!($(value).find('span').length > 0)) {
                        $(value).find('a')
                            .wrapInner('<span/>')
                            .append($('<span/>')
                                .addClass(css.icon.arrow));
                    }
                })

                // add styles
                args.$this.addClass(css.box)
                    .children().addClass(css.row)
                    .children().addClass(css.btn);
            },

            upsellImageToggle: function () {
                // Upsell toggle setup
                $('a[href^="#upsellImage"]').eflex({
                    type: 'toggle',
                    hide: $('#upsellImage'),
                    startEffect: 'fadeSlideDown',
                    endEffect: 'fadeSlideUp',
                    onAfter: function (self, link) {

                        if ($(link).attr('data-eflex--toggle-state') === 'false') {
                            $(link).text("+ <%= LabelsManager.Labels["MobileUpsellViewImageText"] ?? "View Image" %>");
                        } else {
                            $(link).text("- <%= LabelsManager.Labels["MobileUpsellHideImageText"] ?? "Hide Image" %>");
                        }

                    }
                });
            },

            // role: creates graphic to call out desktop version and adds it to mobile header
            addViewFullSite: function () {
                var $link = this.get.vfs.link();
                var $placeholder = this.get.vfs.placeholder();

                // set up button container
                var $vfs = $('<div/>', {
                    class: 'vfs vfs--button animate-and-fade-in'
                });

                // set up directory
                var vfs__dir = '/shared/mobile/images/';
                // set up file name
                var vfs__name = '<%= (SettingsManager.ContextSettings["Language.LanguageType"] ?? string.Empty).ToLower() %>-view-site.svg';
                // set up file path with fallback support
                var vfs__img = vfs__dir + (_dtm.ifExists(vfs__dir + vfs__name) ? vfs__name : 'mobile-view-site.svg');

                // set up button graphic
                var $vfs__img = $('<img/>', {
                    class: 'vfs__img',
                    src: vfs__img + '?v=<%= DtmContext.ApplicationVersion %>'
                });

                // insert button into the mobile header
                $vfs__img.appendTo($vfs);
                $vfs.prependTo($link);

                // remove overflow to ensure button is align with the mobile header
                $placeholder.addClass('l-header--vfs');
            },

            // role: hides view full site on mobile upsell page type and expands header image to fill space
            hideViewFullSite: function () {
                var $placeholder = this.get.vfs.placeholder();
                $placeholder.addClass('l-header__vfs--hide');
            }

        };

        _dtm.makeVimeoResponsive = function (args) {
            args = args || {};
            args.onAfter = args.onAfter || function () { };

            var scaleByElement =
                args.scaleByElement ||
                (function () {
                    if ($('#content_top').length > 0) {
                        return $('#content_top');
                    } else {
                        return $('#contentContainer');
                    }
                })();
            var $vimeo = $('.has-dtm-vimeo');

            // filter all vimeo videos to get the aspect ratio
            $vimeo.each(function (index, vimeo) {
                // check if custom aspect ratio is not provided
                if (typeof ($(vimeo).data('eflex-aspect-ratio')) === 'undefined') {
                    // reset fixed dimensions to preserve 16:9 aspect ratio
                    $(vimeo).attr({ 'width': '300', 'height': '169' });
                }
            });

            $vimeo.eflex({
                type: 'scale',
                scaleByElement: scaleByElement,
                getElementBy: args.getElementBy,
                matchSelector: scaleByElement.selector,
                onAfter: args.onAfter
            });
        };

        _dtm.makeYouTubeResponsive = function (args) {
            args = args || {};
            args.onAfter = args.onAfter || function () { };

            var scaleByElement =
                args.scaleByElement ||
                (function () {
                    if ($('#content_top').length > 0) {
                        return $('#content_top');
                    } else {
                        return $('#contentContainer');
                    }
                })();
            var $youtube = $('.has-dtm-youtube');

            // filter all youtube videos to get the aspect ratio
            $youtube.each(function (index, youtube) {
                // check if custom aspect ratio is not provided
                if (typeof ($(youtube).data('eflex-aspect-ratio')) === 'undefined') {
                    // reset fixed dimensions to preserve 16:9 aspect ratio
                    $(youtube).attr({ 'width': '300', 'height': '169' });
                }
            });

            $youtube.eflex({
                type: 'scale',
                scaleByElement: scaleByElement,
                getElementBy: args.getElementBy,
                matchSelector: scaleByElement.selector,
                onAfter: args.onAfter
            });
        };

        _dtm.getPopup = function (href, args) {
            args = args || {};
            args.width = args.width || '475';
            args.height = args.height || '420';
            args.toolbars = args.toolbars || 'no';
            args.menubar = args.menubar || 'no';
            args.location = args.location || 'no';
            args.scrollbars = args.scrollbars || 'yes';
            args.resizable = args.resizable || 'no';
            args.status = args.status || 'no';

            try {
                window.open(href, 'popup', 'width=' + args.width + ',height=' + args.height + ',toolbars=' + args.toolbars + ',menubar=' + args.menubar + ',location=' + args.location + ',scrollbars=' + args.scrollbars + ',resizable=' + args.resizable + ',status=' + args.status);
            } catch (e) {
                console.log(e.message);
            }
        };

        _dtm.scrollToVse = function () {
            let $vse = $('.validation-summary-errors');

            // check if vse is visible and in not in the viewport
            if ($vse.is(':visible') && !$vse.is(':inviewport')) {
                $.scrollTo($vse);
                // else check if vse exists on the DOM but is not visible
            } else if ($vse.length > 0 && !($vse.is(':visible'))) {
                $(window).trigger({ type: 'dtm/vse/invisible' });
            }
        };

        $(window).on('load',function () {
            _dtm.api = {

                fancybox: {

                    page: function (fb, $defer, o) {
                        // get page href
                        var href = $(fb).attr('href');
                        // get page code
                        var page = href.split('.')[0];

                        // get upsell data from target page
                        $.getJSON('/<%= DtmContext.OfferCode %>/<%= DtmContext.Version %>/' + href, { RemoteType: page, covid: '<%= DtmContext.VersionId %>' }, function (data) {

                            // check if response data has properties
                            if (typeof data === 'object') {
                                // check if the current property exists
                                if (typeof data.current !== 'undefined') {
                                    // get snippet template
                                    $.get('/shared/snippet.html', function (html) {
                                        // insert snippet template into container
                                        var $container = $('<div/>', { html: html });

                                        // access title and insert upsell title
                                        $container.find('#snippet__title').text(data.current.title);
                                        // access body and insert upsell text
                                        $container.find('#snippet__content').html(data.current.desc);

                                        // assign new content to the fancybox api
                                        o.content = $container.html();
                                        // apply subpage class
                                        o.wrapCSS = 'c-brand snippet snippet--' + page.toLowerCase();
                                        // resolve status as complete : defer back to fancybox to open with new content
                                        $defer.resolve();

                                    });
                                } else {
                                    // set status as failure : current property is not added to the REMOTERESPONSE snippet
                                    $defer.reject();
                                }
                            } else {
                                // set status as failure : no data was returned from the request
                                $defer.reject();
                            }

                        });

                        // confirm task complete and delegate back to framework js
                        return $defer.promise();
                    },

                    snippet: function (fb, $defer, o) {
                        var href = $(fb).attr('href');

                        $.get(href, function (response, status, xhr) {
                            var $container = $('<div/>', { html: response });

                            try {
                                var __action, __pairs, __title;
                                var querystring = href.split('?')[1] || false;
                                var isSelfContained = false;

                                if (!querystring || querystring.indexOf('fn=') === -1) {
                                    return false;
                                }

                                querystring = querystring.replace(/&/g, "&");
                                __pairs = querystring.split("&");

                                for (var i = 0; i < __pairs.length; i++) {
                                    switch (true) {
                                        case __pairs[i].indexOf('fn=') >= 0:
                                            __action = __pairs[i].replace('fn=', '');
                                            break;
                                        case __pairs[i].indexOf('t=') >= 0:
                                            __title = decodeURIComponent(__pairs[i].replace('t=', ''));
                                            break;
                                        case __pairs[i].indexOf('isSelfContained=') >= 0:
                                            isSelfContained = true;
                                            break;
                                    }
                                }

                                if (isSelfContained) {
                                    $container.find('.ext--snippet').addClass('is-self-contained');
                                }

                                if (typeof __title !== 'undefined') {
                                    $container.find('#snippet__title').html(__title);
                                } else {
                                    $container.find('#snippet__title').remove();
                                }

                                $container.find('#snippet__content').load('/StaticContent.txt', { filename: __action, covid: '<%= DtmContext.VersionId %>' },
                                    function (response, status, xhr) {
                                        o.content = $container.html();
                                        xhr.status === 200 ? $defer.resolve() : $defer.reject();
                                    });
                            } catch (e) {
                                console.log(e);
                            }
                        });

                        return $defer.promise();
                    }

                },

                vimeo: _dtm.getVimeo($('iframe[src^="https://player.vimeo.com/video/"]')),


                youtube: _dtm.getYouTube($('iframe[src^="https://www.youtube.com/embed/"]'), {
                    events: {
                        onReady: function (event) {
                            $('html').trigger('dtm/youtube/ready');
                        },
                        onStateChange: function (event) {
                            switch (event.data) {
                                case 1:
                                    $('html').trigger({ type: 'dtm/youtube/play', api: event });
                                    break;
                                case 2:
                                    $('html').trigger({ type: 'dtm/youtube/pause', api: event });
                                    break;
                                case 0:
                                    $('html').trigger({ type: 'dtm/youtube/end', api: event });
                                    break;
                            }
                        }
                    }
                })


            };

            // cache all jQuery objects
            _dtm.jQuery = {

                $nav: $('.new-btns'),

                $contentTop: $('#content_top'),

                $main: $('main'),

                $footer: $('.l-footer')

            };

            _dtm.getMobileNav = {

                height: _dtm.jQuery.$nav.height()

            };

            // add fancybox plugin
            _dtm.getFancybox({
                js: '<%= lightboxScript %>',
                css: '<%= lightboxStylesheet %>'
            });

            // get numeric keyboard value
            var supportNumericKeyboard = master.calc('parseBoolean', { string: '<%= supportNumericKeyboard %>' }).func;
            // get email keyboard value
            var supportEmailKeyboard = master.calc('parseBoolean', { string: '<%= supportEmailKeyboard %>' }).func;

            // check if billing country is set to Canada
            var isCAN = $('#BillingCountry').val() === 'CAN' ? true : false;
            // check if OFRT reversion formatting is set
            var revertOFRT = master.calc('parseBoolean', { string: '<%= usingDtmStyleRevertOFRT %>' }).func;

            _dtm.settings = {
                revertOFRT: revertOFRT,
                supportNumericKeyboard: supportNumericKeyboard,
                supportEmailKeyboard: supportEmailKeyboard
            };

            /* @Import DTM Style Polyfill */
            _dtm.attr = {

                config: {

                    ZC: {
                        el: $('#zc'),
                        type: !isCAN && supportNumericKeyboard ? 'tel' : 'text'
                    },

                    CardNumber: {
                        el: $('#CardNumber'),
                        type: supportNumericKeyboard ? 'tel' : 'text'
                    },

                    CardCvv2: {
                        el: $('#CardCvv2'),
                        type: supportNumericKeyboard ? 'tel' : 'text'
                    },

                    BillingZip: {
                        el: $('#BillingZip'),
                        type: !isCAN && supportNumericKeyboard ? 'tel' : 'text'
                    },

                    Phone: {
                        el: $('#Phone:not(input[type="hidden"])'),
                        type: supportNumericKeyboard ? 'tel' : 'text'
                    },

                    Email: {
                        el: $('#Email:not(input[type="hidden"])'),
                        type: supportEmailKeyboard ? 'email' : 'text'
                    },

                    ShippingZip: {
                        el: $('#ShippingZip'),
                        type: !isCAN && supportNumericKeyboard ? 'tel' : 'text'
                    }
                }

            };

            _dtm.css = {

                config: {

                    form: {
                        el: $('#form'),
                        css: 'c-brand--form'
                    },

                    img: {
                        el: $('.dtm__in--mv img:not(.dtm__restyle)').not($('#cc img')),
                        css: 'u-mar--center'
                    },

                    input: {
                        el: $('input[type="text"]:not(.dtm__restyle), input[type="email"]:not(.dtm__restyle), input[type="tel"]:not(.dtm__restyle), input[type="search"]:not(.dtm__restyle)'),
                        css: 'c-brand--form__input o-box o-shadow fx--animate'
                    },

                    paymentForm: {
                        el: $('#paymentForm input[type="text"], #paymentForm input[type="email"], #paymentForm input[type="tel"]'),
                        css: 'o-grid__col @xs-u-vw--100'
                    },

                    billingInformation: {
                        el: $('#billingInformation input[type="text"], #billingInformation input[type="email"], #billingInformation input[type="tel"]'),
                        css: 'o-grid__col @xs-u-vw--100'
                    },

                    shippingInformation: {
                        el: $('#shippingInformation input[type="text"], #shippingInformation input[type="email"], #shippingInformation input[type="tel"]'),
                        css: 'o-grid__col @xs-u-vw--100'
                    },

                    select: {
                        el: $('select:not(.dtm__restyle)'),
                        css: 'c-brand--form__select o-box o-shadow u-vw fx--animate'
                    },

                    streetAutoFill: {
                        el: $('#StreetAutoFill'),
                        css: 'o-box @xs-u-vw--100 fx--animate c-brand--form__input'
                    },

                    ShippingStreetAutoFill: {
                        el: $('#ShippingStreetAutoFill'),
                        css: 'o-box @xs-u-vw--100 fx--animate c-brand--form__input'
                    },

                    reviewOrder: {
                        el: $('#reviewOrder'),
                        css: 'c-brand--form__fieldset'
                    },

                    FormHeadlineL: {
                        el: $('.FormHeadlineL'),
                        css: 'c-brand--form__headline c-brand--form__legend'
                    },

                    orderReview: {
                        el: $('#orderReview'),
                        css: revertOFRT ? 'c-brand--table--ofrt-revert' : '@mv-u-pad--vert c-brand--table--ofrt'
                    },

                    orderItemsTable: {
                        el: $('.orderItemsTable'),
                        css: !revertOFRT ? 'c-brand--table' : 'c-brand--table--ofrt-revert',
                    },

                    OSWE: {
                        el: $('.dtm--custom .orderItemsTable'),
                        css: revertOFRT ? 'c-brand--table--cart c-brand--table--ofrt-revert c-brand--form u-vw--100' : 'c-brand--table c-brand--table--cart c-brand--form u-vw--100'
                    },

                    ZC: {
                        el: $('.zc'),
                        css: 'zc o-box o-grid--iblock c-brand--form__input fx--animate u-vw--50',
                    },

                    StateTaxLink: {
                        el: $('[title="Sales Tax"]'),
                        css: 'c-brand__tax'
                    },

                    validationSummaryErrors: {
                        el: $('.validation-summary-errors'),
                        css: 'o-box--msg-error'
                    }

                }

            };

            _dtm.remove = {

                config: {

                    html: {
                        el: $('html'),
                        css: revertOFRT ? 'dtm--custom' : null
                    },

                    ZC: {
                        el: $('.zc'),
                        css: 'o-grid__col @xs-u-vw--100',
                    },

                    orderReview: {
                        el: $('#orderReview'),
                        css: revertOFRT ? 'c-brand--table' : 'c-brand--table--ofrt'
                    }

                }

            };

            _dtm.editable = {

                config: {

                    text: { el: $('h1, h2, h3, h4, h5, h6, em, p, strong, i, span, blockquote, cite, li') }

                }

            };

            _dtm.style = function (option, callback) {
                $.each(this[option]['config'], function (index, value) {
                    callback(index, value);
                });
            };

            _dtm.update = {
                // add css classes
                setClasses: function () {
                    _dtm.style('css', function (index, value) {
                        value.el.addClass(value.css);
                    });
                },

                // remove css classes
                removeClasses: function () {
                    _dtm.style('remove', function (index, value) {
                        value.el.removeClass(value.css);
                    });
                },

                // add numeric & email keyboard support
                setAttributes: function () {
                    _dtm.style('attr', function (index, value) {
                        value.el.attr('type', value.type);
                    });
                },

                // make content editable
                makeEditable: function () {
                    _dtm.style('editable', function (index, value) {
                        value.el.attr('contenteditable', 'true');
                    });
                },

                // add responsive table
                setResponsiveTable: function (data, args) {
                    // set element variable
                    var $elem = data || $('.c-brand--table');

                    args = args || {};
                    args.classes = args.classes || {};
                    // set revert mode
                    args.isReverted = master.calc('setDefault', {
                        setting: args.isReverted, default: master.calc('parseBoolean', {
                            string: '<%= usingDtmStyleRevertOFRT %>'
                        }).func
                    }).func;

                    args.numberOfColumns = args.numberOfColumns || $elem.find('tfoot').children().length;
                    _dtm.ShoppingCart.isRevertable = args.isReverted;
                    _dtm.ShoppingCart.numberOfColumns = args.numberOfColumns;

                    if (!args.isReverted) {
                        // Responsive table
                        $elem.eflex({
                            type: 'table',
                            callback: function (self, master) {

                                var td = self.trow.find('td:first'),
                                    css__table = args.classes.table || 'table-is-responsive',
                                    css__td = args.classes.td || 'c-brand--table__th';

                                if (typeof args.classes.theme !== 'undefined') {
                                    css__table = css__table + ' ' + args.classes.theme;
                                }

                                self.ifMobile = function () {
                                    master.viewport('query', {
                                        length: 'width',
                                        value: { max: args.maxWidth || 760 },
                                        callback: function (query, args, value) {
                                            if (query) {
                                                if (!self.table.hasClass(css__table)) {
                                                    self.table.addClass(css__table);
                                                }

                                                if (!td.hasClass(css__td)) {
                                                    td.addClass(css__td);
                                                }
                                            } else {
                                                self.table.removeClass(css__table);
                                                td.removeClass(css__td);
                                            }
                                        }
                                    });
                                }

                                self.ifMobile();

                                master.viewport('resize', {
                                    callback: function () {
                                        self.ifMobile();
                                    }
                                });

                                self.trow.each(function (index, value) {
                                    if ($(value).hasClass("c-brand--table__checkboxes")) {
                                        var children = $(value).children();
                                        children.each(function () {
                                            $(this).attr("data-eflex--category-label", "");
                                        });
                                    }
                                });

                            }

                        });
                    } else {
                        $($elem).find('tfoot td').each(function (index, td) {
                            if (index === 0) {
                                $(td).addClass('o-grid--none');
                            } else if ($(td).hasClass('tfoot_td--label')) {
                                $(td).attr('colspan', args.numberOfColumns);
                            }
                        });
                    }
                },

                form: function () {

                    this.setAttributes();
                    this.setClasses();
                    this.removeClasses();

                    // wrap order form review table
                    _dtm.css.config.orderReview.el.wrap('<div class="@mv-u-pad--vert reviewTable__wrap" />');

                    // check if order id does not exist
                    if ($('#order').length === 0) {
                        // add order id
                        $('[name="order"]').attr('id', 'order');
                    }

						<% if (autoMoveRequiredDisclaimer)
    { %>
                    // move indicate to top of form
                    $('.indicate').addClass('u-mar--center fn--center u-pad--vert').insertBefore($('#productSelection'));
						<% } %>

                },

                mobile: function () {

                    // promote navigation buttons to new template
                    $('.navigation_buttons')
                        .removeClass('navigation_buttons')
                        .children()
                        .addClass('o-box--btn--toggle');

                    // hide back button
                    $('#back_button').addClass('hide');

                    // re-add click event back to button
                    $('[href="#formWrap"], [href=#order]').on('click', function () {
                        $('#back_button').removeClass('hide').addClass('column-block');
                    });

                    $('#back_button').on('click', function () {
                        $('#back_button').addClass('hide');
                    });

                }
            };

            // This method sets up criteo detection and supports sticky nav
            _dtm.getCriteo = function (args) {
                // set args object
                args = args || {};
                // set $elem or get default
                args.$elem = args.$elem || $('.criteo_header');
                // if true, just return true to do something else
                args.callback = args.callback !== undefined ? args.callback : false;
                // set support for mobile nav
                args.supportMobileNav = args.supportMobileNav !== undefined ? args.supportMobileNav : true;
                // set placeholder target for criteo
                args.placeholder = $('[data-criteo-placeholder]').length !== 0 ? $('[data-criteo-placeholder]') : _dtm.jQuery.$nav;

                // check if element exists
                if (args.$elem.length > 0 && $('.dtm-criteo').length === 0) {
                    switch (true) {
                        // if we just want to check if it exists
                        case args.callback:
                            return true;
                            break;
                        // if we want to support the sticky nav
                        case args.supportMobileNav:
                            // modify classes and wrap in an outer container
                            args.placeholder
                                .removeClass('fix-to-bottom')
                                .addClass('inner-new-btns')
                                .wrap('<div class="outer-new-btns" />');
                            // set outer new btns jQuery object
                            _dtm.jQuery.$outerNewBtns = $('.outer-new-btns');
                            // add criteo class and prepend into the sticky nav
                            args.$elem
                                .addClass('dtm-criteo o-pos')
                                .prependTo(_dtm.jQuery.$outerNewBtns);
                            // set the outer container to stick to the bottom
                            _dtm.jQuery.$outerNewBtns.addClass('fix-to-bottom');
                            // recalc the new height
                            _dtm.getMobileNav.height = _dtm.jQuery.$outerNewBtns.height();
                            break;
                    }
                }

            };

            // This method sets up the support for sticky nav
            _dtm.setMobileNav = function ($nav, args) {

                // check if nav has the fix to bottom class
                if ($nav.hasClass('fix-to-bottom')) {
                    // we need to remove CSS transform property so menu is fixed to the window
                    _dtm.jQuery.$contentTop.css('transform', 'initial');
                    // we need to increase z-index in it's parent container
                    _dtm.jQuery.$main.css({ 'z-index': 3 });
                }

                // check if support object exists
                if (args.support.length > 0) {
                    // get each pixel and run it
                    $.each(args.support, function (i, set) {
                        set.pixel();
                    });
                }

                // check if mobile nav height exists
                if (_dtm.getMobileNav.height) {
                    // we need to accomodate overlap space by the height of the mobile nav menu
                    _dtm.jQuery.$footer.css({ 'padding-bottom': _dtm.getMobileNav.height * 1.5 });
                }

            };

            // This method sets up support to control a target's presentation whenever a user approaches it
            _dtm.animateToTargetOnScroll = function (params) {
                params = params || {};
                // set distance
                var distance = params.distance || 1.3;
                // set target
                var target = params.target || (function () {
                    return $('#content_bottom').length > 0 ? $('#content_bottom') : $('#formWrap');
                })();
                // set focus
                var focus = master.calc('setDefault', {
                    setting: params.focus, default: false
                }).func;
                // set anchor
                var $window = params.anchor || $(window);

                // set callback for in range
                var callbackInRange = params.callbackInRange || function () { };
                // set callback for out range
                var callbackOutRange = params.callbackOutRange || function () { };

                $window.scroll(function () {
                    // check if scroll position is within range of the target area
                    if (($window.scrollTop() + ($window.height() / distance)) > target.offset().top) {
                        if (focus) {
                            // check if scroll position exceeds past range of the target area
                            if (($window.scrollTop() + ($window.height() / distance)) > (target.offset().top + target.height())) {
                                // invoke out range callback
                                callbackOutRange();
                            } else {
                                // invoke in range callback
                                callbackInRange();
                            }
                        } else {
                            // invoke in range callback
                            callbackInRange();
                        }
                    } else {
                        // invoke out range callback
                        callbackOutRange();
                    }
                });
            };

            // This method handles when form controls should be disabled or enabled based on a conditional status
            _dtm.toggleFormUsability = function (o) {
                o = o || {};
                var $target = o.$target.length > 0 ? o.$target : $('#form');

                if ($target.length > 0) {
                    if (o.status) {
                        $target.find('input, select').each(function () {
                            $(this).attr('disabled', true);
                        });
                    } else {
                        $target.find('input, select').each(function () {
                            $(this).removeAttr('disabled');
                        });
                    }
                }
            };

            // This method sets up the support to return the form to the landing page and enable scroll animation support
            _dtm.showOrderFormOnMobile = function (args) {
                args = args || {};
                var self = {};
                // get order form container
                var $form = args.$form || (function () {
                    return $('#content_bottom').length > 0 ? $('#content_bottom') : $('#formWrap');
                })();

                // get nav
                var $nav = args.$nav || $('.new-btns, .fp-nav');
                // get parent
                var $p = $nav.parent();

                // get anchor
                var $anchor = args.$anchor || $(window);

                // get elements to remove events
                var $removeEventsFrom = args.$removeEventsFrom || $("a[href=#formWrap], a[href=#order], a[href=#mainContainer], a[rel=#formWrap], a[rel=#mainContainer]");
                // set action
                var triggerAction = function () {
                    _dtm.animateToTargetOnScroll({
                        target: $form,
                        anchor: $anchor,
                        callbackInRange: function () {
                            $nav.css({ 'opacity': 0, 'pointer-events': 'none' });
                            $('<%=navPartnerSelectors%>').css({ 'opacity': 0, 'pointer-events': 'none' });
                            if ($p.hasClass('outer-new-btns')) {
                                $p.addClass('new-btns--is-hidden');
                            }
                        },
                        callbackOutRange: function () {
                            $nav.css({ 'opacity': 1, 'pointer-events': 'all' });
                            $('<%=navPartnerSelectors%>').css({ 'opacity': 1, 'pointer-events': 'all' });
                            if ($p.hasClass('outer-new-btns')) {
                                $p.removeClass('new-btns--is-hidden');
                            }
                        }
                    });
                };

                self.bindEvents = function () {
                    // attach new click event to anchors
                    $removeEventsFrom.on('click', function () {
                        // jump to the form
                        $form.eflex({ type: 'scroll', trigger: true });
                    });
                };

                // make form visible
                $form.show();
                // add CSS3 animation support
                $nav.addClass('animate');
                // turn off click events that would cause the page to switch
                $removeEventsFrom.off('click');

                triggerAction();

                // when framework js is ready
                $('html').on('dtm/fwjs', self.bindEvents);

                try {
                    $nav.trigger({ type: 'dtm/showOrderFormOnMobile', self: self });
                    triggerEvent('OrderFormShownOnMobile');
                }
                catch (err) {
                    console.log(err.message);
                }
            };

            _dtm.togglePagesOnMobile = function () {
                // Content toggle setup
                $('a[href^="#order"], a[href^="#formWrap"]').eflex({
                    type: 'toggle',
                    show: $('.validation-summary-errors').is(':visible') ? $('#content_bottom, [data-id="content_bottom"]') : $('#content_top, [data-id="content_top"]'),
                    hide: $('.validation-summary-errors').is(':visible') ? $('#content_top, [data-id="content_top"]') : $('#content_bottom, [data-id="content_bottom"]'),
                    onAfter: function (self, link) {
                        try {
                            // jump to top of page
                            window.scroll(0, 0);

                            // check if we are on the order form
                            if (link.data('eflex--toggle-state')) {
                                // hide the order now button in the footer
                                $('.l-footer [href*="order"]').hide();
                            } else {
                                $('.l-footer [href*="order"]').show();
                            }
                        } catch (e) {
                            // log to console if something went wrong
                            console.log(e.message);
                        }
                    }
                });
            };

			// check if we are upgrading the form without going incognito
			<% if (usingDtmStyle && !usingIncognitoMode || usingDtmStyleUpgradeForm && !usingIncognitoMode)
    { %>

            _dtm.update.form();

				// check if we are upgrading the form
				<% if (usingDtmStyleUpgradeForm)
    { %>

            _dtm.update.mobile();

				<% } %>

			<% } %>


			<% if (enablejQueryEflexSlider)
    { %>

            // set nav setting
            var jQueryEflexSliderNav = false;
            // set nav selector
            var jQueryEflexSliderNavSelector;
            // set paginate setting
            var jQueryEflexSliderPaginate = false;
            // set paginate selector
            var jQueryEflexSliderPaginateSelector;

            // check if nav setting is enabled
            if (master.calc('parseBoolean', { string: '<%= jQueryEflexSliderNav %>' }).func) {
                // get nav selector
                jQueryEflexSliderNavSelector = $('<%= jQueryEflexSliderNavSelector %>');

                // check if nav selector exists
                if (jQueryEflexSliderNavSelector.length > 0) {
                    jQueryEflexSliderNav = jQueryEflexSliderNavSelector;
                } else {
                    jQueryEflexSliderNav = true;
                }
            }

            // check if paginate setting is enabled
            if (master.calc('parseBoolean', { string: '<%= jQueryEflexSliderPaginate %>' }).func) {
                // get paginate selector
                jQueryEflexSliderPaginateSelector = $('<%= jQueryEflexSliderPaginateSelector %>');

                // check if paginate selector exists
                if (jQueryEflexSliderPaginateSelector.length > 0) {
                    jQueryEflexSliderPaginate = jQueryEflexSliderPaginateSelector;
                } else {
                    jQueryEflexSliderPaginate = true;
                }
            }

            // invoke jQuery Eflex slider
            $('<%= jQueryEflexSliderSelector %>').eflex({
                type: 'slider',
                sliderType: '<%= jQueryEflexSliderType %>',
                animationType: '<%= jQueryEflexSliderAnimationType %>',
                nav: jQueryEflexSliderNav,
                navType: '<%= jQueryEflexSliderNavType %>',
                paginate: jQueryEflexSliderPaginate,
                paginateType: '<%= jQueryEflexSliderPaginateType %>',
                htmlWrapper: '<%= jQueryEflexSliderHtmlWrapper %>',
                cssWrapper: '<%= jQueryEflexSliderCSSWrapper %>',
                duration: <%= jQueryEflexSliderDuration %>,
                delay: <%= jQueryEflexSliderDelay %>,
                easing: '<%= jQueryEflexSliderEasing %>',
                eventType: '<%= jQueryEflexSliderEventType %>',
                onInit: <%= jQueryEflexSliderOnInit %>,
                onBefore: <%= jQueryEflexSliderOnBefore %>,
                onAfter: <%= jQueryEflexSliderOnAfter %>,
                auto: master.calc('parseBoolean', { string: '<%= jQueryEflexSliderAuto %>' }).func,
                axis: '<%= jQueryEflexSliderAxis %>',
                direction: '<%= jQueryEflexSliderDirection %>',
                responsive: $('.dtm__in--mv').length > 0 ? true : false,
                await: '<%= jQueryEflexSliderAwait %>',
                swipe: master.calc('parseBoolean', { string: '<%= jQueryEflexSliderSwipe %>' }).func,
                cssMediaQueries: master.calc('parseBoolean', { string: '<%= jQueryEflexSliderCSSMediaQueries %>' }).func
            });
			<% } %>

			<% if (jQueryEflexGroup)
    { %>
            $('<%= jQueryEflexGroupSelector %>').eflex({
                type: 'group'
            });
			<% } %>

			<% if (jQueryEflexSwap)
    { %>
            $('<%= jQueryEflexSwapSelector %>').eflex({
                type: 'swap',
                startEffect: '<%= jQueryEflexSwapStartEffect %>',
                endEffect: '<%= jQueryEflexSwapEndEffect %>',
                duration: <%= jQueryEflexSwapDuration %>,
                easing: '<%= jQueryEflexSwapEasing %>',
                eventType: '<%= jQueryEflexSwapEventType %>',
                classes: '<%= jQueryEflexSwapClasses %>',
                enableAria: true,
                freeze: master.calc('parseBoolean', { string: '<%= jQueryEflexSwapFreeze %>' }).func,
                onAfter: <%= jQueryEflexSwapOnAfter %>,
                isVisible: master.calc('parseBoolean', { string: '<%= jQueryEflexSwapIsVisible %>' }).func
            });
			<% } %>

        /* NOTE: This method fires twice for some odd reason */
			<% if (jQueryEflexSwapCollapse)
    { %>
            $('<%= jQueryEflexSwapCollapseSelector %>').eflex({
                type: 'swap',
                title: 'data-seminar-time',
                content: 'data-seminar-content',
                custom: 'data-seminar-form',
                group: 'data-content',
                classes: 'is-selected',
                enableAria: false,
                duration: '<%= jQueryEflexSwapDuration %>',
                easing: '<%= jQueryEflexSwapEasing %>',
                activeClasses: '<%= jQueryEflexSwapCollapseActiveClasses %>',
                inactiveClasses: '<%= jQueryEflexSwapCollapseInactiveClasses %>',
                linkto: $('<%= jQueryEflexSwapCollapseContinueLink %>'),
                isVisible: master.calc('parseBoolean', { string: '<%= jQueryEflexSwapIsVisible %>' }).func,
                freeze: true,
                onAfter: function (self, $this, title, content) {
                    self.collapse({
                        linkto: self.linkto,
                        linkback: $('<%= jQueryEflexSwapCollapseBackLink %>'),
                        container: $('<%= jQueryEflexSwapCollapseContainer %>')
                    }, {
                        self: self,
                        $this: $this
                    });
                }
            });
			<% } %>

			<% if (!EnableOrderForm)
    { %>
            _dtm.disableOrderLinks();
			<% } %>

            switch (Model.IsMobile) {
                // if on mobile
                case true:
                case 'True':

                    $('html').on('dtm/vimeo', function () {
                        if ($('[data-eflex-scale-vimeo-custom]').length === 0) {
                            _dtm.makeVimeoResponsive();
                        }
                    });

                    $('html').on('dtm/youtube', function () {
                        if ($('[data-eflex-scale-youtube-custom]').length === 0) {
                            _dtm.makeYouTubeResponsive();
                        }
                    });

                    // allow video to resize fluidly
                    $('video').removeAttr('width').removeAttr('height');

					<% if (jQueryEflexScale)
    { %>
                /* NOTE: Need to tweak this method */
						/* $('<%= jQueryEflexScaleSelector %>').eflex( 'scale' ); */
					<% } %>

					<% if (addViewFullSite)
    { %>
                    _dtm.mobile.addViewFullSite();
					<% } %>

                    _dtm.setMobileNav(_dtm.jQuery.$nav, {
                        support: [{ pixel: _dtm.getCriteo }]
                    });

                    switch (DtmContext.Page.PageType) {
                        // if on index or sub page
                        case 'orderPage':
                        case 'SubPage':

							<% if (EnableOrderForm)
    { %>
								<% if (togglePagesOnMobile)
    { %>
                            _dtm.togglePagesOnMobile();
								<% } %>

								<% if (showOrderFormOnMobile)
    { %>
                            _dtm.showOrderFormOnMobile();
								<% } %>

							<% } %>

                            break;
                        // if on upsell page
                        case 'upsell':
							<% if (enableHideUpsellImgOnMobile)
    { %>
                            _dtm.mobile.upsellImageToggle();
							<% } %>

							<% if (hideViewFullSite && addViewFullSite)
    { %>
                            _dtm.mobile.hideViewFullSite();
							<% } %>

                            break;
                        // if on any other page
                        default:

							<% if (enableHideUpsellImgOnMobile)
    { %>
                            _dtm.mobile.upsellImageToggle();
							<% } %>

                            break;
                    }

				<% if (usingDtmStyle)
    { %>
                    // set all mobile lists to be responsive
                    _dtm.mobile.setResponsiveList();

                    // set mobile footer nav to be responsive
                    if ($('[data-eflex-footer-custom]').length === 0) {
                        _dtm.mobile.setResponsiveFooter();
                    }

                    if ($('[data-eflex-table-custom]').length === 0) {
                        // set order table to be responsive
                        _dtm.update.setResponsiveTable();
                        try {
                            // set event listener to re-apply responsive rules
                            registerEvent('CartChange', function () {
                                _dtm.update.setResponsiveTable();
                            });
                        } catch (e) {
                            console.log(e.message);
                        }
                    }

				<% } %>

                    break;

                // if on desktop
                case false:
                case 'False':

                    $('<%= jQueryEflexStretchSelector %>').eflex('stretch');

					<% if (jQueryEflexStretch)
    { %>
                    // if on upsell + desktop
                    switch (DtmContext.Page.PageType) {
                        case 'upsell':
                        case 'Custom':
                            // wait for upsell images to finish loading in
                            $('#upsellImage img').on('load', function () {
                                // update page dimensions to prevent any excess scrolling
                                $('<%= jQueryEflexStretchSelector %>').eflex('stretch');
                            });
                            break;
                    }
					<% } %>

                    break;
            }


            switch (DtmContext.Page.PageType) {
                case 'upsell':
                case 'Custom':

                    // get each upsell quantity
                    $('.c-brand--upsell .upsell__qty').each(function (index, value) {
                        // check for viewable options inside
                        if ($(value).height() > 0) {
                            // add spacing between each option
                            $(value).addClass('u-pad--bottom');
                        }
                    });

                    // enable upsell video to work
                    _dtm.enableUpsellVideo();
                    // set grid by the label
                    _dtm.setUpsellGridByLabel();

                    break;
            }

            // check if free shipping banner exists
            if ($('a[href*="freeshipping.com"]').length > 0) {
                $('a[href*="freeshipping.com"]').addClass('o-grid--block fn--center u-mar--vert fx--fade-in');
                $('a[href*="freeshipping.com"]:first').prependTo($('#content_top'));
                if ($('a[href*="freeshipping.com"]').length > 1) {
                    $('a[href*="freeshipping.com"]:last').appendTo($('#content_top'));
                }
            }

			<% if (jQueryEflexScroll)
    { %>
            if ($('[data-eflex-scroll-custom]').length === 0) {
                // enable scroll support
                $('<%= jQueryEflexScrollSelector %>').not($('.has-fancybox, ' + Model.IsMobile ? '[href^="#formWrap"], [href^="#mainContainer"]' : '')).eflex('scroll');
            }

			<% } %>

			<% if (jQueryEflexPlay)
    { %>
            // set paginate selector
            var jQueryEflexPlayPaginateSelector = '<%= jQueryEflexPlayPaginateSelector %>';

            // check if paginate selector exists
            if (jQueryEflexPlayPaginateSelector.length > 0) {
                jQueryEflexPlayPaginate = $(jQueryEflexPlayPaginateSelector);
            } else {
                jQueryEflexPlayPaginate = true;
            }

            $('<%= jQueryEflexPlaySelector %>').eflex({
                type: 'play',
                source: '<%= jQueryEflexPlaySource %>',
                paginate: jQueryEflexPlayPaginate
            });

			<% } %>

			<% if (enableSingleVideoPlayback)
    { %>
            _dtm.controlVideo();
			<% } %>

            // check if eflex attribute exists
            if ($('[data-eflex]').length > 0) {
                // iterate eflex attributes
                $('[data-eflex]').each(function (index, value) {
                    // convert into array to check for multiple effects
                    var effects = $(value).data('eflex').split(' ');
                    // check if multiple effects are passed in
                    if (effects.length > 1) {
                        $.each(effects, function (type, effect) {
                            // trigger eflex
                            $(value).eflex(effect);
                        });
                    } else {
                        // trigger eflex
                        $(value).eflex($(value).data('eflex'));
                    }
                });
            }

            // role : adds autoplay parameter support to enable/disable Vimeo videos
            $('html').on('dtm/vimeo', function (vimeo) {
                var q = window.location.search;

                // check if autoplay parameter exists in the url
                if (q.match(/autoplay=0/i)) {
                    $.each(vimeo.api, function () {
                        // get video
                        var $video = $(this.element);
                        // pause video
                        this.pause();
                        // update source to reload video with new params
                        $video.attr('src', $video.attr('src').replace('autoplay=1', 'autoplay=0'));

                        // when video reloads
                        $video.on('load', function () {
                            // animate the video back into visiblity
                            $video.addClass('vimeo-is-ready');
                        });
                    });
                } else {
                    // animate the video into visiblity
                    $('iframe[src*="player.vimeo.com"]').addClass('vimeo-is-ready');
                }
            });

            // trigger framework js custom event
            $('html').trigger({ type: 'dtm/fwjs', dtm: _dtm });


            // trigger automateSteps on windows load
            //if allowAutomateSteps variable is initialized to false, do not call automateSteps()
            if ((typeof (allowAutomateSteps) == 'undefined' || allowAutomateSteps))
                _dtm.automateSteps();

			<%if (enableEmailOptIn)
    {%>
            var emailOptInTemplate = '<label for="EmailOptIn" class="o-grid u-mar--bottom">' +
				'<div class="o-grid__col u-pad"><input id="EmailOptIn" name="EmailOptIn" type="checkbox" data-eflex="draw" data-eflex-icon="checkmark" value="true" <%=defaultCheckedEmailOptIn ? "checked=\"checked\"": ""%>><input name="EmailOptIn" type="hidden" value="false"></div>' +
				'<p class="o-grid__col u-pad"><%=emailOptInHtml%></p>' +
                '</label>';
            // Find location to insert content to
            if ($('#EmailOptInContainer').length > 0) {
                $('#EmailOptInContainer').append(emailOptInTemplate);
            } else {
                $('#ShippingIsSame').after(emailOptInTemplate);
            }
            if ($('#dyn-tos-pp-link').length > 0) {
                // Find href to populate template link
                var targetLink = $('a:contains("Privacy Policy"):last') || $('a[href*="Privacy-Policy"]:first') || $('a[title*="Privacy Policy"]:first');
                if (targetLink.length > 0) {
                    $('#dyn-tos-pp-link').attr('href', targetLink.attr('href') || '#');
                }
            }
            // initiate drawing the checkmark
            $('#EmailOptIn').eflex({ type: 'draw' });
			<%}%>

            <%if (enableMobileOptIn)
    {%>
            // declare html template and hoist our read-in DOM elements to be cached and reused
            var mobileOptInTemplate = '<label class="row container"><span class="col right-padding"><input type="checkbox" id="MobileOptInCbx" name="MobileOptInCbx" <% if (defaultCheckedMobileOptIn)
    {%> checked <%}%> /></span ><span class="col left-text"><span class="no-margin"><%=mobileOptInHtml%></span></span></label><input type="hidden" id="MobileOptIn" name="MobileOptIn" value="<%=defaultCheckedMobileOptIn ? "True" : "False"%>" />',
                $MobileOptInContainer = $("#MobileOptInContainer"),
                $MobileOptIn = $("#MobileOptIn"),
                $MobileOptInCbx = $("#MobileOptInCbx");
            var checked = '<%=ViewData["MobileOptIn"]%>';

            // let's utilize cached DOM elements unless they need to be cached and set value based on current checkbox state
            function setMobileOptIn() {
                if ($MobileOptInCbx.length === 0) $MobileOptInCbx = $("#MobileOptInCbx");
                if ($MobileOptIn.length === 0) $MobileOptIn = $("#MobileOptIn");

                if (!$MobileOptInCbx.is(":checked")) {
                    $MobileOptIn.val("False");
                } else {
                    $MobileOptIn.val("True");
                }
            }

            // let's utilize cached DOM elements unless they need to be cached, apply draw eflex if it doesn't support it and set change event listener
            function getMobileOptIn() {
                if ($MobileOptInCbx.length === 0) $MobileOptInCbx = $("#MobileOptInCbx");
                if ($MobileOptIn.length === 0) $MobileOptIn = $("#MobileOptIn");

                if (typeof $MobileOptInCbx.attr('data-eflex') === 'undefined') {
                    $MobileOptInCbx.eflex('draw');
                }

                if (checked == 'True') {
                    $MobileOptIn.val('True');
                    $MobileOptInCbx.prop("checked", true);
                } else if (checked == 'False') {
                    $MobileOptIn.val('False');
                    $MobileOptInCbx.prop("checked", false);
                }

                $MobileOptInCbx.on("change", setMobileOptIn);
            }

            // let's check if container already exists in the DOM; otherwise, put the template in the DOM
            if ($MobileOptInContainer.length > 0) {
                $MobileOptInContainer.append(mobileOptInTemplate);
            } else {
                $("#AcceptOfferButton").closest(".FormSubmit").prepend(mobileOptInTemplate);
            }

            getMobileOptIn();

            <%}%>

            <%if (enableTitle)
    {%>
            var TitleField = function () {
                var fields = '<%=titleOptions%>'.split(",");
                var billingPrefix = "Billing";
                var shippingPrefix = "Shipping";
                var defaultText = "<%=titleDefaultText%>";
                var labelText = "<%=titleLabelText%>";
                var fullNameCt;
                var firstNameCt;
                var fullNameLabel;
                var firstNameLabel;
                var stateInput;
                var infoCt;
                var titleCt;

                var checkIfTitleExits = function (prefix) {
                    return $("[name='" + prefix + "Title']").length > 0;
                };

                var setPrefix = function (prefix) {
                    fullNameCt = $("#" + prefix + "FullNameCt");
                    firstNameCt = $("#" + prefix + "FirstNameCt");
                    infoCt = $("#" + prefix + "Information");
                    titleCt = $("#" + prefix + "TitleCt");
                    fullNameLabel = $("#" + prefix + "FullNameLabel");
                    firstNameLabel = $("#" + prefix + "FirstNameLabel");
                    stateInput = $("#" + prefix + "State");
                }

                var createTitle = function (prefix) {
                    var title = $("<select/>");
                    if (stateInput.length > 0) {
                        title = stateInput.clone();
                    }
                    var options = "<option value=''>" + defaultText + "</option>";
                    $.each(fields, function (i, v) {
                        options += "<option value='" + v + "'>" + v + "</option>";
                    });

                    title.attr({
                        id: prefix + "Title",
                        name: prefix + "Title"
                    }).html(options);

                    return title;
                };

                var createLabel = function (prefix) {
                    var titleLabel = $("<label/>");
                    if (fullNameLabel.length > 0) {
                        titleLabel = fullNameLabel.clone();
                    } else if (firstNameLabel.length > 0) {
                        titleLabel = firstNameLabel.clone();
                    }

                    titleLabel.attr("id", prefix + "TitleLabel");
                    titleLabel.removeAttr("data-required");
                    titleLabel.html(labelText);
                    return titleLabel;
                }

                var appendTitleConatiner = function (ele) {
                    if (fullNameCt.length > 0) {
                        fullNameCt.before(ele);
                    } else if (firstNameCt.length > 0) {
                        firstNameCt.before(ele);
                    } else if (infoCt.length > 0) {
                        infoCt.prepend(ele);
                    } else {
                        console.log("unable to place title field");
                    }
                }

                var getTitleContainer = function (prefix, title) {

                    var titleContainer = $("<div/>");
                    if (titleCt.length > 0) {
                        titleContainer = titleCt;
                    } else if (fullNameCt.length > 0) {
                        titleContainer = fullNameCt.clone();
                    } else if (firstNameCt.length > 0) {
                        titleContainer = firstNameCt.clone();
                    }

                    titleContainer.attr("id", prefix + "TitleCt");
                    titleContainer.html("");
                    titleContainer.append(createLabel(prefix));
                    titleContainer.append(title);
                    appendTitleConatiner(titleContainer);
                }

                this.init = function () {
                    if (!checkIfTitleExits(billingPrefix)) {
                        setPrefix(billingPrefix);
                        getTitleContainer(billingPrefix, createTitle(billingPrefix));
                    }

                    if (!checkIfTitleExits(shippingPrefix)) {
                        setPrefix(shippingPrefix);
                        getTitleContainer(shippingPrefix, createTitle(shippingPrefix));
                    }

                };

            };

            var _titleField = new TitleField();
            _titleField.init();

            <%}%>

            _dtm.scrollToVse();
        });

        <% if (enableInsureShip)
    { %>
        $(document).on('keypress', '.insureShipLabel', function (event) {

            insureShipDisableKeypress(event);

        });

        <% } %>

        <%
    if (enableSurchx)
    {

    %>
        var transactionFeeEngine = function () {
            var config = {};
            var _submitButton;
            var _shoppingCart;
            var _form;
            var _cc;
            var _zip;
            var _amount;
            var _processor;
            var _country;

            var hasAllRequiredInfo = function () {

                var requiredFields = ["#CardNumber", "#BillingZip"];
                var hasAllInfo = true;

                $(requiredFields).each(function (i, v) {
                    var field = $(v);
                    var val = field.val();
                    if (field.length <= 0 || val == "" || !isDefined(val) || /[^0-9]/.test(val)) {
                        hasAllInfo = false;
                    }
                    if (field.attr("id") == "CardNumber" && (val.length < 6)) {
                        hasAllInfo = false;
                    }
                });

                if (_shoppingCart != null) {
                    var total = 0;
                    $.each(_shoppingCart.Items(), function (i, v) { total += v.qty; });
                    if (total == 0) {
                        hasAllInfo = false;
                    }
                }

                return hasAllInfo;
            };

            var formPrepend = function (name, value) {
                if ($('#' + name).length > 0) {
                    $('#' + name).val(value);
                } else {
                    _form.prepend('<input type="hidden" id="' + name + '" name="' + name + '" value="' + value + '" />');
                }
            };

            var isDefined = function (data) {
                if (typeof (data) == 'undefined') {
                    return false;
                }

                return true;
            };


            var getTransactionFee = function () {
                $.post('/shared/services/gettransactionfee.ashx?', {
                    covid: config.covid,
                    country: _country,
                    zipCode: _zip,
                    processor: _processor,
                    amount: _amount,
                    nicn: _cc,
                    campaign: config.campaign,
                    vsid: config.vsid
                }, handleTransactionFeeRecieved, 'json');
            };

            var handleTransactionFeeRecieved = function (data) {
                console.log("transactionFee", data);
                if (!isDefined(data)) {
                    logError({ 'message': "No transaction fee recieved" });
                    return;
                }

                if (!isDefined(data.transactionFee)) {
                    logError({ "message": "No Fee given", "json": JSON.stringify(data) });
                    return;
                }

                $.post('/shared/services/pixelservice.ashx?at=track', { "transactionFee": JSON.stringify(data) });

                formPrepend('TransactionFee', data.transactionFee);

                var showfee = parseInt(data.transactionFee) > 0;

                displayTransactionFee(showfee);

            };

            var displayTransactionFee = function (show) {

                var ct = $("#TransactionFeeCt");
                var fee = $("#TransactionFee").val();
                var feeText = '';

                if (show) {
                    feeText = config.feeText.replace('{fee}', fee);
                }

                if (typeof (CustomDisplayTransactionFee) == 'function') {
                    CustomDisplayTransactionFee(ct, fee, feeText);
                }

                if (ct.length > 0) {
                    ct.html(feeText);
                }

            };

            var getOrderTotal = function () {

                var subTotalField = $('#subTotal');
                var shippingTotalField = $("#shippingTotal");
                if (subTotalField.length > 0 && shippingTotalField.length > 0) {
                    var subTotal = parseFloat(subTotalField.val());
                    var shipTotal = parseFloat(shippingTotalField.val());
                    var total = 0;

                    if (!isNaN(subTotal)) {
                        total += subTotal;
                    }

                    if (!isNaN(shipTotal)) {
                        total += shipTotal;
                    }

                    return total;

                }

                return 0;

            };

            var getIsoCode = function (val) {
                switch (val) {
                    case "US":
                        return "840";
                    case "CA":
                        return "124";
                    default:
                        return "840";
                }
            };

            var logError = function (error) {
                $.post('/shared/services/pixelservice.ashx?at=error', error);
            };

            var setRequestInfo = function () {
                _cc = $("#CardNumber").val();
                _zip = $("#BillingZip").val();
                _country = "840";
                _amount = getOrderTotal();
                _processor = "standard";

                if (_cc.length > 6) {
                    _cc = _cc.substring(0, 6);
                }

                var orderType = $("[name=OrderType]:checked");
                if (orderType.length > 0
                    && !(/card/.test(orderType.val()))
                    && orderType.val() != ""
                    && isDefined(orderType.val())) {
                    _processor = orderType.val();
                }

                var billingCountry = $("#BillingCountry");
                if (isDefined(billingCountry)) {
                    _country = getIsoCode(billingCountry.val());
                }

            };

            this.sendRequest = function () {
                if (hasAllRequiredInfo()) {
                    setRequestInfo();
                    getTransactionFee();
                }
            };

            this.init = function (configuration) {
                if (typeof (configuration) == typeof (config)) {
                    config = configuration;
                }

                _shoppingCart = typeof (_dtmShoppingCart) != "object" ? null : _dtmShoppingCart;
                _submitButton = $('#AcceptOfferButton').length == 0 ? $('[name=acceptOffer]') : $('#AcceptOfferButton');
                _form = _submitButton.closest('form');

                $("#BillingZip,#CardNumber,#BillingCountry,[name='OrderType']").bind('change', function () {
                    _transactionFeeEngine.sendRequest();
                });
                registerEvent("CartChange", function () {
                    _transactionFeeEngine.sendRequest();
                });
            };
        };

        var _transactionFeeEngine = new transactionFeeEngine();
           <%}%>

        $(document).ready(function () {

			<% if (jQueryEflexLink)
    { %>
				<% if (jQueryEflexLinkSyncShoppingCart)
    { %>
            _dtm.eflexLink('<%= jQueryEflexLinkSelector %>', {
                text: '<%= jQueryEflexLinkText %>',
                classes: '<%= jQueryEflexLinkClasses %>',
                toggle: master.calc('parseBoolean', { string: '<%= jQueryEflexLinkToggle %>' }).func,
                swapClasses: master.calc('parseBoolean', { string: '<%= jQueryEflexSwapClasses %>' }).func,
                preserveContent: master.calc('parseBoolean', { string: '<%= jQueryEflexLinkPreserveContent %>' }).func,
                disableAfter: <%= jQueryEflexLinkDisableAfter %>,
                onInit: <%= jQueryEflexLinkOnInit %>,
                onBefore: <%= jQueryEflexLinkOnBefore %>,
                onAfter: <%= jQueryEflexLinkOnAfter %>
					});
				<% }
    else
    { %>
            $('<%= jQueryEflexLinkSelector %>').eflex({
                type: 'link',
                text: '<%= jQueryEflexLinkText %>',
                classes: '<%= jQueryEflexLinkClasses %>',
                toggle: master.calc('parseBoolean', { string: '<%= jQueryEflexLinkToggle %>' }).func,
                swapClasses: master.calc('parseBoolean', { string: '<%= jQueryEflexSwapClasses %>' }).func,
                preserveContent: master.calc('parseBoolean', { string: '<%= jQueryEflexLinkPreserveContent %>' }).func,
                disableAfter: <%= jQueryEflexLinkDisableAfter %>,
                onInit: <%= jQueryEflexLinkOnInit %>,
                onBefore: <%= jQueryEflexLinkOnBefore %>,
                onAfter: <%= jQueryEflexLinkOnAfter %>
					});
				<% } %>
			<% } %>

            $('[data-fancybox-url]').each(_dtm.AddFancyboxClass);
            <%if (enableSurchx)
    {%>
            _transactionFeeEngine.init({
                campaign: '<%=surchxCampaign%>',
                covid: '<%=DtmContext.VersionId%>',
                vsid: '<%=DtmContext.VisitorSessionId%>',
                feeText: '<%=surchxFeeText%>'
            });
            <%}%>

            $('body').on('click', '.has-popup', function (e) {
                try {
                    e.preventDefault();
                    _dtm.getPopup($(this).attr('href'));
                } catch (e) {
                    console.log(e.message);
                }
            });

            $('body').on('click', '.has-fancybox', function (e) {
                e.preventDefault();

                var $this = $(this), $fb = $this;

                try {
                    // set new deferred
                    var $defer = new $.Deferred();
                    // get href value
                    var href = $this.attr('href');
                    // get group name by rel attribute
                    var group = $this.attr('rel');
                    // extract hash for id value
                    var id = href.substr(1);
                    // check if this link triggers the Google Maps API
                    var gmap = href.match('map.aspx') || false;
                    // set printable
                    var isPrintable = 'is-not-printable';

                    // check if rel contains a group name
                    if (typeof group === 'string') {
                        // re-query fancybox and filter by the group name
                        var $group = $('.has-fancybox').filter('[rel="' + group + '"]');
                        // re-declare variable as empty array
                        $fb = [];
                        // we need to isolate the current element to work forward and reverse loops
                        $group.each(function (index, value) {
                            // first check if element in group matches the current element
                            if (value === $this.get(0)) {
                                // start on current element, loop towards length and push next elements into array
                                for (var i = index; i < $group.length; i++) {
                                    $fb.push({ src: $group.eq(i).attr('href'), href: $group.eq(i).attr('href') });
                                }
                                // loop towards the current index and push previous elements into array
                                for (var i = 0; i < index; i++) {
                                    $fb.push({ src: $group.eq(i).attr('href'), href: $group.eq(i).attr('href') });
                                }
                            }
                        });
                    }

                    // check if link contains a hash
                    if (href.charAt(0).match('#')) {
                        // check if content is printable
                        isPrintable = $(href)[0].hasAttribute('data-print') ? 'is-printable' : isPrintable;
                    }

                    // get width value
                    var w = $this.data('fancybox-width');
                    // get height value
                    var h = $this.data('fancybox-height');

                    // set config options
                    var o = {
                        maxWidth: gmap ? 500 : typeof w !== 'undefined' ? w : '90%',
                        maxHeight: gmap ? 300 : typeof h !== 'undefined' ? h : '90%',
                        wrapCSS: 'fancybox--' + isPrintable + ' c-brand',
                        fitToView: true,
                        autoSize: true,
                        closeClick: false,
                        touch: false,
                        openEffect: 'fade',
                        closeEffect: 'fade',
                        autoCenter: true,
                        afterShow: function () {
                            try {
                                // try triggering after show event on the pop up itself
                                $(this.href).trigger({
                                    type: 'dtm/fancybox/open', fancybox: this
                                });
                            } catch (e) {
                                console.log(e.message);
                            }

                            // otherwise, trigger the after show event on the pop up link
                            $this.trigger({
                                type: 'dtm/fancybox/open', fancybox: this
                            });
                        },
                        afterClose: function (fb) {
                            try {
                                // try triggering after close event on the pop up itself
                                $(fb.href).trigger({
                                    type: 'dtm/fancybox/close', fancybox: fb
                                });
                            } catch (e) {
                                // otherwise, trigger the after close event on the pop up link
                                $(fb.element).trigger({
                                    type: 'dtm/fancybox/close', fancybox: fb
                                });
                            }
                        }
                    };

                    // set the type based on the class
                    switch (true) {
                        case $this.hasClass('fancybox.ajax'):
                            o.type = 'ajax';
                            break;
                        case $this.hasClass('fancybox.iframe'):
                            o.type = 'iframe';
                            break;
                    }

                    // check if link supports any helper method
                    var method = $(this).data('fancybox-method');

                    // set private method to initialize Fancybox
                    var init = function () {
                        // load Fancybox
                        try {
                            $.fancybox.open($fb, o);
                        } catch (e) {
                            console.log(e.message);
                        }
                    };

                    // check if the helper method is a string
                    if (typeof method === 'string') {
                        try {
                            // try triggering the method from the api
                            _dtm.api.fancybox[method](this, $defer, o).done(function () {
                                if (typeof o.content === 'undefined') {
                                    console.log('please define the fancybox content option in your method');
                                } else {
                                    try {
                                        $.fancybox.open('<div>' + o.content + '</div>', o);
                                    } catch (e) {
                                        console.log(e.message);
                                        $.fancybox.open($this, o);
                                    }

                                }
                            });
                        } catch (e) {
                            // otherwise, report to console the error message
                            console.log('method name ' + method + ' could be called from _dtm.api.fancybox.', e.message);
                            // default to normal init
                            init();
                        }
                        // otherwise, default to normal init
                    } else {
                        init();
                    }

                } catch (e) {
                    console.log(e.message);
                }
            });

            // cart method : applies styling hook when cart contains items
            registerEvent('CartChange', function (cart) {
                var $table = $('.orderItemsTable, .c-brand--table');
                var items = _dtmShoppingCart.Items();

                if (items.length > 0) {
                    $table.addClass('c-brand--table--has-items');
                } else {
                    $table.removeClass('c-brand--table--has-items');
                }
            });

            /* OrderForm Checkbox Support */
            $("body").on("change", "input[name*='ActionCheckbox']:checkbox", handleOfferCheckboxChange);

            function handleOfferCheckboxChange() {
                var targetProductCode = $(this).data("target");
                var newProductCode = $(this).data("new");
                var requiredMessage = $(this).data("required");
                var i = $(this).attr("name").replace("ActionCheckbox", "");

                //check to make sure targetProductCode exists
                if (targetProductCode != 'undefined' && targetProductCode != '' && targetProductCode) {
                    if ($(this).is(":checked")) {
                        //Set MatchProductQuantity to attribute data-target when checked
                        if (newProductCode == 'undefined' || newProductCode == '' || !newProductCode) {
                            $('#MatchProductQuantity' + i).val(targetProductCode);
                        }
                        //Set ActionCode to attribute data-new (deluxe offer) when checked
                        else {
                            $('#ActionCode' + i).val(newProductCode);
                        }
                    }
                    else {
                        //Set MatchProductQuantity to empty when unchecked
                        if (newProductCode == 'undefined' || newProductCode == '' || !newProductCode) {
                            $('#MatchProductQuantity' + i).val('');
                        }
                        //Set ActionCode to attribute data-target (main offer) when unchecked
                        else {
                            $('#ActionCode' + i).val(targetProductCode);
                        }
                    }
                }
                else if (requiredMessage != 'undefined' && requiredMessage != '' && requiredMessage) {
                    if ($(this).is(":checked")) {
                        return true;
                    }
                    else {
                        //update to use pretty pop ups once worked out
                        alert(requiredMessage);
                        return false;
                    }
                }
                //trigger ActionQuantity change to update cart
                $('#ActionQuantity' + i).change();
            }
        });

        $('.has-fancybox').on('dtm/fancybox/open', function () {
            //_dtm.toggleFormUsability({ $target: $('[data-form-lightbox]'), status: true });
        });

        $('.has-fancybox').on('dtm/fancybox/close', function () {
            // _dtm.toggleFormUsability({ $target: $('[data-form-lightbox]'), status: false });
        });

    }(jQuery, document, window));
</script>
