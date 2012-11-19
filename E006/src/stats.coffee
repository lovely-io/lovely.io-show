class Stats extends Element

  constructor: ->
    super 'div', class: 'stats'

  reset: ->
    @update(0, 0)

  update: (marked, total)->
    super "#{marked}/#{total}"
