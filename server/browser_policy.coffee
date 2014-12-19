# Black list everything
BrowserPolicy.content.disallowInlineScripts()
BrowserPolicy.content.disallowConnect()
# Only allow necessary protocols
rootUrl = __meteor_runtime_config__.ROOT_URL
BrowserPolicy.content.allowConnectOrigin rootUrl
BrowserPolicy.content.allowConnectOrigin (rootUrl.replace 'http', 'ws')
# Allow origin for Meteor hosting
# TODO: Redirect to HTTPS
BrowserPolicy.content.allowConnectOrigin 'http://*.meteor.com'
BrowserPolicy.content.allowConnectOrigin 'ws://*.meteor.com'
BrowserPolicy.content.allowConnectOrigin 'https://*.meteor.com'
BrowserPolicy.content.allowConnectOrigin 'wss://*.meteor.com'
# Allow Google analytics
BrowserPolicy.content.allowScriptOrigin '*.google-analytics.com'
# Allow the tracking pixel case of Google analytics
BrowserPolicy.content.allowImageOrigin '*.google-analytics.com'
# Allow CDNs for fonts
BrowserPolicy.content.allowFontOrigin 'http://fonts.gstatic.com'
