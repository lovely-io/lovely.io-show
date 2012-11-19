#
# Project's main unit
#
# Copyright (C) 2012 Nikolay Nemshilov
#
class Game extends Element

  constructor: (size_x, size_y, density)->
    super 'div', class: 'mines-game'

    @append(
      @timer = new Timer(),
      @smile = new Smile(),
      @stats = new Stats(),
      @field = new Field(size_x, size_y, density))

    @on
      reset: @reset
      mark:  @mark
      fail:  @fail
      open:  @open
      done:  @done

    @reset()

    return @


  reset: ->
    @smile.reset()
    @timer.reset()
    @field.reset()
    @stats.reset()

    @mark()

# protected

  fail: ->
    @timer.stop()
    @smile.fail()
    @field.blow()

  done: ->
    @timer.stop()
    @smile.done()

  mark: ->
    @stats.update(
      @field.marked_cells,
      @field.rigged_cells)

  open: ->
    @smile.blink()
    @timer.start() unless @timer.active

