Template.profile.rendered = ->
  RwdSimpleMenu.get (menu) ->
    # Remove current signin menu item
    menu.removeRoute 'signin'
    # Add other menu item
    menu.addRoute 'profile', 'fa-user', ' Profile'
    menu.addRoute 'company', 'fa-building', ' Company'
    menu.addRoute 'signout', 'fa-sign-out', ' Sign out'
