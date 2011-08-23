#
# Project's main unit
#
# Copyright (C) 2011 Nikolay Nemshilov
#

show = ->
  element = document.createElement('div')
  element.id = 'killie'
  element.innerHTML = """
    <div class="locker"></div>
    <div class="dialog">
      <h1>Warning!</h1>
      <a href="#" onclick="Lovely.module('killie').hide(); return false" class="close">&times;</a>
      <p>
        You're using an utterly obsolete browser,
        therefore some features might not be available
      </p>
      <p class="buttons">
        <a href="http://www.whatbrowser.org/">What's Browser</a>
        <a href="" onclick="Lovely.module('killie').hide(); return false">Continue</a>
      </p>
    </div>
  """

  document.body.appendChild(element)


hide = ->
  element = document.getElementById('killie')
  document.body.removeChild(element)

