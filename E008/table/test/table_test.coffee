#
# Project's main unit test
#
# Copyright (C) 2013 Nikolay Nemshilov
#
{Test, should} = require('lovely')


Test.set "/table.html", """
  <html>
    <head>
      <script src="core.js"></script>
      <script src="table.js"></script>
    </head>
    <body>
      <table id="test">
        <thead>
          <tr>
            <th>Name</th>
            <th>Awesomeness</th>
          </tr>
        </thead>
        <tbody>
          <tr><td>lovely.io</td><td>10</td></tr>
          <tr><td>jquery</td><td>9</td></tr>
        </tbody>
        <tfoot>
          <tr><td>Total:</td><td>19</td></tr>
        </tfoot>
      </table>
    </body>
  </html>
"""



describe "Table", ->
  Table = table = window = document = $ = null

  before Test.load "/table.html", (build, win)->
    window   = win
    document = win.document
    $        = win.Lovely.module('dom')
    Table    = build
    table    = new Table(document.getElementById('test'))


  describe 'constructor', ->

    it "should build instances Table", ->
      t = new Table()
      t.should.be.instanceOf Table

    it "should build TABLE elements", ->
      t = new Table()
      t._.tagName.should.eql 'TABLE'

    it "should bypass options", ->
      t = new Table(id: 'my-table')
      t._.id.should.eql 'my-table'

    it "should accept raw dom elements", ->
      el = document.createElement('table')
      t  = new Table(el)
      t.should.be.instanceOf Table
      t._.should.equal el

  describe '#header', ->

    it "should return the table header rows", ->
      header = table.header()
      header.should.be.instanceOf $.NodeList
      header[0].should.equal $('#test thead tr')[0]

  describe '#footer', ->

    it "should return the footer rows", ->
      footer = table.footer()
      footer.should.be.instanceOf $.NodeList
      footer[0].should.equal $('#test tfoot tr')[0]

  describe '#rows', ->

    it "should return the list of rows", ->
      rows = table.rows()
      rows.should.be.instanceOf $.NodeList
      rows[0].should.equal $('#test tbody tr')[0]
      rows[1].should.equal $('#test tbody tr')[1]


  describe '#sort', ->

    it "should sort things by column index", ->
      table.sort(0)
      table.rows().map('text').join("\n").should.eql """
      jquery9
      lovely.io10
      """

    it "should sort by another columns as well", ->
      table.sort(1)
      table.rows().map('text').join("\n").should.eql """
      jquery9
      lovely.io10
      """

    it "should allow to sort columns both ways", ->
      table.sort(1, 'asc')
      table.rows().map('text').join("\n").should.eql """
      jquery9
      lovely.io10
      """

      table.sort(1, 'desc')
      table.rows().map('text').join("\n").should.eql """
      lovely.io10
      jquery9
      """

    it "should return the table itself back", ->
      table.sort(0).should.equal table



