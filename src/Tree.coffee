class Tree
  constructor: (@x, @y, @image) ->
    context.drawImage(@image, @x, @y, 100, 300);
