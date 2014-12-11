Template.menu.helpers
  items: ->
    [
      {act:'active',rt:'signin',ic:'fa-sign-in',lbl:' Connexion'}
      {act:'',rt:'signout',ic:'fa-sign-out',lbl:' Sortir'}
      {act:'',rt:'profile',ic:'fa-user',lbl:' Profil'}
      {act:'',rt:'company',ic:'fa-building',lbl:' Sociétés'}
    ]

isMenuActive = false
Template.menu.events
  'click button.navbar-toggle': (e, tpl) ->
    e.preventDefault()
    fview = FView.byId 'sidemenu'
    posx = if isMenuActive then 0 else 200
    isMenuActive = not isMenuActive
    fview.modifier.setTransform (Transform.translate posx, 0, 200),
      duration: 300
