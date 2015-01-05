@LinkedInState = new Mongo.Collection 'LinkedInState'

if Meteor.isServer
  # Check if LinkedInState is empty
  if LinkedInState.find().count() is 0
    LinkedInState.insert
      authorization_code: null
      createdAt: new Date
      modifiedAt: new Date
  # Publish LinkedInState
  Meteor.publish 'LinkedInState', -> LinkedInState.find()

if Meteor.isClient
  # Subscribe to LinkedInState
  Meteor.subscribe 'LinkedInState'
