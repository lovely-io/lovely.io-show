var jQuery = function(items) {
  for (var i = 0; i < items.length; i++) {
    this[i] = items[i];
  };

  this.length = items.length;
};

jQuery.prototype.addClass = function (name) {
  for (var i = 0; i < this.length; i++) {
    this[i].className += ' '+ name;
  };
};

var $ = function(css_rule) {
  return new jQuery(find_nodes_for(css_rule));
};

$('#my-element').addClass('my-class');
