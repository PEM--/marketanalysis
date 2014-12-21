Router.configure
  layoutTemplate: 'layout'

Router.plugin 'dataNotFound', notFoundTemplate: 'notFound'
Router.plugin 'loading',  loadingTemplate: 'loading'
Router.route '/', name: 'home'
Router.route '/profile', -> needSigninPage @
Router.route '/company', -> needSigninPage @
Router.route '/signin',
Router.route '/signout', -> needSigninPage @
Router.route '/loading'

needSigninPage = (router) ->
  if Meteor.loggingIn() is false or Meteor.user() is null
    RwdSimpleMenu.get (menu) -> menu.setRoute 'signin'
    router.redirect '/signin'
  else
    router.render (router.current().url.substr 1)

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
