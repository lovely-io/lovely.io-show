#
# Project's main unit
#
# Copyright (C) 2013 Nikolay Nemshilov
#
class Table extends Element

  constructor: (options)->
    if options and options.nodeType is 1
      element = options
      options = undefined
    else
      element = 'table'

    super element, options


  header: ->
    @find('thead tr')

  footer: ->
    @find('tfoot tr')

  rows: ->
    @find('tbody tr')

  sort: (index, order)->
    rows = @rows().sort (row_a, row_b)->
      a = row_a.find('td')[index].text()
      b = row_b.find('td')[index].text()

      a = parseFloat(a) if /^\d+$/.test(a)
      b = parseFloat(b) if /^\d+$/.test(b)

      if order is 'desc'
        if a < b then 1 else if a > b then -1 : 0
      else # asc
        if a > b then 1 else if a < b then -1 : 0

    tbody = @first('tbody')

    rows.forEach (row)->
      tbody.append(row)

    return @ # self





