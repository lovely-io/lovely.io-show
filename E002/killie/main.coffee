#
# Killie main file
#
# Copyright (C) 2011 Nikolay Nemshilov
#

# glue in your files
include 'src/killie'

# export your objects in the module
exports.version = '%{version}'
exports.show    = show
exports.hide    = hide


try
  document.createElement('<input/>')
  browser_is_old = true
catch e
  browser_is_old = false

if browser_is_old
  window.attachEvent 'onload', show

