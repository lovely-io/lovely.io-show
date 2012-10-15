var MyElement = Element.inherit({

  fancyStuff: function() {
    // do some funcy stuff
  }

});

var element = new MyElement(document.getElementById('my-element'));

element.fancyStuff();
element.addClass('my-class');