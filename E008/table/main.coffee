#
# Table main file
#
# Copyright (C) 2013 Nikolay Nemshilov
#

# hook up dependencies
core    = require('core')
$       = require('dom')

# local variables assignments
ext     = core.ext
Class   = core.Class
Element = $.Element

# glue in your files
include 'src/table'

# export your objects in the module
exports = ext Table,
  version: '%{version}'
