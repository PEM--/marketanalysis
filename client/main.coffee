class @MainController extends RouteController
  action: ->
    console.log 'action'
    #$('.collapse').collapse()
    @render()

@Transform = famous.core.Transform

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

Template.home.rendered = ->
  console.log 'Home rendered'

Template.notFound.rendered = ->
  console.log 'notFound rendered'

Template.loading.rendered = ->
  console.log 'loading rendered'
