@state = Random.id()
scope = ['r_fullprofile', 'r_emailaddress']
redirect_uri = 'http://localhost:3000/_oauthlinkedin'

url = 'https://www.linkedin.com/uas/oauth2/authorization?response_type=code' + \
  "&client_id=#{Meteor.settings.linkedin.APIkey}" + \
  "&scope=#{scope.join ' '}" + \
  "&state=#{state}" + \
  "&redirect_uri=#{redirect_uri}"

$ = Meteor.npmRequire 'cheerio'

Router.route '/_oauthlinkedin/', ->
  req = @request
  res = @response
  query = @params.query
  console.log 'Params received from LinkedIn', query
  res.end "Authorization code: #{query.code}\nState: #{query.state}"
  linkedInState = LinkedInState.findOne()
  linkedInState.authorization_code = query.code
  linkedInState.access_token = null
  linkedInState.modifiedAt = new Date
  LinkedInState.update {_id: linkedInState._id}, linkedInState
, where: 'server'

Meteor.methods
  'linkedinauthorization': ->
    linkedInState = LinkedInState.findOne()
    linkedInState.authorization_code = 'pending'
    linkedInState.modifiedAt = new Date
    LinkedInState.update {_id: linkedInState._id}, linkedInState
    HTTP.get (encodeURI url),
      proxy: 'http://127.0.0.1:8080'
      strictSSL: false
      jar: true
    , (e, r) ->
      $resbody = $ r.content
      $form = $resbody.find 'form'
      testProfile =  Meteor.settings.public.testProfile
      post_url = "https://www.linkedin.com/#{$form.attr 'action'}"
      $inputs = $form.find 'input'
      formData = {}
      postbody = $inputs.each (idx, elem) ->
        $elem = $ elem
        name = $elem.attr 'name'
        switch name
          when 'isJsEnabled' then formData['isJsEnabled'] = true
          when 'session_key'
            formData[name] = testProfile.email
          when 'session_password'
            formData[name] = testProfile.password
          else
            formData[name] = $elem.attr 'value'
      headers =
        Accept: 'text/html,application/xhtml+xml,application/xml;\
          q=0.9,*/*;q=0.8'
        'Proxy-Connection': 'keep-alive'
        'Accept-Language': 'fr-fr'
        'Accept-Encoding': 'gzip, deflate'
        Origin: 'https://www.linkedin.com'
        Connection: 'keep-alive'
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) \
          AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5'
        Referer: (encodeURI url)
      HTTP.post post_url,
        headers: headers
        proxy: 'http://127.0.0.1:8080'
        jar: true
        strictSSL: false
        form: formData
        followAllRedirects: true
      , (e, r) ->
        # Nothing should be there as the former call is redirected.
    return true
  'getLinkedinData': (params) ->
    check params, String
    headers =
      #Authorization: "Bearer #{access_token}"
      Connection: 'keep-alive'
    HTTP.get 'https://api.linkedin.com//v1/people/~',
      headers: headers
      proxy: 'http://127.0.0.1:8080'
      strictSSL: false
    , (e, r) ->
      console.log 'Error', e if e
      console.log 'Response', r
