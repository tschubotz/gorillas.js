class GorillasGame
  constructor: ->
    canvas = $("#viewport")[0]
    context = canvas.getContext("2d")

    @trees = []
    @left_gorilla = null
    @right_gorilla = null

    @images =
      num_loaded: 0

    d.on("image_loaded", ->
      g.images.num_loaded += 1
      # start setting up stage, only when all images were loaded
      if g.images.num_loaded == (Object.keys(g.images).length - 1)
        g.setUpStage()

    )

    @loadImages()

  loadImages: ->
    @images.tree = new Image()
    @images.tree.onload = ->
      d.trigger("image_loaded")
    @images.tree.src = 'img/tree.png'

    @images.left_gorilla = new Image()
    @images.left_gorilla.onload = ->
      d.trigger("image_loaded")
    @images.left_gorilla.src  = 'img/gorillaFacingRight.png'

    @images.right_gorilla = new Image()
    @images.right_gorilla.onload = ->
      d.trigger("image_loaded")
    @images.right_gorilla.src = 'img/gorillaFacingLeft.png'

  setUpStage: ->
    @setUpTrees()
    @setUpGorillas()

  setUpTrees: ->
    # create 8 (screen width 800px and tree width 100) trees of random heigth
    for i in [0..7]
      x = i*100
      y = 300 + (200 * Math.random())
      @trees.push new Tree x, y, @images.tree

  setUpGorillas: ->
    # place gorilla facing the right on the most left tree
    # and the gorilla facing the left on the most right tree
    @left_gorilla = new Gorilla @trees[0].x + 14 , @trees[0].y - 72, @images.left_gorilla
    @lright_gorilla = new Gorilla @trees[7].x + 14 , @trees[7].y - 72, @images.right_gorilla

