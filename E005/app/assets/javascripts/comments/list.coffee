#
# The comments list controller
#
Lovely 'comments-list', ['dom', 'ajax', 'fx'], ($, Ajax)->

  $.Element.inherit

    constructor: ->
      @$super.apply(@, arguments)

      @delegate '.comment a[data-method="delete"]', 'click', (event)=>
        event.preventDefault()
        @destroy(event.target)

      @delegate '.pagination a', 'click', (event)=>
        event.preventDefault()
        @show event.target


    show: (link)->
      @load link.attr('href')


    create: (comment)->
      @append comment
      @find('.comment').pop().highlight()

      return @


    destroy: (link)->
      message = link.data('confirm')
      comment = link.parent('.comment')

      if !message || confirm(message)
        Ajax.get link.attr("href"), method: 'delete', params:
          authenticity_token: $('meta[name="csrf-token"]').attr('content')
        , complete: ->
          comment.remove('fade')

      return @
