var Element = function(raw_element) {
  this._ = raw_element;
};

Element.prototype.addClass = function(name) {
  this._.className += " "+ name;
};


var element = new Element(document.getElementById('my-element'));

element.addClass('new-class');
