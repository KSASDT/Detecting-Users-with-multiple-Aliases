# B-Tech-Project

Description:
-----------
Alias identification has not been exploredmuch on Twitter, especially experimenting with time profiles.The earlier works done by various authors have only considered stylometric features to identify the multiple aliases.


How the dataset was obtained:
-----------------------------
This dataset is collected from Sentiment140(Corpus).The original dataset contained 1600000 enteries of users and the subset of the Twitter data is parsed using Python. Our dataset of Twitter includes the tweets of various users from from May to June, 2009.This dataset is further preprocessed using Python and the number of posts for all the users are calculated for each user. Then these users are listed in the decreasing order of the number of the posts as per the experimental requirements.

Format of the data file (13 fields) :

1) User_Id
2) Day
3) month
4) Date
5) time
6) timezone
7) year
8) User_name
9) Tweets
10)Score (no of tweets per user)
11)Period of day (Early Morning, Morning, Mid Day, Evening, Night, Midnight)
12)type of day (Weekday, Weekend)
13)hour of day (1 to 24)


File and Directory Structure:
---------------------------

Files includes:
            
			training.1600000.processed.noemoticon  : Original Dataset
			Dataset_32users                        : Dataset used
			Style_edited                           : Stylometric Matlab code
			TP_edited                              : Timeprint matlab code
			
			

