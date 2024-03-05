<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<div class="instafeed">
    <div class="width-at-100" style="overflow: hidden;">
        <a href="https://www.instagram.com/toppik/?hl=en" target="_blank" id="instafeed" class="animated">
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-1.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-2.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-3.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-4.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-5.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-6.jpg"></span>
            <span class="instafeed__placeholder" data-instagram-img-src="/images/instafeed/ig-7.jpg"></span>
        </a>
    </div>
</div>

<script defer src="/js/instagram-gallery.js?v=3"></script>

<script src="/js/picture-polyfill.js"></script>
<script>
  // IE polyfill check
  var isIE = '-ms-scroll-limit' in document.documentElement.style && '-ms-ime-align' in document.documentElement.style;
  console.log('is IE11');
</script>