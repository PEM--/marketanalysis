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
    return 'display: initial' if linkedInState?.authorization_code is null
    'display: none'
  isLinkedinStateAuthorizationPending: ->
    linkedInState = LinkedInState.findOne()
    return 'display: initial' if linkedInState?.authorization_code is 'pending'
    'display: none'
  isLinkedinStateAccessTokenRequired: ->
    linkedInState = LinkedInState.findOne()
    if linkedInState?
      return 'display: initial' if linkedInState.access_token is null
      if linkedInState.expiration?
        mDate = moment linkedInState.expiration
        return 'display: initial' if mDate.isBefore new Date
    'display: none'
  isLinkedinStateAccessTokenPending: ->
    linkedInState = LinkedInState.findOne()
    return 'display: initial' if linkedInState?.access_token is 'pending'
    'display: none'
  isLinkedinStateConnected: ->
    linkedInState = LinkedInState.findOne()
    if linkedInState?.expiration?
      mDate = moment linkedInState.expiration
      return 'display: initial' if mDate.isAfter new Date
    'display: none'
