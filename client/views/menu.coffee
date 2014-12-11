class MainMenu
  @DEFAULT_OPTIONS:
    labelWidth: 100
    labelSpacing: 20
    menuHeight: 50
    underlineBorderRadius: 4
    underlineBgColor: '#086599'
    sideMenuZindex: 150
    sideMenuWidth: 200
    sideMenuBgColor: CSSC.darkgray
    sideMenuColor: CSSC.silver
    sideMenuSelBgColor: CSSC.gray
    sideMenuSelColor: CSSC.white
  constructor: (options) ->
    @options = Utility.clone @constructor.DEFAULT_OPTIONS or \
      MainMenu.DEFAULT_OPTIONS
    @_optionsManager = new OptionsManager @options
    @setOptions options
    @isSideMenuActive = false
    @isSideMenuActiveDeps = new Tracker.Dependency
    Template.menu.rendered = =>
      @fview = FView.byId 'sideMenu'
      menuHome = FView.byId 'menuHome'
      menuHome.surface.on 'click', -> Router.go '/'
      css.add ['.menubutton', '.menulabel'],
        lineHeight: CSSC.px @options.menuHeight
        cursor: 'pointer'
        textAlign: 'center'
      .add '.sideMenu', backgroundColor: @options.sideMenuBgColor
      .add '.menuUnderline',
        backgroundColor: @options.underlineBgColor
        borderRadius: CSSC.px @options.underlineBorderRadius
      .add '.menuitem',
        textAlign: 'center'
        lineHeight: CSSC.px @options.menuHeight
        fontWeight: 'bolder'
        cursor: 'pointer'
      .add '.menuitem.active',
        backgroundColor: @options.sideMenuSelBgColor
        color: @options.sideMenuSelColor
      .add '.menuitem.inactive', color: @options.sideMenuColor
    Template.menu.helpers
      buttonSize: => "[#{@options.menuHeight},#{@options.menuHeight}]"
    Template.menuHamburger.rendered = =>
      menuHamburger = FView.byId 'menuHamburger'
      menuHamburger.surface.on 'click', => @toggle()
    Template.menuHamburger.helpers
      buttonSize: => "[#{@options.menuHeight},#{@options.menuHeight}]"
    Template.menuTop.rendered = =>
      @menuUnderline = (FView.byId 'menuUnderline').modifier
    @items = []
    Template.menuTop.helpers
      items: => @items
      spacing: => @options.labelSpacing
      underLineSize: =>
        "[#{@options.labelWidth}, #{@options.underlineBorderRadius}]"
      itemSize: =>
        "[#{@options.labelWidth}, #{@options.menuHeight}]"
    Template.sideMenu.helpers
      side: => "[#{@options.sideMenuWidth}, #{rwindow.innerHeight()}]"
      translate: =>
        "[-#{@options.sideMenuWidth}, 0, #{@options.sideMenuZindex}]"
    Template.innerSideMenu.helpers
      items: => _.extend {act:'menuitem inactive'}, item for item in @items
      side: => "[#{@options.sideMenuWidth}, #{rwindow.innerHeight()}]"
      itemSize: => "[#{@options.sideMenuWidth}, #{@options.menuHeight}]"
    @depend()
  addRoute: (route, icon, label) ->
    @items.push {rt: route, ic: icon, lbl: label}
  depend: =>
    Tracker.autorun =>
      @isSideMenuActiveDeps.depend()
      posx = if @isSideMenuActive then 0 else -@options.sideMenuWidth
      @fview?.modifier.setTransform (Transform.translate posx, \
        0, @options.sideMenuZindex),
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
    idx = _.indexOf @items, (_.find @items, (item) -> item.rt is route)
    menuUnderline = (FView.byId 'menuUnderline').modifier
    if idx is -1
      @menuUnderline.setOpacity 0, duration: 300
    else
      @menuUnderline.setOpacity 1, duration: 300
      posX = (@items.length-idx-1)*@options.labelWidth + \
        (@items.length-idx-1)*@options.labelSpacing
      @menuUnderline.setTransform (Transform.translate -posX,0,0),
        duration: 300
  setOptions: (options) ->
    @_optionsManager.patch options

@mainMenu = new MainMenu
mainMenu.addRoute 'signin', 'fa-sign-in', ' Connexion'
mainMenu.addRoute 'signout', 'fa-sign-out', ' Sortir'
mainMenu.addRoute 'profile', 'fa-user', ' Profil'
mainMenu.addRoute 'company', 'fa-building', ' Sociétés'
