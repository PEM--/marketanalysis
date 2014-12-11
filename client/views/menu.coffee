class MainMenu
  DEFAULT_OPTIONS:
    labelWidth: 200
    labelSpacing: 20
  constructor: (options) ->

    @isSideMenuActive = false
    @isSideMenuActiveDeps = new Tracker.Dependency
    Template.menu.rendered = =>
      @fview = FView.byId 'sideMenu'
      menuHome = FView.byId 'menuHome'
      menuHome.surface.on 'click', -> Router.go '/'
      css.add ['.menubutton', '.menulabel'],
        lineHeight: CSSC.px 50
        cursor: 'pointer'
        textAlign: 'center'
      .add '.darkgray', backgroundColor: CSSC.darkgray
      .add '.menuUnderline',
        backgroundColor: '#086599'
        borderRadius: CSSC.px 3
      .add '.menuitem',
        textAlign: 'center'
        lineHeight: CSSC.px 50
        fontWeight: 'bolder'
        cursor: 'pointer'
      .add '.menuitem.active', backgroundColor: CSSC.gray, color: CSSC.white
      .add '.menuitem.inactive', color: CSSC.silver
    Template.menuHamburger.rendered = =>
      menuHamburger = FView.byId 'menuHamburger'
      menuHamburger.surface.on 'click', => @toggle()
    Template.sideMenu.helpers side: -> "[200, #{rwindow.innerHeight()}]"
    @items = []
    Template.menuTop.helpers items: => @items
    Template.innerSideMenu.helpers
      items: =>
        _.extend {act:'menuitem inactive'}, item for item in @items
    @depend()
  addRoute: (route, icon, label) ->
    @items.push {rt: route, ic: icon, lbl: label}
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
  setMenuItem: (route) ->
    labelWidth = 100
    itemSpacing = 20
    menuTopWidth = labelWidth*@items.length + itemSpacing*(@items.length - 1)
    idx = _.indexOf @items, (_.find @items, (item) -> item.rt is route)
    menuUnderline = (FView.byId 'menuUnderline').modifier
    if idx is -1
      menuUnderline.setOpacity 0, duration: 300
    else
      menuUnderline.setOpacity 1, duration: 300
      posX = idx * (labelWidth + itemSpacing) + labelWidth
      menuUnderline.setTransform (Transform.translate -menuTopWidth+posX, 0, 0),
        duration: 300

@mainMenu = new MainMenu
mainMenu.addRoute 'signin', 'fa-sign-in', ' Connexion'
mainMenu.addRoute 'signout', 'fa-sign-out', ' Sortir'
mainMenu.addRoute 'profile', 'fa-user', ' Profil'
mainMenu.addRoute 'company', 'fa-building', ' Sociétés'
