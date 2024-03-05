// redefine new alert method
window.nativeAlert = window.alert;

window.alert = function (data) {
    // check if returned data contains validation from common.js
    var validationHeaders =
        "Please correct the following issues|Corrija los siguientes problemas|Veuillez corriger les probl�mes suivants";
    var result =
        (data && typeof data == "string" && data.match(validationHeaders)) ||
        "";

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
var _dtm = {};
_dtm.callbackAlert = function () {
    const error = document.getElementById("vse-errors");
    error.scrollIntoView();
};
_dtm.alert = function (data, target, cb) {
    // set callback function
    var cb = cb || function () {};
    // set fragment
    var frag = document.createDocumentFragment();
    // set validation summary error container
    var vse = document.createElement("div");
    // add classes to vse
    vse.className = "validation-summary-errors o-box--msg-error";
    vse.id = "vse_errors";
    // set unordered list
    var ul = document.createElement("ul");
    // convert string into array based on line breaks
    var a = data.split("\n");

    // iterate each item
    for (var i = 0; i < a.length; i++) {
        // check if item is blank
        if (a[i] === "") {
            // remove it from array
            a.splice(i, 1);
        } else {
            // create html tags
            var node =
                i === 0
                    ? document.createElement("span")
                    : document.createElement("li");
            // replace tabs
            node.innerHTML = a[i].replace(/\t/g, "");
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
        $("#vse"),
        $("form").find('span[style="color: #FF0000; font-weight: bold"]'),
        $("form").find(
            'span[style="color: rgb(255, 0, 0); font-weight: bold;"]'
        ),
        $(".vse")
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
            $("form").prepend(frag);
        }
    } else {
        // insert the frag into custom target
        e_target.html(frag);
    }

    // check if scroll override exists
    if (e_target.data("vse-scroll") === undefined) {
        // scroll to vse
        $.scrollTo(".validation-summary-errors");
    }

    $("[data-vse-button]").removeClass("hide");

    //Saving error message to pixelService
    var errors = {};

    for (var i = 0; i < a.length; i++) {
        var message = a[i].replace("\t", "");

        errors["Error " + i] = message;
    }

    $.post("/shared/services/pixelservice.ashx?at=error", errors);

    if (
        typeof errorsObj !== "undefined" &&
        typeof _AdaErrors != "undefined" &&
        _AdaErrors
    ) {
        triggerEvent("handleErrorValidationMapping", errorsObj);
        errorsObj = [];
    }

    return cb(data, e_target);
};
