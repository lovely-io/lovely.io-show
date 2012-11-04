# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Lovely ['dom', 'ajax', 'fx'], ($, Ajax)->

  $(document).delegate 'form.new_comment', 'submit', (event)->
    event.preventDefault()

    @send complete: (event)=>
      $('#comments').append(event.ajax.responseText)
      $('#comments .comment').pop().highlight()
      @reset()


  $(document).delegate 'form.new_comment', 'focus', ->
    textarea = @find('textarea')
    button   = @find('input[type="submit"]')

    textarea.on 'keyup', ->
      if /^\s*$/.test(@value())
        button.disable()
      else
        button.enable()


  $(document).delegate '.comment a[data-method="delete"]', 'click', (event)->
    event.preventDefault()
    if @data('confirm') && confirm(@data('confirm'))
      Ajax.get @attr("href"), method: 'delete', params:
        authenticity_token: $('meta[name="csrf-token"]').attr('content')
      , complete: =>
        @parent('.comment').hide('fade')

