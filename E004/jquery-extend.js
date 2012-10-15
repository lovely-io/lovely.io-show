jQuery.prototype.fancyStuff = function() {
  for (var i = 0; i < this.length; i++) {
    this[i]; // do funcy stuff
  };
};

$('#my-element').fancyStuff();