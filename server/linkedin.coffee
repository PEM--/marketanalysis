console.log 'Meteor started'

state = Random.id()
scope = ['r_fullprofile', 'r_emailaddress']
redirect_uri = 'https://localhost:3000/_oauthlinkedin'
#  Meteor.settings.APIkey,
#  Meteor.settings.secretKey,
#  'https://127.0.0.1:3000/_oauthlinkedin'



url = 'https://www.linkedin.com/uas/oauth2/authorization?response_type=code' + \
  "&client_id=#{Meteor.settings.APIkey}" + \
  "&scope=#{scope.join ' '}" + \
  "&state=#{state}" + \
  "&redirect_uri=#{redirect_uri}"

console.log encodeURI url

#HTTP.call 'Redirect', url, (error, response) ->
#  console.log 'Error', error
#  console.log 'Response', response
