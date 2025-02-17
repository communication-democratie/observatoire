/*global Notyf */
window.addEventListener('DOMContentLoaded', function () {
    'use strict';
    var notyfAlerts = document.getElementsByClassName('js-notyf-alert'),
        notyfNotices = document.getElementsByClassName('js-notyf-notice'),
        notyf = new Notyf(),
        openNotyf;

    openNotyf = function (element, type, backgroundColor) {
        notyf.open({
            type: type,
            icon: false,
            background: backgroundColor,
            position: {
                x: 'center',
                y: 'bottom'
            },
            message: element.innerText,
            duration: 9000,
            ripple: true,
            dismissible: true
        });
    };

    if (notyfAlerts.length > 0) {
        openNotyf(notyfAlerts[0], 'error', '#E1531B');
    }

    if (notyfNotices.length > 0) {
        openNotyf(notyfNotices[0], 'success', '#0D3CC8');
    }
});
