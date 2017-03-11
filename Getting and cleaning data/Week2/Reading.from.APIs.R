## Example of reading from APIs

##Accessing Twitter from R
myapp = oauth_app("twitter",key = "8p2mcx18rrnOPUPWZOsuJfD7w",
                  secret = "ConsumerSecret")
sig = sign_oauth1.0(myapp, token = "token",
                    token_secret = "tokenSecret")
homeTL = GET("https://api.twitter.com/1.1/search/tweets.json", sig)

##Converting the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]