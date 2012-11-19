#
# Mines main file
#
# Copyright (C) 2012 Nikolay Nemshilov
#

# hook up dependencies
core    = require('core')
$       = require('dom')
Timer   = require('timer')

# local variables assignments
ext     = core.ext
Class   = core.Class
Element = $.Element

# glue in your files
include 'src/game'
include 'src/smile'
include 'src/stats'
include 'src/field'
include 'src/cell'

exports = ext Game,
  version: '%{version}'
