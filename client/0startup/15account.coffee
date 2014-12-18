# Confuguration for account-ui
AccountsTemplates.configure
  # Behaviour
  confirmPassword: false
  enablePasswordChange: false
  forbidClientAccountCreation: true
  overrideLoginErrors: true
  sendVerificationEmail: false

  # Appearance
  showAddRemoveServices: false
  showForgotPasswordLink: false,
  showLabels: true
  showPlaceholders: true,

  # Client-side Validation
  continuousValidation: true
  negativeFeedback: true
  negativeValidation: true
  positiveValidation: true
  positiveFeedback: true
  showValidating: true

  # Privacy Policy and Terms of Use
  #  privacyUrl: 'privacy',
  #  termsUrl: 'terms-of-use',

  # Redirects
  homeRoutePath: '/profile'
  redirectTimeout: 4000

AccountsTemplates.configureRoute 'signIn',
  redirect: '/profile'

Tracker.autorun ->
  @currentUser = Meteor.user()
  console.log 'User ?', @currentUser
  RwdSimpleMenu.get (menu) =>
    console.log 'User ?', @currentUser, menu
    if currentUser is null
      menu.addRoute 'signin', ic: 'fa-sign-in', lbl: ' Sign in'
      menu.removeRoute 'profile'
      menu.removeRoute 'company'
      menu.removeRoute 'signout'
    else
      menu.removeRoute 'signin'
      menu.addRoute 'profile',ic: 'fa-user', lbl: ' Profile'
      menu.addRoute 'company', ic: 'fa-building', lbl: ' Company'
      menu.addRoute 'signout', ic: 'fa-sign-out', lbl: ' Sign out'
