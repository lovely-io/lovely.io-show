HTMLElement.prototype.visible = function(name) {
  this.className += ' '+ name;
};

var element = document.getElementById('my-element');

element.addClass('new-class');

