class @MainController extends RouteController
  action: ->
    console.log 'action'
    #$('.collapse').collapse()
    @render()

Router.configure controller: 'MainController'
Router.plugin 'dataNotFound', notFoundTemplate: 'notFound'
Router.plugin 'loading',  loadingTemplate: 'loading'
Router.route '/',
  name: 'home'
  layoutTemplate: 'layout'
  controller: 'MainController'
Router.route '/loading',
  name: 'loading'
  layoutTemplate: 'layout'
  controller: 'MainController'
Router.route '/signout',
  layoutTemplate: 'layout'
  controller: 'MainController'
Router.route '/profile',
  layoutTemplate: 'layout'
  controller: 'MainController'
Router.route '/company',
  layoutTemplate: 'layout'
  controller: 'MainController'
Router.route '/signin',
  layoutTemplate: 'layout'
  controller: 'MainController'

# Allways put this route at the very end of route declarations
Router.route '/:others',
  name: 'notFound'
  layoutTemplate: 'layout'
  controller: 'MainController'

#Logger.setLevel 'famous-views', 'info'

css = new CSSC
css.add [
  '.rwd-simple-menu-logo'
  '.rwd-simple-menu-hamburger'
],
  lineHeight: CSSC.px 50
  textAlign: 'center'
