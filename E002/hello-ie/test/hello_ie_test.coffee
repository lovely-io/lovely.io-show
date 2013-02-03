#
# Project's main unit test
#
# Copyright (C) 2013 Nikolay Nemshilov
#
{Test, assert} = require('lovely')

describe "HelloIe", ->
  HelloIe = window = document = $ = null

  before Test.load module, (build, win)->
    HelloIe = build
    window   = win
    document = win.document
    $        = win.Lovely.module('dom')

  it "should have a version", ->
    assert.ok HelloIe.version

