(function (global) {
    if ("app" in global) {
        app.require(["defer"], function () {
            const carousel = app.createContext(app.defer);

            Slide.proto({
                getCurrentIndex: function () {
                    return parseInt(this.dataset.slideIndex);
                },
            });

            const hasIntersectionObserver = function () {
                return "IntersectionObserver" in window ? false : true;
            };

            carousel.toArray(document.querySelectorAll(".carousel--fade")).forEach(function (carouselItem) {
                const id = "#" + carouselItem.id;

                Slide.into(
                    carouselItem,
                    {
                        currentState: "carousel__item--current",
                    },
                    function () {
                        const self = this;

                        self.handleRotation(false);
                        self.setShim(true);
                        self.watch(function (currentIndex, prevIndex) {
                            if (self.isAuto()) {
                                const prevSlide = this.children.item(prevIndex),
                                    currentSlide = this.children.item(currentIndex);

                                prevSlide.classList.remove(self.currentState);
                                currentSlide.classList.add(self.currentState);
                            }
                        });

                        let observer;

                        carousel.hasObserve(function () {
                            Observe({
                                selector: id,
                                inRange: function () {
                                    observer = setTimeout(self.play.bind(self), self.getDelay());
                                },
                                outRange: function () {
                                    clearTimeout(observer);
                                    self.pause();
                                },
                                unObserve: hasIntersectionObserver(),
                                options: {
                                    threshold: 0.5,
                                },
                            });
                        });
                    }
                );
            });

            carousel.toArray(document.querySelectorAll(".slide")).forEach(function (slide) {
                carousel.hasObserve(function () {
                    const into = slide.querySelector(".slide__into"),
                        id = "#" + into.id;

                    Observe({
                        selector: id,
                        inRange: function () {
                            Slide.into(
                                into,
                                {
                                    container: slide,
                                    prevButton: slide.querySelector(".slide__prev"),
                                    nextButton: slide.querySelector(".slide__next"),
                                    thumbnails: slide.querySelector(".slide__thumbnails"),
                                },
                                function () {
                                    const self = this;

                                    self.container.classList.add("slide--is-ready");

                                    if (self.prevButton) {
                                        self.prevButton.addEventListener("click", function () {
                                            self.prev();
                                        });
                                    }

                                    if (self.nextButton) {
                                        self.nextButton.addEventListener("click", function () {
                                            self.next();
                                        });
                                    }

                                    if (self.thumbnails) {
                                        const thumbnailList = self.thumbnails.querySelectorAll(".slide__thumbnail");

                                        carousel.listen(thumbnailList, function (event) {
                                            event.preventDefault();
                                            const index = self.getCurrentIndex.call(this);
                                            self.goto(index);
                                        });
                                    }

                                    self.watch(function (index) {
                                        self.selectThumbnail(index);

                                        const slide = self.children.item(index);
                                        if (slide) {
                                            app.require(["lazy"], function () {
                                                carousel.lazy(slide);
                                            });
                                        }

                                        self.updateSlideVisibility(index);
                                        self.observeLiveRegion();
                                    });
                                }
                            );
                        },
                    });
                });
            });
        });
    }
})(window);
