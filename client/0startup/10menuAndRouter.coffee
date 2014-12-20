###
class @MainController extends RouteController
  action: ->
    console.log 'action', @
    @render()
###

Router.configure
  #controller: 'MainController'
  layoutTemplate: 'layout'
Router.plugin 'dataNotFound', notFoundTemplate: 'notFound'
Router.plugin 'loading',  loadingTemplate: 'loading'
Router.route '/', name: 'home'
Router.route '/loading'
Router.route '/signout'
Router.route '/profile'
Router.route '/company'
Router.route '/signin'

# Allways put this route at the very end of route declarations
Router.route '/:others',
  name: 'notFound'
  layoutTemplate: 'layout'
  controller: 'MainController'

Logger.setLevel 'famous-views', 'info'

css = new CSSC
css.add [
  '.rwd-simple-menu-logo'
  '.rwd-simple-menu-hamburger'
],
  lineHeight: CSSC.px 50
  textAlign: 'center'
