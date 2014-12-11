class MainMenu
  constructor: ->
    @isSideMenuActive = false
    @isSideMenuActiveDeps = new Tracker.Dependency
    Template.sideMenu.rendered = =>
      @fview = FView.byId 'sideMenu'
      menuHome = FView.byId 'menuHome'
      menuHome.surface.on 'click', -> Router.go '/'
      css.add ['.menubutton', '.menulabel'],
        textAlign: 'center'
        lineHeight: CSSC.px 50
        cursor: 'pointer'
        #backgroundColor: CSSC.darkgray
      .add '.darkgray',
        backgroundColor: CSSC.darkgray
      .add ['.menuitem-active', '.menuitem-inactive'],
        textAlign: 'center'
        lineHeight: CSSC.px 50
        fontWeight: 'bolder'
        cursor: 'pointer'
      .add '.menuitem-active',
        backgroundColor: CSSC.gray
        color: CSSC.white
      .add '.menuitem-inactive',
        color: CSSC.silver
    Template.menuHamburger.rendered = =>
      menuHamburger = FView.byId 'menuHamburger'
      menuHamburger.surface.on 'click', => @toggle()
    Template.sideMenu.helpers
      side: -> "[200, #{rwindow.innerHeight()}]"
    Template.menuTop.helpers
      items: ->
        [
          {act:'menuitem-active',rt:'signin',ic:'fa-sign-in',lbl:' Connexion'}
          {act:'menuitem-inactive',rt:'signout',ic:'fa-sign-out',lbl:' Sortir'}
          {act:'menuitem-inactive',rt:'profile',ic:'fa-user',lbl:' Profil'}
          {act:'menuitem-inactive',rt:'company',ic:'fa-building',lbl:' Sociétés'}
        ]
    Template.innerSideMenu.helpers
      items: ->
        [
          {act:'menuitem-active',rt:'signin',ic:'fa-sign-in',lbl:' Connexion'}
          {act:'menuitem-inactive',rt:'signout',ic:'fa-sign-out',lbl:' Sortir'}
          {act:'menuitem-inactive',rt:'profile',ic:'fa-user',lbl:' Profil'}
          {act:'menuitem-inactive',rt:'company',ic:'fa-building',lbl:' Sociétés'}
        ]
    @depend()
  depend: =>
    Tracker.autorun =>
      @isSideMenuActiveDeps.depend()
      posx = if @isSideMenuActive then 0 else -200
      @fview?.modifier.setTransform (Transform.translate posx, 0, 200),
        duration: 300
  activate: ->
    if @isSideMenuActive is false
      @isSideMenuActive = true
      @isSideMenuActiveDeps.changed()
  deactivate: ->
    if @isSideMenuActive is true
      @isSideMenuActive = false
      @isSideMenuActiveDeps.changed()
  toggle: ->
    @isSideMenuActive = not @isSideMenuActive
    @isSideMenuActiveDeps.changed()

@mainMenu = new MainMenu
