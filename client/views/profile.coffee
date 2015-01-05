profile = Meteor.settings.public.testProfile
Template.profile.helpers
  testProfile: -> profile
  dateOfBirth: ->
    m = moment profile.dateOfBirth, 'YYYY-MM-DD', 'fr'
    m.format 'DD/MM/YYYY'
  phoneLink: -> "tel:#{profile.phoneNumber}"
  emailLink: -> "mailto:#{profile.email}"
  isLinkedinStateAuthorizationRequired: ->
    linkedInState = LinkedInState.findOne()
    return true if linkedInState?.authorization_code is null
    false
  isLinkedinStateAuthorizationPending: ->
    linkedInState = LinkedInState.findOne()
    return true if linkedInState?.authorization_code is 'pending'
    false
  isLinkedinStateAccessTokenRequired: ->
    linkedInState = LinkedInState.findOne()
    return true if linkedInState?.access_token is null
    false
  isLinkedinStateAccessTokenPending: ->
    return false
  isLinkedinStateConnected: ->
    return false
