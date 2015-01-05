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
  res.end "Authorization code: #{query.code}\nState: #{query.state}"
  linkedInState = LinkedInState.findOne()
  linkedInState.authorization_code = query.code
  linkedInState.access_token = null
  linkedInState.modifiedAt = new Date
  LinkedInState.update {_id: linkedInState._id}, linkedInState
, where: 'server'

Meteor.methods
  linkedinauthorization: ->
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
        console.log 'Error', e if e
    return true
  linkedinaccess: ->
    linkedInState = LinkedInState.findOne()
    linkedInState.access_token = 'pending'
    delete linkedInState.expiration if linkedInState.expiration?
    linkedInState.modifiedAt = new Date
    LinkedInState.update {_id: linkedInState._id}, linkedInState
    url = 'https://www.linkedin.com/uas/oauth2/accessToken?' +
      'grant_type=authorization_code' +
      "&code=#{linkedInState.authorization_code}" +
      "&redirect_uri=#{redirect_uri}" +
      "&client_id=#{Meteor.settings.linkedin.APIkey}" +
      "&client_secret=#{Meteor.settings.linkedin.secretKey}"
    HTTP.post (encodeURI url),
      proxy: 'http://127.0.0.1:8080'
      strictSSL: false
    , (e, r) ->
      console.log 'Error', e if e
      linkedInState = LinkedInState.findOne()
      linkedInState.access_token = r.data.access_token
      linkedInState.modifiedAt = new Date
      expiration = moment new Date
      expiration.add Number(r.data.expires_in), 's'
      linkedInState.expiration = expiration.toDate()
      LinkedInState.update {_id: linkedInState._id}, linkedInState
    return true
  linkedindata: (params) ->
    check params, String
    linkedInState = LinkedInState.findOne()
    if linkedInState.start? or linkedInState.start is undefined
      start =  0
    else
      start = linkedInState.start + linkedInState.count
    headers =
      Authorization: "Bearer #{linkedInState.access_token}"
      Connection: 'keep-alive'
      'x-li-format': 'json'
    url = 'https://api.linkedin.com/v1/company-search:' +
      '(facets,companies:(' +
        'id,name,universal-name,website-url,industries,' +
        'status,logo-url,blog-rss-url,twitter-id,employee-count-range,' +
        'specialties,locations,description,stock-exchange,founded-year,' +
        'end-year,num-followers))?' +
      # Only the headquarter based in France
      'hq-only=true&' +
      # Only companies in France
      'facet=location,fr:0&' +
      # Companies ranging from 1 to 500 employees
      'facet=company-size,B,C,D,E&' +
      # Pagination support
      "start=#{start}&count=10&" +
      # Sort by company size
      'sort=company-size'
    HTTP.get (encodeURI url),
      headers: headers
      proxy: 'http://127.0.0.1:8080'
      strictSSL: false
    , (e, r) ->
      console.log 'Error', e if e
      console.log 'Response', r
      linkedInState = LinkedInState.findOne()
      linkedInState.start = r.data.companies._start
      linkedInState.count = r.data.companies._count
      linkedInState.modifiedAt = new Date
      LinkedInState.update {_id: linkedInState._id}, linkedInState
      for companie in r.data.companies.values
        console.log r.data.companies.values
        Companies.insert companie

    return true
