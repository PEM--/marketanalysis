Template.layout.helpers
  main: ->
    Tracker.autorun ->
      curWidth = rwindow.innerWidth() ? 960
      "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"

Template.layout.created = ->
  RwdSimpleMenu.get (menu) ->
    menu.addRoute 'signin', ic: 'fa-sign-in', lbl: ' Sign in'
  ,
    underlineBgColor: '#086599'
