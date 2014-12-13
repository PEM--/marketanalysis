Template.profile.created = ->
  # Remove current signin menu item
  mainMenu.removeRoute 'signin'
  # Add other menu item
  mainMenu.addRoute 'profile', 'fa-user', ' Profile'
  mainMenu.addRoute 'company', 'fa-building', ' Company'
  mainMenu.addRoute 'signout', 'fa-sign-out', ' Sign out'
  # Select current screen
  mainMenu.setMenuItem 'profile'
