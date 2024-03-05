(function (global) {
    if ("app" in global) {
        const braintree = app.createContext(app);

        braintree.addProperties({
            cardExpirationMonth: document.getElementById("CardExpirationCt"),
            cardExpirationYear: document.getElementById("CardExpirationYearCt"),
            cardCvv2: document.getElementById("CardCVV2Ct"),
            restyleCardExpirationMonth: function () {
                const dropdownbutton =
                    this.cardExpirationMonth.querySelector(".form__button");

                if (braintree.elementExists(dropdownbutton)) {
                    dropdownbutton.remove();
                }
            },
            restyleCardExpirationYear: function () {
                this.cardExpirationYear.remove();
            },
            restyleCvv2: function (field) {
                const hostedField =
                    field ||
                    this.cardCvv2.querySelector("#CardCvv2HostedField");

                if (braintree.elementExists(hostedField)) {
                    hostedField.classList.add("form__field");
                }
            },
            getHostedFieldByContainer: function (container, callback) {
                const observer = new MutationObserver(function (
                    mutationsList,
                    observer
                ) {
                    mutationsList.forEach(function (mutation) {
                        const hasHostedField = braintree
                            .toArray(mutation.addedNodes)
                            .filter(function (node) {
                                return node.classList.contains("btHostedField");
                            })[0];

                        if (hasHostedField && braintree.isFunction(callback)) {
                            callback(hasHostedField);
                            observer.disconnect();
                        }
                    });
                });

                observer.observe(container, {
                    attributes: true,
                    childList: true,
                    subtree: true
                });
            }
        });

        braintree.getHostedFieldByContainer(
            braintree.cardCvv2,
            braintree.restyleCvv2.bind(braintree)
        );
        braintree.restyleCardExpirationMonth();
        braintree.restyleCardExpirationYear();
    }
})(window);
