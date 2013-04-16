class Gorilla
  constructor: (@x, @y, @image) ->
    # draw gorilla
    context.drawImage(@image, @x, @y, 72, 72);
    # draw arrow
    context.beginPath();
    context.moveTo(@x + 36, @y);
    context.lineTo(@x + 36, @y - 100);
    context.stroke();
