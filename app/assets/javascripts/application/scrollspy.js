window.ocp = window.ocp || {};

window.ocp.scrollspy = {
    init: function () {
        'use strict';
        this.spyContainer = document.querySelector('[data-bs-spy="scroll"]');
        this.activeClass = 'active-item';
        
        if (this.spyContainer === null) {
            return;
        }
        
        this.tocNavigation = document.getElementById('toc-content');
        window.addEventListener('activate.bs.scrollspy', this.scrollspy.bind(this));
    },
    scrollspy: function () {
        'use strict';
        var listItems = this.tocNavigation.querySelectorAll('li');
        for (var i = 0; i < listItems.length; i++) {
            listItems[i].removeAttribute("class");
        }
        var activeLink = this.tocNavigation.querySelector('a.active');
        if (activeLink) {
            var activeListItem = activeLink.parentNode;
            activeListItem.classList.add(this.activeClass);
        }
    },
}

window.ocp.scrollspy.init();