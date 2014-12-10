Meteor.startup ->
  Router.configure layoutTemplate: 'layout'
  Router.route '/', 'home'
