// components
import Carousel from "Shared/ts/components/carousel";
import ResponsiveCarousel from "Shared/ts/components/responsive-carousel";
//import MediaPlayer from "Shared/ts/components/media-player";
import Nav from "Shared/ts/components/nav";
import Accordion from "Shared/ts/components/accordion";
import FingerPrintNav from "Shared/ts/components/fingerprint-nav";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";
import ResponsiveSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/responsive-slide-carousel";
import VimeoMediaPlayerAdapter from "Shared/ts/api/media-player/vimeo-media-player";
import InstagramMediaInstantTokenAdapter from "Shared/ts/api/instagram/instagram-media-instant-token-adapter";

// utils
import LoadItem from "Shared/ts/utils/load-item";
import { enumerateElements, elementExists } from "Shared/ts/utils/html";

// observers
import { observer } from "Shared/ts/observers/intersection";
import MediaQuery from "Shared/ts/observers/media-query";

// applications
import { initializeDocumentModalDialogsByTemplates } from "Shared/ts/applications/modal-dialog";
import StatusScreen from "Shared/ts/components/status-screen";
import {
    initializeValidateEvent,
    validateInputRules,
    validatePromoCode
} from "Shared/ts/applications/form";
import {
    initializeVimeoMediaPlayer,
    initializeVimeoMediaPlayerWithIframeByObserver
} from "Shared/ts/applications/media-player";

const instagramMedia = new InstagramMediaInstantTokenAdapter({
    userId: "aa697096-1f32-4328-84fc-fd9f3b2d38a6",
    instagramId: "17841400288346220",
    userSecret: "iwn1t9jikmk414al1uohqr"
});

const createInstagramGallery = (gallery: Element) => {
    if (elementExists(gallery)) {
        instagramMedia.requestImages().then((media) => {
            enumerateElements(
                gallery.querySelectorAll("[data-src-img]")
            ).forEach((picture, index) => {
                const post = media[index];
                picture.setAttribute("data-src-img", post.media_url);

                const image = picture.querySelector("img");

                if (elementExists(image)) {
                    image.alt = post.caption;
                }
            });
        });
    }
};

initializeDocumentModalDialogsByTemplates();

createInstagramGallery(document.querySelector(".slide--instagram"));

const nav = new Nav("nav");

const fp = new FingerPrintNav();

fp.hideWhenElementsInView("form");

const createAccordion = (element: HTMLElement) => {
    if (elementExists(element)) {
        new Accordion(element);
    }
};

enumerateElements(document.querySelectorAll(".accordion")).forEach(
    (accordion) => {
        createAccordion(accordion as HTMLElement);
    }
);

observer("[data-viewport]", {
    inRange: (record) => {
        nav.root.classList.add("nav--is-hidden");
    },
    outRange: (record) => {
        nav.root.classList.remove("nav--is-hidden");
    },
    unObserve: false,
    options: {
        threshold: 0.25
    }
});

observer("[data-src-img]", {
    inRange: (record) => new LoadItem(record)
});

observer("[data-src-iframe]", {
    inRange: (record) =>
        new LoadItem(record, { tag: "iframe", src: "data-src-iframe" })
});

observer(".review", {
    inRange: (record) => record.classList.add("review--is-ready")
});

const handleCarouselImages = (carousel: Carousel, record: Element): void => {
    const slides = record.querySelectorAll(".slide__item");
    const map: WeakMap<Element, Element[]> = new WeakMap();

    carousel.on("rotation", (currentIndex: number) => {
        const currentSlide = slides.item(currentIndex);

        if (!map.has(currentSlide)) {
            const placeholderImages = enumerateElements(
                currentSlide.querySelectorAll("[data-src-img]")
            );

            placeholderImages.forEach(
                (placeholderImage) => new LoadItem(placeholderImage)
            );

            map.set(currentSlide, placeholderImages);
        }
    });
};

observer(".slide--result", {
    inRange: (record) => {
        const carousel = new ResponsiveCarousel(
            new ResponsiveSlideCarouselAdapter(record)
        );

        carousel.enablePrevNextControls();

        new MediaQuery("(min-width: 0) and (max-width: 49.9375rem)").inbound(
            (task) => carousel.setAttributes({ steps: 1 })
        );
        new MediaQuery("(min-width: 50rem)").inbound((task) =>
            carousel.setAttributes({ steps: 2 })
        );

        handleCarouselImages(carousel, record);
    }
});

observer(".slide--review", {
    inRange: (record) => {
        const carousel = new Carousel(new SlideCarouselAdapter(record));

        carousel.enablePrevNextControls();
        carousel.enableThumbnailControls();

        handleCarouselImages(carousel, record);
    }
});

// observer("[data-media-player-src-iframe]", {
//     inRange: (record) => {
//         new LoadItem(record, {
//             tag: "iframe",
//             src: "data-media-player-src-iframe"
//         }).load(() => {
//             new MediaPlayer(
//                 new VimeoMediaPlayerAdapter(
//                     document.querySelector(".media-player")
//                 )
//             );
//         });
//     }
// });

initializeVimeoMediaPlayer(document.querySelector(".media-player"));

const vse = document.querySelector(".validation-summary-errors");
const error = document.getElementById("vse-errors");

if (elementExists(vse) && elementExists(error)) {
    addEventListener("load", () => {
        setTimeout(() => {
            error?.scrollIntoView();
        }, 100);
    });
}

const validatePromoCodeAroundStatusScreen = (): void => {
    const form = document.querySelector<HTMLFormElement>(
        "[data-validate-promo-code]"
    );
    if (!form) return;

    const statusContainer = document.querySelector<HTMLElement>(
        "#promo-code-validation-status"
    );
    if (!statusContainer) return;

    const statusScreen = new StatusScreen("inline", statusContainer);
    let wasValidated = false;
    let capturePromoCode: string | undefined;

    const validateEvent = initializeValidateEvent(
        form,
        form.querySelector('button[type="button"]') as HTMLButtonElement
    );

    const input = validateEvent.inputs.find(
        (input) => input.id === "promoCode"
    );

    input?.addEventListener("keyup", (event) => {
        if (wasValidated) {
            wasValidated = false;
            statusScreen.close();
        }

        capturePromoCode && input.value === capturePromoCode
            ? statusScreen.open()
            : statusScreen.close();
    });

    validateEvent.submit?.addEventListener("click", (event) => {
        validateEvent.validateInputs(validateInputRules);

        if (validateEvent.isValidForm()) {
            statusScreen.busy("Checking...");
        }
    });

    validatePromoCode()
        .pass((promoCode) => {
            statusScreen.done(`Code ${promoCode} was successfully redeemed.`);
        })
        .fail((error) => {
            statusScreen.problem(error);
        })
        .finally(() => {
            capturePromoCode = input?.value;
            wasValidated = true;
        });
};

validatePromoCodeAroundStatusScreen();