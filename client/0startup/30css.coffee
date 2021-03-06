@theme =
  color: '#143153'
@css = new CSSC
css
.add '@font-face',
  fontFamily: 'Lato'
  fontStyle: 'normal'
  fontWeight: 100
  src: "\
    local('Lato Regular'), \
    local('Lato-Regular'), \
    url(http://fonts.gstatic.com/s/lato/v11/" +
      "8qcEw_nrk_5HEcCpYdJu8BTbgVql8nDJpwnrE27mub0.woff2) format('woff2')"
  unicodeRange: 'U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, \
    U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215, U+E0FF, \
    U+EFFD, U+F000'
.add 'body',
  webkitFontSmoothing: 'antialiased'
  fontFamily: 'Lato, "Helvetica Neue", Arial, sans-serif'
  userSelect: 'none'
  msUserSelect: 'none'
  mozUserSelect: 'none'
  webkitUserSelect: 'none'
  webkitTouchCallout: 'none'
  cursor: 'default'
.add '.selectable',
  userSelect: 'all'
  msUserSelect: 'all'
  mozUserSelect: 'all'
  webkitUserSelect: 'all'
  webkitTouchCallout: 'default'
.add 'h1.main',
  fontSize: CSSC.em 3.5
  paddingBottom: CSSC.em 0.6
  borderBottom: "#{CSSC.px 1} solid #{theme.color}"
