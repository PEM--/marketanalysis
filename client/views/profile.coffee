profile = Meteor.settings.public.testProfile
Template.profile.helpers
  testProfile: -> profile
  dateOfBirth: ->
    m = moment profile.dateOfBirth, 'YYYY-MM-DD', 'fr'
    m.format 'DD/MM/YYYY'
  phoneLink: -> "tel:#{profile.phoneNumber}"
  emailLink: -> "mailto:#{profile.email}"
