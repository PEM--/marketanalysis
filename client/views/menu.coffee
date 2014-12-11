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
    transition: curve: 'easeInOut', duration: 300
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
      hackyColorTrans = "background-color #{@options.transition.duration}ms, \
        color #{@options.transition.duration}ms"
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
        cursor: 'pointer'
        backgroundColor: @options.sideMenuBgColor
        color: @options.sideMenuColor
        webkitTransition: hackyColorTrans
        mozTransition: hackyColorTrans
        oTransition: hackyColorTrans
        transition: hackyColorTrans
      .add '.menuitem.active',
        backgroundColor: @options.sideMenuSelBgColor
        color: @options.sideMenuSelColor
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
        0, @options.sideMenuZindex), @options.transition
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
    found = _.indexOf @items, (_.find @items, (item) -> item.rt is route)
    if rwindow.screen 'lte', 'xsmall'
      for item, idx in @items
        surf = (FView.byId "#{item.rt}").surface
        if found is idx
          surf.addClass 'active'
        else
          surf.removeClass 'active'
    else
      if found is -1
        @menuUnderline.setOpacity 0, @options.transition
      else
        @menuUnderline.setOpacity 1, @options.transition
        posX = (@items.length-found-1)*@options.labelWidth + \
          (@items.length-found-1)*@options.labelSpacing
        @menuUnderline.setTransform (Transform.translate -posX,0,0), \
          @options.transition
  setOptions: (options) -> @_optionsManager.patch options

@mainMenu = new MainMenu
mainMenu.addRoute 'signin', 'fa-sign-in', ' Connexion'
mainMenu.addRoute 'signout', 'fa-sign-out', ' Sortir'
mainMenu.addRoute 'profile', 'fa-user', ' Profil'
mainMenu.addRoute 'company', 'fa-building', ' Sociétés'
