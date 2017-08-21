local geoserver_token = require('<%= @nginx_base_dir %>/conf/modules/geoserver_token');

local uri = ngx.var.uri
local accessToken = ngx.var.cookie_AccessToken
local authorised = false

ngx.log(ngx.NOTICE, 'BEGIN check_geotoken.lua')

match, err = ngx.re.match(uri, "^/geoserver/llc/([a-z0-9-]+)/")

if match then
  local geoToken = match[1]
  ngx.log(ngx.INFO, "Found geotoken: " .. geoToken .. " checking validity")
  if geoserver_token.check_token(accessToken, geoToken) then
     ngx.log(ngx.INFO, "Geotoken valid")
     authorised = true
     uri = ngx.re.sub(uri, "/" .. geoToken, "")Add 
  end     
end

if authorised then
  ngx.req.set_uri(uri)
else
  ngx.log(ngx.ERR, "Error extracting geotoken: ", err)
  ngx.header["X-Frame-Options"] = 'sameorigin'
  ngx.header["X-XSS-Protection"] = '1'
  ngx.header["X-Content-Type-Options"] = 'nosniff'
  ngx.exit(403)
end
