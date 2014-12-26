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


stuff = '<!DOCTYPE html>\n<html lang="en">\n<head>\n<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>\n<meta http-equiv="X-UA-Compatible" content="IE=edge"/>\n<meta name="pageImpressionID" content="d843a28c-4888-4cc8-8c8e-f4f2bc80285f"/>\n<meta name="pageKey" content="uas-oauth2-auth-code-authorize">\n<meta name="analyticsURL" content="/analytics/noauthtracker"/>\n<link rel="apple-touch-icon-precomposed" href="https://static.licdn.com/scds/common/u/img/icon/apple-touch-icon.png">\n<!--[if lte IE 8]>\n  <link rel="shortcut icon" href="https://static.licdn.com/scds/common/u/images/logos/favicons/v1/16x16/favicon.ico">\n<![endif]-->\n<!--[if IE 9]>\n  <link rel="shortcut icon" href="https://static.licdn.com/scds/common/u/images/logos/favicons/v1/favicon.ico">\n<![endif]-->\n<link rel="icon" href="https://static.licdn.com/scds/common/u/images/logos/favicons/v1/favicon.ico">\n<meta name="msapplication-TileImage" content="https://static.licdn.com/scds/common/u/images/logos/linkedin/logo-in-win8-tile-144_v1.png"/>\n<meta name="msapplication-TileColor" content="#0077B5"/>\n<meta name="application-name" content="LinkedIn"/>\n<link rel="openid.server" href="https://www.linkedin.com/uas/openid/authorize"/>\n<title>Authorize | LinkedIn</title>\n<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>\n<meta name="pageKey" content="uas-oauth2-auth-code-authorize">\n<meta name="IN-signin" content="http://www.linkedin.com/cws/login-popup"/>\n<meta name="IN-signin-secure" content="/cws/login-popup"/>\n<link rel="stylesheet" type="text/css" href="https://static.licdn.com/scds/concat/common/css?h=765zh9odycznutep5f0mj07m4-7rju1q29wa1psxrhfmiak0ydy-7mxyksftlcjzimz2r05hd289r-4uu2pkz5u0jch61r2nhpyyrn8-dxl1g2k3wk6qpss8oq9lwul9c-7poavrvxlvh0irzkbnoyoginp-4om4nn3a2z730xs82d78xj3be-mea0xb6thaagfbcx9i1vg82z-ct4kfyj4tquup0bvqhttvymms-3pwwsn1udmwoy3iort8vfmygt-cfsam81o5sp3cxb7m0hs933c4-648sx8m8b6kj1srq42ztzy224-cd2mdz0dsnx2a8mr21rpzr4vp">\n<script type="text/javascript">window.IN_HASH="state=99z66BjZ8MxGWE67K";</script>\n<script type="text/javascript" src="/uas/js/anonymoususerspace"></script>\n<script type="text/javascript" src="https://static.licdn.com/scds/concat/common/js?h=704vg4uf8u24k6x9wklttlter-d0ibg4wftmmsyne01myd4j3c2-24db431rs3jcq8ygpbao2p4er-404k83hk9szcayv25mokbbrs7-ekrfgxjjabckg0gvr2ikhpbwa-bk5qn00zpwqbjfs55zt6sb6i-57op3gixhg18wymy2d9w2nfs0-dvjjucy8ssjng08mp3knhehjq-197b4sklpose0tbxjfedu9dgi-84gfmjh8s4qcq8j67y2qeyp9y-52vwijdk7s1mercwy5gje7xbq-91nl1r2cw4ytf8skxqkshtss4-dr3it9wq45w29j2a84m3bbbjm-1s2zh88q4t28kgbzj0ygmtz0t-o6bt67iysl4cescfidkhgh8w-9yapbb9c5ce3w0tjhqp8s1ben-be35lq69dqsbgl8h9t4bqpy08-avftajdh5oq2u6k2vaor3czdy-2r5gveucqe4lsolc3n0oljsn1-e9rsfv7b5gx0bk0tln31dx3sq-c8ha6zrgpgcni7poa5ctye7il-51dv6schthjydhvcv6rxvospp-3eh5zbf8m3976frnzqqz8r2md-2xs3x1i8wld5w6lcy1oxa87ce-ac8pg92mfnb2j836ntpvg1fsi-9wkskbn6s2q25rkbrnuwlqric-8vqvo1r7b0ag99we8a4gleai2-a5j90w6w30bxiqjlfqu3a04ao"></script>\n<script type="text/javascript" src="https://static.licdn.com/scds/common/u/js/scds-hashes.js"></script>\n<script type="text/javascript">if(typeof LI===\'undefined\'||!LI){window.LI={};}\nLI.JSContentBasePath="https://static.licdn.com/scds/concat/common/js?v=build-2000_8_41852-prod";LI.CSSContentBasePath="https://static.licdn.com/scds/concat/common/css?v=build-2000_8_41852-prod";LI.injectRelayHtmlUrl="https://static.licdn.com/scds/common/u/lib/inject/0.4.2/relay.html";LI.injectRelaySwfUrl="https://static.licdn.com/scds/common/u/lib/inject/0.4.2/relay.swf";LI.comboBaseUrl="https://static.licdn.com/scds/concat/common/css?v=build-2000_8_41852-prod";LI.staticUrlHashEnabled=true;</script>\n<script type="text/javascript" src="https://static.licdn.com/scds/concat/common/js?h=25kaepc6rgo1820ap1rglmzr4-c19zsujfl1pg46iqy33ubhqc5-c5ebkkd7pexovk435l30l1dq5-ascppxxu6dqpt5sppka77kdt0-8ux0lklo90tb28s8gfw2ojhzb-5n5dp3pn32p4zstdag5cbpr1-eehwe5piqwg4elnl8jvj9vpx"></script>\n<script type="text/javascript" src="https://static.licdn.com/scds/concat/common/js?h=e17zy6z51dugr6fy4su92o7de"></script>\n<link rel="stylesheet" type="text/css" href="https://static.licdn.com/scds/concat/common/css?h=a8hkctebat9cvokt4g6pboiwz">\n<style>\n html { overflow: visible; }\n </style>\n</head>\n<body dir="ltr" class="guest v2  chrome-v5 chrome-v5-responsive sticky-bg guest" id="pagekey-uas-oauth2-auth-code-authorize">\n<input id="inSlowConfig" type="hidden" value="false"/>\n<script type="text/javascript">document.body.className+=" js ";</script>\n<div id="shield"></div>\n<script type="text/javascript">try{if(window.top!=window.self){document.body.className+=" frame-bust";throw 1;}}\ncatch(e){window.top.location.replace(document.location);}</script>\n<div id="frame-contents">\n<div class="container">\n<div id="header" class="header"></div>\n<div id="body">\n<div class="wrapper">\n<div id="global-error">\n</div>\n<div>\n<div class="application-relationship">\n<div class="photo">\n<img src="https://static.licdn.com/scds/common/u/images/themes/katy/ghosts/person/ghost_person_80x80_v1.png" height="72" width="72">\n</div>\n<div class="myself">\n<p>\n</p>\n</div>\n<div class="app">\n<img src="https://static.licdn.com/scds/common/u/img/icon/icon_no_developer_img_80x80.png" height="72" width="72">\n</div>\n</div>\n<div class="wrapper">\n<p class="note">Market Analysis would like to access some of your LinkedIn info:</p>\n</div>\n<ul class="permissions">\n<li>\n<div class="icon">\n<i class="r_fullprofile" title="YOUR FULL PROFILE"></i>\n</div>\n<div class="details">\n<a href="https://help.linkedin.com/app/answers/detail/a_id/1207/loc/na/trk/uas-oauth2-auth-code-authorize/" target="_blank" rel="nofollow">YOUR FULL PROFILE</a>\n<p class="description">Full profile including experience, education, skills, and recommendations</p>\n</div>\n</li>\n<li>\n<div class="icon">\n<i class="r_emailaddress" title="YOUR EMAIL ADDRESS"></i>\n</div>\n<div class="details">\n<a href="https://help.linkedin.com/app/answers/detail/a_id/1207/loc/na/trk/uas-oauth2-auth-code-authorize/" target="_blank" rel="nofollow">YOUR EMAIL ADDRESS</a>\n<p class="description">The primary email address you use for your LinkedIn account</p>\n</div>\n</li>\n</ul>\n</div>\n<form action="/uas/oauth2/authorizedialog/submit" method="POST" name="oauth2SAuthorizeForm" novalidate="novalidate" class="grant-access" data-jsenabled="check">\n<input type="hidden" name="isJsEnabled" value="false"/>\n<div class="login">\n<p class="description">Sign in to LinkedIn and allow access:</p>\n<ul>\n<li class="email-input">\n<label for="session_key-oauth2SAuthorizeForm">Email</label>\n<script id="control-http-12257-exec-55640220-1" type="linkedin/control" class="li-control">LI.Controls.addControl(\'control-http-12257-exec-55640220-1\',\'GhostLabel\',{});</script>\n<div class="fieldgroup">\n<input type="text" name="session_key" value="" id="session_key-oauth2SAuthorizeForm" autocorrect="off" autocapitalization="off" data-ime-mode-disabled>\n<span class="error" id="session_key-oauth2SAuthorizeForm-error"></span>\n</div>\n<a target="_blank" href="/reg/join">Join LinkedIn</a>\n</li>\n<li class="password-input">\n<label for="session_password-oauth2SAuthorizeForm">Password</label>\n<script id="control-http-12257-exec-55640220-2" type="linkedin/control" class="li-control">LI.Controls.addControl(\'control-http-12257-exec-55640220-2\',\'GhostLabel\',{});</script>\n<div class="fieldgroup">\n<input type="password" name="session_password" id="session_password-oauth2SAuthorizeForm" autocorrect="off" autocapitalization="off" maxlength="400" placeholder="Password">\n<span class="error" id="session_password-oauth2SAuthorizeForm-error"></span>\n</div>\n<a target="_blank" href="/uas/request-password-reset?trk=uas-resetpass">Forgot your password?</a>\n</li>\n</ul>\n</div>\n<ul class="duration">\n</ul>\n<div class="actions">\n<ul>\n<li>\n<input type="submit" name="authorize" value="Allow access" class="allow">\n</li>\n<li><a href="http://localhost:3000/_oauthlinkedin?error=access_denied&error_description=the+user+denied+your+request&state=99z66BjZ8MxGWE67K" class="cancel">Cancel</a></li>\n</ul>\n<div class="logo">LinkedIn</div>\n</div>\n<input type="hidden" name="oauth_token" value="na" id="oauth_token-oauth2SAuthorizeForm"><input type="hidden" name="appId" value="" id="appId-oauth2SAuthorizeForm"><input type="hidden" name="client_id" value="778ogspdrry0k0" id="client_id-oauth2SAuthorizeForm"><input type="hidden" name="scope" value="r_fullprofile r_emailaddress" id="scope-oauth2SAuthorizeForm"><input type="hidden" name="state" value="99z66BjZ8MxGWE67K" id="state-oauth2SAuthorizeForm"><input type="hidden" name="redirect_uri" value="http://localhost:3000/_oauthlinkedin" id="redirect_uri-oauth2SAuthorizeForm"><input type="hidden" name="scope_id" value="1059" id="scope_id-oauth2SAuthorizeForm"><input type="hidden" name="authorized" value="true" id="authorized-oauth2SAuthorizeForm"><input type="hidden" name="csrfToken" value="ajax:5462635635084478884" id="csrfToken-oauth2SAuthorizeForm"><input type="hidden" name="sourceAlias" value="0_9DsHd_bZgogqUxUum9_VlTBWJMUCeow0cdGxvyKqdV8" id="sourceAlias-oauth2SAuthorizeForm">\n</form>\n</div>\n</div>\n<script type="text/javascript">LI.Controls.processQueue();</script>\n<div id="footer" class="footer">\n<div class="legal">\n<p>\n<span class="settings">All <strong><a target="_blank" href="/secure/settings?userAgree=">Applications</a></strong> can be found in your settings</span>\n<span class="agreements"><strong><a target="_blank" href="http://www.linkedin.com/static?key=user_agreement&trk=hb_ft_userag">Terms of Service</a></strong> | <strong><a target="_blank" href="http://www.linkedin.com/static?key=privacy_policy&trk=hb_ft_priv">Privacy Policy</a></strong></span>\n</p>\n</div>\n</div>\n</div>\n</div>\n<div id="frame"></div>\n<script type="text/javascript">try{IN.Support.sendReadyResponse(true);}catch(err){}</script>\n<script id="localChrome"></script>\n<script>var jsRandomCalculator=(function(){function compute(n,email,ts){try{var vs=n.split(":"),ts=parseInt(ts),len=vs.length,i,v,f1_out,f2_out;for(i=0;i<len;i++){vs[i]=parseInt(vs[i],10);}f1_out=f1(vs,ts);f2_out=f2(f1_out,ts);if(f1_out[0]%1000>f1_out[1]%1000){v=f1_out[0];}else{v=f1_out[1];}return f3(v,f2_out,email);}catch(err){return-1;}}function computeJson(input){return compute(input.n,input.email,input.ts);}function f1(vs,ts){var output=[],i;output[0]=vs[0]+vs[1]+vs[2];output[1]=(vs[0]%100+30)*(vs[1]%100+30)*(vs[2]%100+30);for(i=0;i<10;i++){output[0]+=(output[1]%1000+500)*(ts%1000+500);output[1]+=(output[0]%1000+500)*(ts%1000+500);}return output;}function f2(vs,ts){var sum=vs[0]+vs[1],n=sum%3000,m=sum%10000,p=ts%10000;if(n<1000){return Math.pow(m+12345,2)+Math.pow(p+34567,2);}else if(n<2000){return Math.pow(m+23456,2)+Math.pow(p+23456,2);}else{return Math.pow(m+34567,2)+Math.pow(p+12345,2);}}function f3(v1,v2,email){var len=email.length,v3=0,i=0;for(;i<len;i++){v3+=email.charCodeAt(i)<<((5*i)%32);}return(v1*v2*v3)%1000000007;}return{compute:compute,computeJson:computeJson,version:"1.0.1"};}());</script>\n<script type="text/javascript" src="https://static.licdn.com/scds/concat/common/js?h=eq875keqggun9hoxzfhbanjes"></script>\n<script type="text/javascript" src="https://static.licdn.com/scds/concat/common/js?h=czstax4e6y68hymdvqxpwe5so-e2w0ytit45cew0zvrmwmlx7j4"></script>\n<script type="text/javascript">LI_WCT(["control-http-12257-exec-55640220-1","control-http-12257-exec-55640220-2",]);</script>\n<script type="text/javascript">LI.Controls.processQueue();</script>\n</body>\n</html>
'

# Header
# POST /uas/oauth2/authorizedialog/submit HTTP/1.1
# Host: www.linkedin.com
# Connection: keep-alive
# Content-Length: 539
# Pragma: no-cache
# Cache-Control: no-cache
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# Origin: https://www.linkedin.com
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36
# Content-Type: application/x-www-form-urlencoded
# Referer: https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=778ogspdrry0k0&scope=r_fullprofile%20r_emailaddress&state=0.871024023508653&redirect_uri=http://localhost:3000/_oauthlinkedin
# Accept-Encoding: gzip, deflate
# Accept-Language: fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4
# Cookie: IN_HASH=state%3D8fd20dab94fd55fb459807b1c9f3ea1f; bcookie="v=2&49e5944b-8510-4c8b-8ef7-1f881152caa7"; __qca=P0-1573792554-1384261375226; bscookie="v=1&2013111213031023156bbe-83d4-4cc7-8e67-dc517d71fec1AQH8MFo6gLf9pLF1r2Qvd9Lt9bYpgmgT"; visit="v=1&M"; X-LI-IDC=C4; X-LI-DDC=C1; lihc_auth_fr=1397597837; li_loc=na; li_trk=NoPageKey; L1l=30d3e154; L1c=4b8b4c00; L1e=6ac7eec3; sdsc=1%3A1SZM1shxDNbLt36wZwCgPgvN58iw%3D; _leo_profile=""; X-ATS-Node-0=0; X-ATS-Node-1=0; X-ATS-Node-2=0; lihc_auth_en=1419335108; lihc_auth_str=3wXD470PVP1JPV06Gog93K%2FI9Jm91mQuXJasdZ%2FzaZwdwmG6Vf6t7%2BKpq1U3xYDr0e2jH9tSupNb%2FeT%2FMjJIgadQ7dfTmtm6nGC2m0YHoYZNdT0ytbK4zAkPxZOM6M1y3cuHhs0HSplBm4ftUAWVy26ByASQ1IOBCG2GCIJcoXgvD%2Fzyh5KcLxd5dMSMQIYmVY9jIII%2F%2FBi%2FRaVyDpE%2Fn4uph6TMjwTlQTjTxJrC%2Bfj02%2B8iuMndauF0oP%2FMGGNHmHJwMyCYlMdWt2QIBSh%2FhZqTBmCCgqBim2NB3picl4JPzKbwIqXkAhSl24jvLUzqVXN5X3EOfok4s2WX%2BRCDRfnEmiyF%2BibuxpROkbb4%2Fpir%2BQwupYD8UJeuy86HoITTE%2FXtPPwONvo%3D; __utma=226841088.415912892.1419242244.1419242244.1419335112.2; __utmc=226841088; __utmz=226841088.1419335112.2.2.utmcsr=developers.linkedin.com|utmccn=(referral)|utmcmd=referral|utmcct=/documents/people-search-api; __utmv=226841088.authorized; JSESSIONID="ajax:8482524907832911597"; lidc="b=VB41:g=142:u=1:i=1419356726:t=1419443126:s=1146971544"; _lipt=0_au6VXVyNh7c6t0dJa2A_XbbMzD20ccQqnrPCDCKV_8sfhWqW26BndCfjcs04kJIIQ_STVtMAhRgcYboe1ZziIWN7zrPVUy09U__1gAoQXDHn1SLD9rsga-Cy4GdGt7OdAoLTGXMo3K-yQAVpSHrpcZiq-gv6lxSxRWQ_8vNlmwVKYUGOi7u7kC9On-11eT_m46j9nOk4y3x6279inUad-uCuvovoNUhSg45uxLVJNGbQYWhZ_omM0wu8nqDpMtxld-gpMSgKQN3taFpSN-DOReuvyevHaZSMXQATrJ_HO_C; leo_auth_token="GST:Z-5XY8rsAPkRlEplZwrOikCfsBAjb_-EigMGwFMRdBKeZxt_aPDCAo:1419430657:23148ed7459c9472a98b53f94c50dcb1417e6c22"; lang="v=2&lang=fr-fr&c="


# Body
# isJsEnabled=true&session_key=sachalec67%40gmail.com&session_password=pJJA4Ehpc7me0Vw&authorize=Autoriser&oauth_token=na&appId=&client_id=778ogspdrry0k0&scope=r_fullprofile+r_emailaddress&state=0.871024023508653&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2F_oauthlinkedin&scope_id=1059&authorized=true&csrfToken=ajax%3A8482524907832911597&sourceAlias=0_9DsHd_bZgogqUxUum9_VlTBWJMUCeow0cdGxvyKqdV8&client_ts=1419430671632&client_r=%3A472660511%3A474862485%3A902202021&client_output=0&client_n=472660511%3A474862485%3A902202021&client_v=1.0.1



cookie =  Meteor.npmRequire 'cookie'

#rawcookies = 'IN_HASH=state%3D8fd20dab94fd55fb459807b1c9f3ea1f; bcookie="v=2&49e5944b-8510-4c8b-8ef7-1f881152caa7"; __qca=P0-1573792554-1384261375226; bscookie="v=1&2013111213031023156bbe-83d4-4cc7-8e67-dc517d71fec1AQH8MFo6gLf9pLF1r2Qvd9Lt9bYpgmgT"; visit="v=1&M"; X-LI-IDC=C4; X-LI-DDC=C1; lihc_auth_fr=1397597837; li_loc=na; li_trk=NoPageKey; L1l=30d3e154; L1c=4b8b4c00; L1e=6ac7eec3; sdsc=1%3A1SZM1shxDNbLt36wZwCgPgvN58iw%3D; _leo_profile=""; X-ATS-Node-0=0; X-ATS-Node-1=0; X-ATS-Node-2=0; lihc_auth_en=1419335108; lihc_auth_str=3wXD470PVP1JPV06Gog93K%2FI9Jm91mQuXJasdZ%2FzaZwdwmG6Vf6t7%2BKpq1U3xYDr0e2jH9tSupNb%2FeT%2FMjJIgadQ7dfTmtm6nGC2m0YHoYZNdT0ytbK4zAkPxZOM6M1y3cuHhs0HSplBm4ftUAWVy26ByASQ1IOBCG2GCIJcoXgvD%2Fzyh5KcLxd5dMSMQIYmVY9jIII%2F%2FBi%2FRaVyDpE%2Fn4uph6TMjwTlQTjTxJrC%2Bfj02%2B8iuMndauF0oP%2FMGGNHmHJwMyCYlMdWt2QIBSh%2FhZqTBmCCgqBim2NB3picl4JPzKbwIqXkAhSl24jvLUzqVXN5X3EOfok4s2WX%2BRCDRfnEmiyF%2BibuxpROkbb4%2Fpir%2BQwupYD8UJeuy86HoITTE%2FXtPPwONvo%3D; __utma=23068709.1986074524.1419431977.1419431977.1419431977.1; __utmc=23068709; __utmz=23068709.1419431977.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmv=23068709.guest; lidc="b=VB66:g=124:u=84:i=1419432003:t=1419446594:s=AQGoV3xm2bkGZcsnRpyZLJR7Ia3w1srK"; _lipt=0_fIRVA-OD2XEx1R0GwUjagr5bP4OFh91G3SS-eP_pK0vGFopHWuGaNGN5Sj3MH3LGqQ50813qn3-_dMk9j4amC5-rMEh9EpdJmKvGW8UhrJ1OkOFWgNXDlN9BPWw2GShvKrb6vAktfxe0C-B7o5gP_5iq-gv6lxSxRWQ_8vNlmwVKYUGOi7u7kC9On-11eT_m46j9nOk4y3x6279inUad-uCuvovoNUhSg45uxLVJNGbQYWhZ_omM0wu8nqDpMtxld-gpMSgKQN3taFpSN-DOReuvyevHaZSMXQATrJ_HO_C; lang="v=2&lang=fr-fr&c="; li_at=AQECAQFzcCYF4C_ZAAABSny9S58AAAFKfbwD_01YIcqZ-Dk_ugcScJz9zv20PHdgZlr6sYhbOBRIREq19dYH7sDTmmBNiR0Jp5IkiJ5wDiUvYtmIm0y17WNdni56Mwxb0DDjLFr-5Bbmno8VcAlqEOQ; sl="v=1&vWQQ9"; JSESSIONID="ajax:8482524907832911597"'
#dictcookies = cookie.parse rawcookies
#console.log 'dictcookies', dictcookies
#console.log 'serielized', cookie.serialize dictcookies


headersetactions = [
  '"_lipt=deleteMe; Expires=Thu, 01-Jan-1970 00:00:10 GMT; Path=/"'
  '"leo_auth_token="GST:9oO9Uvpj67WGivCW7POznvpqmNpXltSG7Ga7nqH3c2Wa8vCaPk_7K0:1419595915:a1452a079583e3b56246009ccb5c68f06a2c2574"; Version=1; Max-Age=1799; Expires=Fri, 26-Dec-2014 12:41:54 GMT; Path=/"'
  '"sl="delete me"; Version=1; Max-Age=0; Expires=Thu, 01-Jan-1970 00:00:10 GMT; Path=/"'
  '"sl="delete me"; Version=1; Domain=.www.linkedin.com; Max-Age=0; Expires=Thu, 01-Jan-1970 00:00:10 GMT; Path=/"'
  '"s_leo_auth_token="delete me"; Version=1; Max-Age=0; Expires=Thu, 01-Jan-1970 00:00:10 GMT; Path=/"'
  '"JSESSIONID="ajax:7157219241963920479"; Version=1; Domain=.www.linkedin.com; Path=/"'
  '"visit="v=1&G"; Version=1; Max-Age=63072000; Expires=Sun, 25-Dec-2016 12:11:55 GMT; Path=/"'
  '"lang="v=2&lang=en-us"; Version=1; Domain=linkedin.com; Path=/"'
  '"bcookie="v=2&8635cfab-1334-40a5-831d-32210a69352a"; domain=.linkedin.com; Path=/; Expires=Sun, 25-Dec-2016 23:49:27 GMT"'
  '"bscookie="v=1&20141226121155e2b5da06-845f-437a-81d7-97a394134fe6AQG9iy8YhJ0iU97R5IfMGg1iyry8bjCz"; domain=.www.linkedin.com; Path=/; Secure; Expires=Sun, 25-Dec-2016 23:49:27 GMT; HttpOnly"'
  '"lidc="b=VB28:g=138:u=1:i=1419595915:t=1419682315:s=933191436"; Expires=Sat, 27 Dec 2014 12:11:55 GMT; domain=.linkedin.com; Path=/"'
]


###
for header in headersetactions
  setheader = cookie.parse header
  console.log 'header', cookie.serialize 'titi', 'toto', setheader
###

request = (Meteor.npmRequire 'request').defaults jar: true
$ = Meteor.npmRequire 'cheerio'

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
    request.get
      url: encodeURI url
    , (e, r, body) ->
      console.log 'PEM: Error', e if e
      console.log 'PEM: Step 2'
      $resbody = $ body
      $form = $resbody.find 'form'
      testProfile =  Meteor.settings.public.testProfile
      post_url = "https://www.linkedin.com/#{$form.attr 'action'}"
      console.log 'post_url', post_url
      $inputs = $form.find 'input'
      formData = {}
      postbody = $inputs.each (idx, elem) ->
        $elem = $ elem
        name = $elem.attr 'name'
        switch name
          when 'isJsEnabled' then formData['isJsEnabled'] = true
          when 'session_key'
            formData[name] = encodeURIComponent testProfile.email
          when 'session_password'
            formData[name] = encodeURIComponent testProfile.password
          else
            formData[name] = encodeURIComponent $elem.attr 'value'
      debugger
      request.post
        url: post_url
        form: formData
        followAllRedirects: true
      , (e, r, body) ->
        console.log 'PEM: Error', e if e
        console.log 'PEM: Step 3'
        debugger

  '_isLinkedinConnected': ->
    console.log 'PEM: Step 1'
    HTTP.get (encodeURI url), (error, response) ->
      if error
        console.log 'PEM: Error', error
      console.log 'PEM: Step 2'
      debugger
      $resbody = $ response.content
      $form = $resbody.find 'form'
      testProfile =  Meteor.settings.public.testProfile
      post_url = "https://www.linkedin.com/#{$form.attr 'action'}"
      console.log 'post_url', post_url
      $inputs = $form.find 'input'
      postbody = $inputs.map (idx, elem) ->
        $elem = $ elem
        name = $elem.attr 'name'
        switch name
          when 'isJsEnabled' then return 'isJsEnabled=true'
          when 'session_key'
            return "#{name}=#{encodeURIComponent testProfile.email}"
          when 'session_password'
            return "#{name}=#{encodeURIComponent testProfile.password}"
          else
            return "#{name}=#{encodeURIComponent $elem.attr 'value'}"
      .get().join '&'
      console.log 'postbody', postbody.length, postbody
      HTTP.post post_url, {
        headers:
          'Connection': 'keep-alive'
          'Pragma': 'no-cache'
          'Cache-Control': 'no-cache'
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
          'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
          'Content-Type': 'application/x-www-form-urlencoded'
          'Referer': url
          #'Accept-Encoding': 'gzip, deflate'
          'Accept-Language': 'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4'
        content: postbody
      }, (error, response) ->
        if error
          console.log 'PEM: Error', error
        console.log 'PEM: Step 2bis', response





      #console.log 'Response', response
    #console.log 'isLinkedinConnected', access_token
    return true
