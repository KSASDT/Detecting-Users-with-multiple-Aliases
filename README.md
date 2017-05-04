# B-Tech-Project

Description:
-----------
Alias identification has not been exploredmuch on Twitter, especially experimenting with time profiles.The earlier works done by various authors have only considered stylometric features to identify the multiple aliases.


How the dataset was obtained:
-----------------------------
This dataset is collected from Sentiment140(Corpus).The original dataset contained 1600000 enteries of users and the subset of the Twitter data is parsed using Python. Our dataset of Twitter includes the tweets of various users from May to June, 2009.This dataset is further preprocessed using Python and the number of posts for all the users are calculated for each user. Then these users are listed in the decreasing order of the number of the posts as per the experimental requirements.

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
			
			
Methodology:
------------

Mainly we have:

(i) Structured the Twitter data set

(ii) Performed the stylometric analysis of the posts

(iii) Incorporated time profile features along with stylometric features

(iv) Analyzed the results on performing combination of the matching techniques



Results:
---------
The experiment shows the identification of the aliases of a Twitter user using supervisedlearning techniques. From the results, it is inferred that the combined technique is more accurate to detect the aliases. A significant increase in the accuracies is seen whenboth timeprints and stylometric features are used. As the number of users increases,there is a decrease in the accuracy of both classifiers (Naïve Bayes and SVM) in detection of the aliases. The performance of the individual stylometric technique for identification of users decreases more in comparison tothe combined technique.It can also be seen from the results that the support vector machine classifier outperforms the Naive Bayes classifier.
