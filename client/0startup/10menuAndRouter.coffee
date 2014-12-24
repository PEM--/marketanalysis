Router.configure
  layoutTemplate: 'layout'

Router.plugin 'dataNotFound', notFoundTemplate: 'notFound'
Router.plugin 'loading',  loadingTemplate: 'loading'
Router.route '/', name: 'home'
Router.route '/profile', -> needSigninPage @, 'profile'
Router.route '/company', -> needSigninPage @, 'company'
Router.route '/signin'
Router.route '/signout', -> needSigninPage @, 'signout'
Router.route '/loading'

needSigninPage = (router, route) ->
  if Meteor.user() is null
    RwdSimpleMenu.get (menu) -> menu.setRoute 'signin'
    router.redirect '/signin'
    router.next()
  else
    RwdSimpleMenu.get (menu) -> menu.setRoute route
    router.render route

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
