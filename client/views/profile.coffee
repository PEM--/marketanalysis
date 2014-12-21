Template.profile.helpers
  testProfile: -> Meteor.settings.public.testProfile
  phoneLink: -> "tel:#{Meteor.settings.public.testProfile.phoneNumber}"
  emailLink: -> "mailto:#{Meteor.settings.public.testProfile.email}"
