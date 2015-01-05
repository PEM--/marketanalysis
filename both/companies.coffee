@Companies = new Mongo.Collection 'Companies'

if Meteor.isServer
  # Publish Companies
  Meteor.publish 'Companies', -> Companies.find()

if Meteor.isClient
  # Subscribe to Companies
  Meteor.subscribe 'Companies'
