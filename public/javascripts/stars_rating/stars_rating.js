(function() {
  Event.observe(document, 'mouseup', function(event) {
    var target = event.element();
    if ((target.tagName == 'BUTTON') && target.hasClassName('stars_rating')) {
      var rating = (event.pointerX() - target.cumulativeOffset().left) / target.offsetWidth;
      new Ajax.Request(target.readAttribute('data-rating-url'), {
        parameters: {'rating[rational_rating]': rating},
        onSuccess: function() {
          target.addClassName('static');
        },
        onFailure: function() {
        }
      });
    }
  });

  Event.observe(document, 'mouseover', function(event) {
    var target = event.element();
    if ((target.tagName == 'BUTTON') && target.hasClassName('stars_rating') && !target.hasClassName('static')) {

      var targetX = target.cumulativeOffset().left;
      var targetWidth = target.offsetWidth;
      var targetHeight = target.offsetHeight;
      var backgroundOffset = -(target.offsetHeight * 5);

      // Register mousemove event dynamically to save resources
      var mouseMoveObserver = target.observe('mousemove', function(event) {
        target.style.backgroundPosition = ['left ', backgroundOffset - Math.ceil(((event.pointerX() - targetX) / targetWidth) * 5) * targetHeight, 'px'].join('');
      });

      // Remove event listeners on mouseout
      var mouseOutObserver = target.observe('mouseout', function(event) {
        target.style.backgroundPosition = '';
        Event.stopObserving(mouseMoveObserver);
        Event.stopObserving(mouseOutObserver);
      });
    }
  });
})();
