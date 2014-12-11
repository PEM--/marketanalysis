Template.layout.helpers
  main: ->
    curWidth = rwindow.innerWidth() ? 960
    "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"
