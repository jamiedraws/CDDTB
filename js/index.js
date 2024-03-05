(function (global) {
    if ("app" in global) {
        app.require(["defer"], function () {
            const view = app.createContext(app.defer);
            const media = app.createContext(app.defer);

            view.hasObserve(function () {
                Observe({
                    selector: ".view--observe",
                    inRange: function (entry) {
                        entry.classList.add("view--in-view");
                    }
                });
            });

            media.addProperties({
                root: document.querySelector(".media__player"),
                hasSource: function () {
                    return media.isString(media.getSource(element));
                },
                getSource: function (element) {
                    return element.dataset.srcIframe;
                },
                updateSource: function (element, id) {
                    const source = media.getSource(element);
                    return source.replace(/(\d{9})/, id);
                },
                getId: function (element) {
                    return element.dataset.videoId;
                },
                getIframe: function (element) {
                    return element.querySelector("iframe");
                },
                hasVimeo: function () {
                    return "Vimeo" in global;
                },
                setVimeo: function (iframe) {
                    let result = false;
                    if (media.hasVimeo() && media.elementExists(iframe)) {
                        result = new Vimeo.Player(iframe);
                    }
                    return result;
                },
                getCurrentButton: function (button) {
                    const lastSelectedButton = media.root.querySelector(
                        ".button--is-selected"
                    );
                    if (media.elementExists(lastSelectedButton)) {
                        lastSelectedButton.classList.remove(
                            "button--is-selected"
                        );
                    }
                    button.classList.add("button--is-selected");
                },
                updateVideo: function (id) {
                    if (media.isString(id)) {
                        const source = media.updateSource(media.video, id);

                        if (media.vimeo) {
                            media.vimeo
                                .loadVideo(id)
                                .then(media.playVideo)
                                .catch(function (error) {
                                    console.log(error);
                                });
                        } else {
                            const iframe = media.getIframe(media.video);
                            if (media.elementExists(iframe)) {
                                iframe.src = source;
                            }
                        }
                    }
                },
                playVideo: function () {
                    if (
                        media.isObject(media.vimeo) &&
                        !media.isActive &&
                        media.isUserPause
                    ) {
                        media.vimeo.play();
                    }
                },
                pauseVideo: function () {
                    if (
                        media.isObject(media.vimeo) &&
                        media.isActive &&
                        media.isUserPlay
                    ) {
                        media.vimeo.pause();
                    }
                },
                hasIframe: function (element) {
                    return media.elementExists(media.getIframe(element));
                },
                handleEvents: function () {
                    const buttons =
                        media.root.querySelectorAll("[data-video-id]");

                    media.listen(buttons, function () {
                        const id = media.getId(this);
                        media.getCurrentButton(this);
                        media.updateVideo(id);
                    });

                    if (media.isObject(media.vimeo)) {
                        media.vimeo.on("play", function () {
                            media.isActive = true;
                            media.isUserPlay = true;
                            media.isUserPause = false;
                        });

                        media.vimeo.on("pause", function () {
                            media.isActive = false;
                            media.isUserPlay = false;
                            media.isUserPause = true;
                        });
                    }
                },
                processor: (function () {
                    let init = false;

                    return function (element) {
                        if (media.hasIframe(element)) {
                            if (!media.vimeo) {
                                const vimeo = media.setVimeo(
                                    media.getIframe(element)
                                );
                                media.addProperty("vimeo", vimeo);
                            }

                            if (!media.video) {
                                media.addProperty("video", element);
                            }

                            if (!init) {
                                init = true;
                                media.handleEvents();
                            } else {
                                media.playVideo();
                            }
                        } else {
                            setTimeout(
                                media.processor.bind(media, element),
                                1000
                            );
                        }
                    };
                })()
            });

            media.hasObserve(function () {
                Observe({
                    selector: ".media__video",
                    inRange: media.processor.bind(media),
                    outRange: media.pauseVideo,
                    unObserve: false,
                    options: {
                        threshold: 1.0
                    }
                });
            });

            app.defer.hasObserve(function () {
                Observe({
                    selector: ".theme--bg",
                    inRange: function (element) {
                        element.classList.add("theme--bg-is-visible");
                    }
                });
            });
        });
    }
})(window);
