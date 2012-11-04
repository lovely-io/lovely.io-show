# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Lovely ['dom', '~comments-form', '~comments-list'], ($, CommentForm, CommentsList)->

  $(document).delegate 'form.new_comment', 'focus', 'cast', CommentForm
  $(document).delegate '#comments', 'mousedown', 'cast', CommentsList

  $(document).on 'comment-posted', (event)->
    comments = $('#comments').cast(CommentsList)
    comments.create(event.comment)

