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

Router.route '/:others',
  name: 'notFound'
  layoutTemplate: 'layout'
  controller: 'MainController'

Logger.setLevel 'famous-views', 'info'

@mainMenu = new RwdSimpleMenu
mainMenu.addRoute 'signin', 'fa-sign-in', ' Connexion'
mainMenu.addRoute 'signout', 'fa-sign-out', ' Sortir'
mainMenu.addRoute 'profile', 'fa-user', ' Profil'
mainMenu.addRoute 'company', 'fa-building', ' Sociétés'
