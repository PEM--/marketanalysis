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
