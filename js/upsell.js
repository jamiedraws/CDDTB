const UpsellEngine = function () {
    const enabledClass = "upsell-cart__btn--enable",
        disabledClass = "upsell-cart__btn--disable";


    const toggleQtyBtns = function (ele, enable) {

        if (enable) {
            ele.classList.add(enabledClass);
            ele.classList.remove(disabledClass);
        } else {
            ele.classList.add(disabledClass);
            ele.classList.remove(enabledClass);
        }
    };

    this.AddToCart = function (ele) {
        const product = ele.dataset.product;

        if (ele.innerHTML.indexOf("Remove") >= 0) {
            Update(product, 0);
            ele.classList.remove("added");
        } else {
            Update(product, document.getElementById(product + "Qty").value);
            ele.classList.add("added");
        }

    };

    this.UpdateState = function () {
        const items = document.getElementsByClassName("upsellItem");

        for (var i = 0; i < items.length; i++) {
            const item = items[i],
                code = item.dataset.product,
                codeEle = document.querySelectorAll("[name*=ActionCode][value='" + code + "']")[0];
            if (codeEle) {
                const index = codeEle.name.replace("ActionCode", ""),
                    qty = document.getElementById("ActionQuantity" + index).value;

                if (qty > 0) {
                    updateBtnState(item, true);
                } else {
                    updateBtnState(item, false);
                }

            } else {
                updateBtnState(item, false);
            }
        }

    };

    const updateBtnState = function (ele, exists) {

        if (exists) {
            ele.innerHTML = "Remove From Cart";
        } else {
            ele.innerHTML = "Add To Cart";
        }

    };

    this.AddQuantity = function (ele) {
        const dataProduct = ele.dataset.product,
            func = ele.dataset.exp,
            qtyEle = document.getElementById(dataProduct + "Qty"),
            minQty = parseInt(qtyEle.dataset.min),
            maxQty = parseInt(qtyEle.dataset.max),
            index = ele.dataset.index,
            actQtyEle = document.getElementById("ActionQuantity" + index),
            mode = ele.dataset.mode,
            cartBtn = document.getElementById(dataProduct + "Btn");


        let currentQty = parseInt(qtyEle.value),
            minEle,
            addEle;

        switch (func) {
            case "add":
                currentQty++;
                addEle = ele;
                minEle = document.getElementById(dataProduct + "Min");
                break;
            case "min":
                currentQty--;
                addEle = document.getElementById(dataProduct + "Add");
                minEle = ele;
                break;
        }

        if (maxQty === currentQty) {
            toggleQtyBtns(addEle, false);
        } else {
            toggleQtyBtns(addEle, true);
        }

        if (minQty === currentQty) {
            toggleQtyBtns(minEle, false);
        } else {
            toggleQtyBtns(minEle, true);
        }

        qtyEle.value = currentQty;
        if (index && actQtyEle) {
            actQtyEle.value = currentQty;
        }

        if (mode && mode === "cart" && cartBtn && cartBtn.innerHTML.indexOf("Remove") >= 0) {
            Update(dataProduct, currentQty);
        }
    };

};

const _upsellEngine = new UpsellEngine();
