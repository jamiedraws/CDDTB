(function (global) {
	if ("app" in global) {
		if (!String.prototype.trim) {
			String.prototype.trim = function () {
				return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, "");
			};
		}

		const validator = app.createContext(app);
		
		validator.addProperties({
			errorClass: "message__is-invalid",
			successClass: "message__is-valid",
			selectModifier: "-select",
			scrollElement: function () {
				return document.getElementsByClassName("error_scrollTo")[0];
			},
			isInView: function (ele) {
				var rect = ele.getBoundingClientRect();

				return (
					rect.top >= 0 &&
					rect.left >= 0 &&
					rect.bottom <=
						(window.innerHeight ||
							document.documentElement
								.clientHeight) /* or $(window).height() */ &&
					rect.right <=
						(window.innerWidth ||
							document.documentElement
								.clientWidth) /* or $(window).width() */
				);
			},
			showError: function (ele) {
				if (ele.nodeName === "SELECT") {
					this.showErrorSelect(ele);
				} else {
					ele.classList.remove(this.successClass);
					ele.classList.add(this.errorClass);
				}
			},
			hideError: function (ele) {
				if (ele.nodeName === "SELECT") {
					this.hideErrorSelect(ele);
				} else {
					ele.classList.remove(this.errorClass);
					ele.classList.add(this.successClass);
				}
			},
			showErrorSelect: function (ele) {
				let parent = document.getElementById(ele.dataset["parent"]);
				if (parent) {
					parent.classList.remove(
						this.successClass + this.selectModifier
					);
					parent.classList.add(this.errorClass + this.selectModifier);
				}
			},
			hideErrorSelect: function (ele) {
				let parent = document.getElementById(ele.dataset["parent"]);
				if (parent) {
					parent.classList.remove(
						this.errorClass + this.selectModifier
					);
					parent.classList.add(
						this.successClass + this.selectModifier
					);
				}
			},
			getForms: function () {
				return document.getElementsByName("acceptOffer");
			},
			isEmpty: function (value) {
				if (
					value === undefined ||
					value === null ||
					value.trim() === ""
				) {
					return true;
				}
				return false;
			},
			validPhone: function (value) {
				let phone = value.replace(/[^0-9]/g, "");
				if (phone.length !== 10) {
					return false;
				} else {
					return true;
				}
			},
			validCard: function (value) {
				let valid = true;
				switch (CheckCardNum(value)) {
					case 0:
						valid = false;
						break;
					case 2:
						valid = false;
						break;
					case 3:
						valid = false;
						break;
				}

				return valid;
			},
			validExp: function () {
				let valid = true;
				let cmonth = document.getElementById("CardExpirationMonth");
				let cyear = document.getElementById("CardExpirationYear");

				if (this.elementExists(cmonth) && this.elementExists(cyear)) {
					if (!IsValidCreditCardDate(cmonth.value, cyear.value)) {
						valid = false;
					}
				}
				return valid;
			},
			validCvv: function (value) {
				let valid = true;
				let cardType = document.getElementById("CardType");
				if (this.elementExists(cardType)) {
					var cvvLength = value.length;
					switch (cardType.value.toLowerCase()) {
						case "v":
						case "m":
						case "d":
							if (cvvLength !== 3) {
								valid = false;
							}
							break;
						case "ax":
							if (cvvLength !== 4) {
								valid = false;
							}
							break;
					}
				}

				return valid;
			},
			isValid: function (value, regex, type) {
				let valid = true;
				if (this.isEmpty(value)) {
					valid = false;
				} else if (!this.isEmpty(regex)) {
					let reg = new RegExp(regex);
					if (!reg.test(value)) {
						valid = false;
					}
				} else if (type) {
					switch (type) {
						case "phone":
							valid = this.validPhone(value);
							break;
						case "card":
							valid = this.validCard(value);
							break;
						case "cardExp":
							valid = this.validExp();
							break;
						case "cvv":
							valid = this.validCvv(value);
							break;
						case 'terms':
							valid = this.validTerms();
					}
				}
				return valid;
			},
			validTerms: function () {
				var isChecked = document.getElementById('TermsOfService').checked;
				return isChecked;
            },
			validElement: function (ele) {
				let valid = true;
				if ((ele.nodeName === "INPUT" || ele.nodeName === "SELECT") &&
					ele.dataset["required"] && ele.dataset["required"] == "true"
				) {
					if (
						this.isValid(
							ele.value,
							ele.dataset["pattern"],
							ele.dataset["validationtype"]
						)
					) {
						ele.setCustomValidity("");
						this.hideError(ele);
					} else {
						ele.setCustomValidity("Invalid");
						this.showError(ele);
						valid = false;
					}
				}
				return valid;
			},
			unbindValidation: function () {
				let e = 'click';
				this.unlisten(validator.getForms(), window.DtmValidateForm, e);
				this.unlisten(validator.getForms(),validateForm, e);
			},
			unlisten: function (eles, method, e) {
				if (this.elementExists(eles)) {
					const elements = this.toArray(eles),
						event = e || "click";
					if (elements.length > 0) {
						elements.forEach(function (ele) {
							ele.removeEventListener(event, method);
						});
					} else {
						eles.removeEventListener(event, method);
					}
				}
			},
			validateForm: function (e) {
				let validForm = validateForm(e, false, true);

				if (validForm.length == 0) {

					let inputs = document.getElementsByTagName('input');
					for (var index = 0; index < inputs.length; ++index) {
						inputs[index].setCustomValidity("");
						this.hideError(inputs[index]);
					} 
					if (typeof qasValidateAddress === "function") {
						DtmUnbindValidation();
						e.preventDefault();
						qasValidateAddress();
	
					} else {
						triggerEvent("FORM_SUBMIT");
					}
                }
				
		
				
			}
		});
		window.validator = validator;
		window.DtmUnbindValidation = validator.unbindValidation.bind(validator);
		window.DtmValidateForm = validator.validateForm.bind(validator);

		document.addEventListener("DOMContentLoaded", function () {
			validator.listen(
				validator.getForms(),
				window.DtmValidateForm,
				"click"
			);
		});

		
	}
})(window);
