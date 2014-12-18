Template.layout.helpers
  main: ->
    Tracker.autorun ->
      curWidth = rwindow.innerWidth() ? 960
      "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"

Template.layout.created = ->
  RwdSimpleMenu.get (menu) ->
    FView.log.info 'Menu created'
  ,
    underlineBgColor: '#086599'
