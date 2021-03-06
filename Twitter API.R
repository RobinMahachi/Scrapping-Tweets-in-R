# you need a Twitter API to run this script
# https://developer.twitter.com/en/docs/getting-started 
# Follow the steps in the link above, then return to this script. Enter your API keys, install the packages 
# below if you do not already have them. 

library(twitteR)
library(rtweet)
library(dplyr)
library(magrittr)


boris.johnson.followers <- get_followers("BorisJohnson", n=5000, retryonratelimit = TRUE) # get a list of people who follow the British PM
boris.johnson.followers.metadata <- lookup_users(boris.johnson.followers$user_id) # extract their user IDs
boris.johnson.followers.metadata$screen_name # a look at the names/accounts that follow Boris Johnson

# what does the PM favourite on Twitter?

boris.johnson.favourites = get_favorites("BorisJohnson", n=200)
favourited.tweets = boris.johnson.favourites$text # viewing the last 200 things he favourited
# Search the last 500 tweets about the UK budget

about.budget = search_tweets("UK Budget 2021", n=500)
budget.tweets = about.budget$text # view 500 tweets (or related to another tweet) about the budget

# lets view the location of these tweets
# if we wanted to know the device used to make the tweet
table(about.budget$source) 

# what is trending in London?

london.trends = get_trends("london")
london.trends$query # This will require cleaning, but you can see the trends

#if you want to save these tweets for further analysis or to clean up elsewere; note you can also cbind with other data such as user screen name
write.csv(budget.tweets, file = "C:\\Users\\Robin\\Documents\\UKBudgetTweets.csv") # amend as necessary. You can store any data this way. 


# Part II of this script will feature more in depth analysis, for now it was to showcase the basics of the Twitter API and scraping tweets