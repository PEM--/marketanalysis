Template.layout.helpers
  opacity: ->
    currentPath = Router.current().location.get().path
    opacity = if currentPath is '/' then 1 else 0
  main: ->
    Tracker.autorun ->
      curWidth = rwindow.innerWidth() ? 960
      "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"

Template.layout.created = ->
  RwdSimpleMenu.get (menu) ->
    FView.log.info 'Menu created'
  ,
    underlineBgColor: theme.color

Template.layout.events
  'click button#disconnect': (e,t) ->
    Meteor.logout()
    Router.go '/'
