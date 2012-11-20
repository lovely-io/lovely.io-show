class Smile extends Element

  constructor: ->
    super 'div', class: 'smile'

    @on 'click', 'emit', 'reset'

  reset: ->
    @setClass('smile')

  blink: ->
    @addClass('blink')
    window.setTimeout =>
      @removeClass('blink')
    , 400

  fail: ->
    @addClass('fail')

  done: ->
    @addClass('done')
