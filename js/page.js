(function (global) {
    if ("app" in global) {
        const defer = app.createContext(app);
        const order = app.createContext(app);

        defer.addProperties({
            hasObserve: function (callback) {
                if ("Observe" in global) {
                    callback(Observe);
                }
            },
            isAvailable: function (selector, response) {
                let result = response || false;
                if (this.isString(selector)) {
                    const element = document.querySelector(selector);
                    if (this.elementExists(element)) {
                        result = element;
                    }
                }
                return result;
            },
            viewElement: function (config, inRangeCallback, outRangeCallback) {
                if (this.isObject(config)) {
                    let element = this.isAvailable(config.selector);

                    if (element && this.isString(config.state)) {
                        element = this.isAvailable(config.neighbor, element);

                        this.hasObserve(function () {
                            const func = function () {},
                                inRange = inRangeCallback || func,
                                outRange = outRangeCallback || func;

                            Observe({
                                selector: config.selector,
                                inRange: inRange.bind(element, config),
                                outRange: outRange.bind(element, config),
                                unObserve: false
                            });
                        });
                    }
                }
            }
        });

        defer.hasObserve(function () {
            app.require(["lazy"], function () {
                Observe({
                    selector: "[data-src-img]",
                    inRange: function (loadItem) {
                        defer.lazy(loadItem);
                    }
                });

                Observe({
                    selector: "[data-src-iframe]",
                    inRange: function (record) {
                        defer.lazy(record, {
                            tag: "iframe",
                            src: "data-src-iframe",
                            ondemand: true
                        });
                    }
                });
            });

            Observe({
                selector: ".view--remove-nav",
                inRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.hide();
                    }
                },
                outRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.show();
                    }
                },
                unObserve: false,
                options: {
                    threshold: 1.0
                }
            });

            const enableFingerPrintNav = function () {
                const fpNav = document.querySelector(".fp-nav");
                if (app.elementExists(fpNav)) {
                    Observe({
                        selector: ".form",
                        inRange: function () {
                            fpNav.classList.add("fp-nav--is-hidden");
                        },
                        outRange: function () {
                            fpNav.classList.remove("fp-nav--is-hidden");
                        },
                        unObserve: false
                    });
                }
            };

            addEventListener(
                "load",
                requestIdleCallback.bind(this, enableFingerPrintNav)
            );
        });

        defer.lock();
        app.addProperty("defer", defer);

        order.addProperties({
            buttons: order.toArray(
                document.querySelectorAll("[href^='#order']")
            ),
            showButtons: function () {
                this.buttons.forEach(function (button) {
                    if (button.classList.contains("defer-input")) {
                        button.classList.add("defer-input--ready-for-input");
                    }
                });
            },
            init: function () {
                this.showButtons();
            }
        });

        order.init();
        order.lock();
        app.addProperty("order", order);

        if ("_dtm" in global) {
            const error = document.getElementById("vse-error");
            const vse = document.querySelector(".validation-summary-errors");

            if (app.elementExists(error)) {
                _dtm.callbackAlert = function () {
                    error.scrollIntoView();
                };
            }

            if (app.elementExists(vse) && app.elementExists(error)) {
                error.scrollIntoView();
            }
        }

        const form = document.querySelector(".form");
        if (app.elementExists(form)) {
            addEventListener("load", function () {
                form.classList.add("form--is-ready", "load-item--success");
                const content = form.querySelector(".load-item__progress");
                if (app.elementExists(content)) {
                    content.classList.add("load-item__success");
                }
            });
        }

        const toast = app.createContext(app);

        toast.addProperties({
            hide: function () {
                if (this.require(["element"])) {
                    this.element.classList.add("toast--hidden");
                }
            },
            show: function () {
                if (this.require(["element"])) {
                    this.element.classList.remove("toast--hidden");
                }
            },
            handleCloseButton: function (element) {
                const close = element.querySelector(".toast__close");
                if (this.elementExists(close)) {
                    this.listen(close, this.hide.bind(this));
                }
            },
            register: function (id) {
                if (this.isString(id)) {
                    const element = document.getElementById(id);
                    if (this.elementExists(element)) {
                        this.addProperty("element", element);
                        this.handleCloseButton(element);
                    }
                }

                return this.publicInterface();
            },
            publicInterface: function () {
                return Object.create(
                    {},
                    {
                        show: {
                            value: this.show.bind(this)
                        },
                        hide: {
                            value: this.hide.bind(this)
                        }
                    }
                );
            }
        });

        app.addProperty("toast", toast.register.bind(toast));
    }
})(window);
