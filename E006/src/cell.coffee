class Cell extends Element

  constructor: (x, y)->
    @pos_x  = x
    @pos_y  = y
    @mines  = 0

    @rigged = false
    @marked = false
    @opened = false

    super 'div', class: 'cell'

    @on
      mousedown: (event)=>
        if event.which is 1 then @open() else @mark()

      contextmenu: -> false


  open: ->
    unless @opened or @marked
      @opened = true

      if @rigged
        @addClass('failed')
        @emit 'fail'

      else
        @addClass('opened')
        @emit 'open'

  mark: ->
    unless @opened
      @toggleClass('marked')
      @marked = @hasClass('marked')
      @emit 'mark'

  mine: ->
    @html(@mines += 1)
    @addClass "with-#{@mines}-mines"

