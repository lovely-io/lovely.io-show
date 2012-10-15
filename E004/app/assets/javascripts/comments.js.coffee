# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Lovely ['dom', 'ajax', 'fx'], ($, Ajax)->


  CommentForm = $.Form.inherit

    constructor: (element, options)->
      @$super(element, options)

      @on 'submit', (event)->
        event.preventDefault()
        @send()

      @on 'keyup', 'checkButton'


    valid: ->
      !/^\s*$/.test(@find('#comment_text').value()) and
      /^[a-z0-9\-\.]+@[a-z0-9\-\.]+\.[a-z]{2,4}$/.test(@find('#comment_email').value())


    send: ->
      return @ unless @valid()
      @$super complete: (event)=>
        add_comment(event.ajax.responseText)
        @reset()


    checkButton: ->
      button   = @find('input[type="submit"]')

      if @valid()
        button.enable()
      else
        button.disable()


  $(document).delegate 'form.new_comment, form.edit_comment', 'focus', 'cast', CommentForm


  #########################################################

  add_comment = (comment)->
    $('#comments').append(comment)
    $('#comments .comment').pop().highlight()


  $(document).delegate '.comment a[data-method="delete"]', 'click', (event)->
    event.preventDefault()
    if @data('confirm') && confirm(@data('confirm'))
      Ajax.get @attr("href"), method: 'delete', params:
        authenticity_token: $('meta[name="csrf-token"]').attr('content')
      , complete: =>
        @parent('.comment').hide('fade')


