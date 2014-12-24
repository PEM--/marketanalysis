console.log 'Meteor started'


###
ServiceConfiguration.configurations.remove
  service: 'linkedin'
ServiceConfiguration.configurations.insert
  service: 'linkedin'
  clientId: Meteor.settings.linkedin.APIkey
  # TODO: Check capabilities
  loginStyle: 'redirect'
  secret: Meteor.settings.linkedin.secretKey
###

state = Random.id()
scope = ['r_fullprofile', 'r_emailaddress']
redirect_uri = 'http://localhost:3000/_oauthlinkedin'
#  Meteor.settings.linkedin.APIkey,
#  Meteor.settings.linkedin.secretKey,
#  'https://127.0.0.1:3000/_oauthlinkedin'

url = 'https://www.linkedin.com/uas/oauth2/authorization?response_type=code' + \
  "&client_id=#{Meteor.settings.linkedin.APIkey}" + \
  "&scope=#{scope.join ' '}" + \
  "&state=#{state}" + \
  "&redirect_uri=#{redirect_uri}"
#console.log encodeURI url

@access_token = 'AQXUnhb2DZzuZdWDScvkJUCYCorhbxeHqOz-1m6lXROGvgD7aw2o-QiwCq5AHXK75sLF_Wwy4d9S2L71p_81pEUwRsqj1qYMCFMiJ0dj5odjf1uVtVGjtKtQ1gzOrdz0UkORcKB33cwVHEA7Lxq8e38BTyz8vj3xCp_2ksJwq0jameye1u0'
#linkedin = Linkedin().init access_token
#linkedin.companies.company '3141116', (err, company) ->
#  console.log 'company', company

authorization_code = null
state = null

Router.route '/_oauthlinkedin/', ->
  req = @request
  res = @response
  query = @params.query
  #console.log '_oauthlinkedin, req:', req
  #console.log '_oauthlinkedin, res:', res
  console.log 'PEM: Step 3: _oauthlinkedin, query:', query
  authorization_code = query.code
  state = query.state

  res.end "Authorization code: #{authorization_code}\n\
    State: #{state}"
, where: 'server'


Meteor.methods
  'isLinkedinConnected': ->
    console.log 'PEM: Step 1'
    HTTP.call 'GET', (encodeURI url), (error, response) ->
      if error
        console.log 'PEM: Error', error
      console.log 'PEM: Step 2', response
      #console.log 'Response', response
    #console.log 'isLinkedinConnected', access_token
    return true
