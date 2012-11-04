#
# The comments form controller
#
Lovely 'comments-form', ['dom', 'ajax'], ($, Ajax)->

  $.Form.inherit

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
        @emit 'comment-posted', comment: event.ajax.responseText
        @reset()


    checkButton: ->
      button   = @find('input[type="submit"]')

      if @valid()
        button.enable()
      else
        button.disable()