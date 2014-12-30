Template.layout.helpers
  opacity: ->
    currentPath = Router.current().location.get().path
    opacity = if currentPath is '/' then 1 else 0
  main: ->
    Tracker.autorun ->
      curWidth = rwindow.innerWidth() ? 960
      "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"
  testProfile: ->
    console.log Meteor.settings.public.testProfile
    Meteor.settings.public.testProfile
  test: -> 'Test'

Template.layout.created = ->
  RwdSimpleMenu.get (menu) ->
    FView.log.info 'Menu created'
  ,
    underlineBgColor: theme.color

Template.layout.events
  'click button#disconnect': (e,t) ->
    e.preventDefault()
    Meteor.logout()
    RwdSimpleMenu.get (menu) -> menu.setRoute '/'
    Router.go '/'
  'click button#linkedinconnect': (e, t) ->
    e.preventDefault()
    Meteor.call 'isLinkedinConnected', (err, res) ->
      console.log 'Session.set','isLinkedinConnected', res
      Session.set 'isLinkedinConnected', res
  'click button#getlinkedindata': (e, t) ->
    e.preventDefault()
    Meteor.call 'getLinkedinData', 'company', (err, res) ->
      console.log 'getLinkedinData', res
