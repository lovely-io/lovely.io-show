class Field extends Element

  constructor: (size_x, size_y, density)->
    super 'div', class: 'field'

    @size_x       = size_x
    @size_y       = size_y
    @total_cells  = size_x * size_y
    @rigged_cells = Math.floor(@total_cells / density)

    @on
      open: @open
      mark: @mark


  reset: ->
    @clear()

    @opened_cells = 0
    @marked_cells = 0
    @populated    = false
    @cells        = new core.List()

    for y in [0..@size_y-1]
      row = new Element('div').insertTo(@)

      for x in [0..@size_x-1]
        @cells.push(new Cell(x,y).insertTo(row))


  open: (event)->
    cell = event.target

    @populate(cell) unless @populated
    @neighbors(cell).forEach('open') if cell.mines is 0

    @opened_cells +=1
    @check()


  mark: (event)->
    @marked_cells += if event.target.marked then 1 else -1
    @check()


  blow: ->
    @cells.forEach (cell)->
      unless cell.opened
        if cell.marked && !cell.rigged
          cell.addClass('wrong')
        else if cell.rigged && !cell.marked
          cell.addClass('rigged')

# private

  # checks the field for completion
  check: ->
    if @marked_cells is @rigged_cells
      if (@opened_cells + @marked_cells) is @total_cells
        @emit('done')

    return @

  # populates the field with mines starting from the given cell
  populate: (cell)->
    neighbors = @neighbors(cell)

    candidates = @cells.filter (c)->
      c isnt cell and neighbors.indexOf(c) is -1

    `for (var j, x, i = candidates.length; i > 0;) {
      j = ~~(Math.random() * i); x = candidates[--i];
      candidates[i] = candidates[j]; candidates[j] = x;
    }`

    candidates.slice(0, @rigged_cells).forEach (cell)->
      cell.rigged = true
      @neighbors(cell).forEach('mine')
    , this

    @populated = true

  # finds a list of the cell neigbour cells
  neighbors: (cell)->
    result = new core.List()

    for i in [0..8]
      x = cell.pos_x +           (i % 3) - 1
      y = cell.pos_y + Math.floor(i / 3) - 1

      if x > -1 && y > -1 && x < @size_x && y < @size_y
        unless x is cell.pos_x && y is cell.pos_y
          result.push(@cells[y * @size_x + x])

    return result


