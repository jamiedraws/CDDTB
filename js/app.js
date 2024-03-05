(function (global) {
    global.requestIdleCallback =
        global.requestIdleCallback ||
        function (cb) {
            var start = Date.now();
            return setTimeout(function () {
                cb({
                    didTimeout: false,
                    timeRemaining: function () {
                        return Math.max(0, 50 - (Date.now() - start));
                    }
                });
            }, 1);
        };

    global.cancelIdleCallback =
        global.cancelIdleCallback ||
        function (id) {
            clearTimeout(id);
        };

    const create = Object.create(
        {
            addProperty: function (property, value) {
                Object.defineProperty(this, property, {
                    enumerable: true,
                    value: value
                });
            },
            addProperties: function (properties) {
                const access = this;
                Object.keys(properties).forEach(function (property) {
                    access.addProperty(property, properties[property]);
                });
            },
            createContext: function (inherit) {
                return Object.create(
                    inherit || Object.getPrototypeOf(this),
                    {}
                );
            },
            lock: function () {
                Object.freeze(this);
            }
        },
        {}
    );

    if (typeof global.app !== "object") {
        Object.defineProperty(global, "app", {
            value: create,
            writable: false,
            configurable: false
        });
    }

    app.addProperties({
        isString: function (data) {
            return typeof data === "string";
        },
        isStringNullOrWhiteSpace: function (data) {
            return this.isString(data) && data === "";
        },
        isArray: function (data) {
            return Array.isArray(data);
        },
        isFunction: function (data) {
            return typeof data === "function";
        },
        isObject: function (data) {
            return typeof data === "object" && !this.isArray(data);
        },
        elementExists: function (element) {
            let result = false;
            if (element) {
                let length = element.length;
                if (length !== undefined) {
                    result = length;
                } else {
                    result = document.body.contains(element);
                }
            }
            return result;
        },
        toArray: function (collection) {
            if (collection !== null && typeof collection !== "undefined") {
                const store = [];
                const ar = store.slice.call(collection);
                return ar;
            }
        },
        listen: function (eles, method, e) {
            if (this.elementExists(eles)) {
                const elements = this.toArray(eles),
                    event = e || "click";
                if (elements.length > 0) {
                    elements.forEach(function (ele) {
                        ele.addEventListener(event, method);
                    });
                } else {
                    eles.addEventListener(event, method);
                }
            }
        },
        require: function (properties, callback) {
            let status = true;
            const access = this;

            if (this.isArray(properties)) {
                properties.forEach(function (property) {
                    if (!access.hasOwnProperty(property)) {
                        status = false;
                    }
                });
                if (status && this.isFunction(callback)) {
                    callback();
                }
            }

            return status;
        },
        /**
         * creates a new HTML element
         * and goes through each attribute pair and sets the attribute name and value
         * then returns the element
         * @param {string} tag the name of the HTML tag to create
         * @param {object} attributes the object containing the tag's attribute name and value pairs
         */
        createElement: function (tag, attributes) {
            const element = document.createElement(tag);
            if (typeof attributes === "object") {
                Object.keys(attributes).forEach(function (attribute) {
                    element.setAttribute(attribute, attributes[attribute]);
                });
            }
            return element;
        },

        /**
         * creates a new HTML element
         * and appends it to the document body
         * @param {string} tag name of the HTML element to be appended
         * @return {object} list of attributes and values associated with the element
         */
        appendElement: function (tag, attributes) {
            const element = this.createElement(tag, attributes);
            document.body.appendChild(element);
            return element;
        },

        /**
         * creates a new HTML element using the value of "ele",
         * sets the src attribute to the value of "src",
         * optionally applies other attributes
         * and appends to the end of the document body
         * @param {string} src representation of a url source
         * @param {string} tag representation of an HTML element to create in the document
         * @param {object} attributes optional object of HTML attribute value pairs to add to the created element
         * @return {node} html element with the resource request attached or false if failure occurs
         */
        requestResource: function (src, tag, attributes) {
            if (typeof src !== "string") {
                console.warn("Cannot request a resource without a valid URL");
                return false;
            }

            if (typeof tag !== "string") {
                console.warn(
                    "Cannot request a resource without a valid element"
                );
                return false;
            }

            if (typeof attributes === "object") {
                if (tag === "link") {
                    attributes.href = src;
                } else {
                    attributes.src = src;
                }
            } else {
                if (tag === "link") {
                    attributes = { href: src };
                } else {
                    attributes = { src: src };
                }
            }

            try {
                return this.appendElement(tag, attributes);
            } catch (error) {
                console.log(error);
                return false;
            }
        },

        /**
         * uses an array of JavaScript url resources as "strings"
         * and dispatches a request for the resource.
         * if the response returns with HTTP status code 200, a callback function "success" will fire
         * otherwise, the next request will be dispatched
         * if none of the url resources return with HTTP status code 200, a "fail" callback function will fire
         * @param {array} srcset an array of url sources
         * @param {function} success callback function when the first url returns a HTTP status code of 200
         * @param {function} fail callback function when none of the urls return a HTTP status code of 200
         */
        requestScriptOrFallback: function (srcset, success, fail) {
            const dispatch = function (index) {
                const val = srcset[index];
                if (typeof val === "undefined") {
                    if (typeof fail === "function") {
                        fail();
                    }
                    return false;
                }
                const response = this.requestResource(val, "script");
                response.onerror = function () {
                    index = index + 1;
                    dispatch.call(app, index);
                };
                response.onload = success;
            };
            dispatch.call(this, 0);
        }
    });
})(window);
