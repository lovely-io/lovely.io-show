#
# HelloIe main file
#
# Copyright (C) 2013 Nikolay Nemshilov
#

include 'src/hello_ie'

# export your objects in the module
exports.version = '%{version}'
exports.show    = show
exports.hide    = hide

try
  document.createElement('<input/>')
  window.attachEvent('onload', show)

catch e


