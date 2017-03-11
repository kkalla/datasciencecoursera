library(httr)
library(httpuv)

oauth_endpoints("github")

myapp <- oauth_app("github", key = "455aac01d95614a2dfce",
                   secret = "185789eb5a588f2870dc2557158f328d0df37e6a")

github_token <- oauth2.0_token(oauth_endpoints("github"),myapp)

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos",gtoken)

json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))