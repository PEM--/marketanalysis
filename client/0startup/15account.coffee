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
  RwdSimpleMenu.get (menu) ->
    if currentUser is null
      menu.addRoute 'signin', ic: 'fa-sign-in', lbl: ' Connexion'
      menu.removeRoute 'profile'
      menu.removeRoute 'companies'
      menu.removeRoute 'signout'
    else
      menu.addRoute 'profile',ic: 'fa-user', lbl: ' Profile'
      menu.addRoute 'companies', ic: 'fa-building', lbl: ' Sociétés'
      menu.addRoute 'signout', ic: 'fa-sign-out', lbl: ' Quitter'
      menu.removeRoute 'signin'
