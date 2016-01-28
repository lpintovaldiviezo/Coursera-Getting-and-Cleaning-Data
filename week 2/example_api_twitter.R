myapp = oauth_app("twitter", key="KLnzVFZorDRufxqAvnvymve3H",
	secret = "	dlx7mWm5hqE7RQ3c0v3t1LCJABkI2X8A4iNljc0dw39FB7QTsC")
sig = sign_oauth1.0(myapp, 
		token = "4847244640-qbyowCwHByU7arZ1BdDFSOwcOpyEjwf70KCN30n",
		token_secret = "GItxONsaRfyDiSOFuIKl7aUHsYTu7tuMnMI1IA9uLESbm")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
