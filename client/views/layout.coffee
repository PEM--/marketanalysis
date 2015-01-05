Template.layout.helpers
  opacity: ->
    currentPath = Router.current().location.get().path
    opacity = if currentPath is '/' then 1 else 0
  main: ->
    Tracker.autorun ->
      curWidth = rwindow.innerWidth() ? 960
      "[#{Math.min 960, curWidth}, #{rwindow.innerHeight()}]"
  testProfile: -> Meteor.settings.public.testProfile
  test: -> 'Test'

Template.layout.created = ->
  RwdSimpleMenu.get (menu) ->
    FView.log.info 'Menu created'
  ,
    underlineBgColor: theme.color

Template.layout.events
  'click button#disconnect': (e, t) ->
    e.preventDefault()
    Meteor.logout()
    RwdSimpleMenu.get (menu) -> menu.setRoute '/'
    Router.go '/'
  'click button#linkedinauthorization': (e, t) ->
    e.preventDefault()
    Meteor.call 'linkedinauthorization', (err, res) ->
      console.log 'linkedinauthorization', res
  'click button#linkedinaccess': (e, t) ->
    e.preventDefault()
    Meteor.call 'linkedinaccess', (err, res) ->
      console.log 'linkedinaccess', res
  'click button#linkedindata': (e, t) ->
    e.preventDefault()
    Meteor.call 'linkedindata', 'company', (err, res) ->
      console.log 'linkedindata', res
