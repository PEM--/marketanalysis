class SideMenu
  constructor: ->
    @isMenuActive = false
    @isMenuActiveDeps = new Tracker.Dependency
    Template.sidemenu.rendered = =>
      @fview = FView.byId 'sidemenu'
    @depend()
  depend: =>
    Tracker.autorun =>
      @isMenuActiveDeps.depend()
      posx = if @isMenuActive then 0 else -200
      @fview?.modifier.setTransform (Transform.translate posx, 0, 200),
        duration: 300
  activate: ->
    if @isMenuActive is false
      @isMenuActive = true
      @isMenuActiveDeps.changed()
  deactivate: ->
    if @isMenuActive is true
      @isMenuActive = false
      @isMenuActiveDeps.changed()
  toggle: ->
    @isMenuActive = not @isMenuActive
    @isMenuActiveDeps.changed()

@sidemenu = new SideMenu

Template.sidemenu.helpers
  side: -> "[200, #{rwindow.innerHeight()}]"

Template.innermenu.helpers
  items: ->
    [
      {act:'active',rt:'signin',ic:'fa-sign-in',lbl:' Connexion'}
      {act:'',rt:'signout',ic:'fa-sign-out',lbl:' Sortir'}
      {act:'',rt:'profile',ic:'fa-user',lbl:' Profil'}
      {act:'',rt:'company',ic:'fa-building',lbl:' Sociétés'}
    ]

Template.menu.events
  'click button.navbar-toggle': (e, tpl) ->
    e.preventDefault()
    sidemenu.toggle()
