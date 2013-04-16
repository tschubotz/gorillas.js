# global variables
canvas = null;
context = null;
d = $(document);
g = null;
r = null;

d.ready ->
  g = new GorillasGame;
  r = new Renderer;
  r.animate();