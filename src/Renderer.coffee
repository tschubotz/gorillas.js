class Renderer
  constructor: ->
      window.requestAnimFrame = (->
        window.requestAnimationFrame        or
        window.webkitRequestAnimationFrame  or
        window.mozRequestAnimationFrame     or
        window.oRequestAnimationFrame       or
        window.msRequestAnimationFrame      or
        (callback, element) ->
          window.setTimeout(callback, 1000 / 60)()
      )()
  draw: ->
    # TODO

  animate: ->
    window.requestAnimFrame(r.animate)
    r.draw()