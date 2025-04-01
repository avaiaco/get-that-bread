# User Metrics
## Link to HEART Framework

[Heart Framework](https://docs.google.com/presentation/d/1I606hHl0xZqUDgTvlH2gNzADXv0paruSkbIkqUY07vo/edit?usp=sharing)

## NPS Survey:

The Net Promoter Score data will be collected when the user fills out the rating survey when the button to "leave a review" is pressed. We have a specific section to avoid any popups that may deter users from pressing certain buttons or using the app, as sometimes ratings can be a bit frustrating, especially since our app is used for a specific purpose. In the future, we may add another rating for when the user clicks, or saves a certain amount of recipes on Get That Bread. The data will be stored within the ratings collection in Firestore Database.

## Adoption:
We will measure the adoptability of our apps through analyzing the metrics given on Google Analytics/Firebase regarding new signups, downloads, subscrptions purchased, and how many users it has been reached. With this data, we will be able to update our app and continue to provide improvements through seeing what users like and don't like, and be able to market to a broader audience. All our data collection will be on Firebase.

## Retention: 
We will be measuring the retention of our app by monitoring the number of weekly active users of our app, as well as the churn rate. This will be done by keeping track in the backend whenever a unique user logs into the app. With this information, we will be able to derive the number of unique users that have used the app each week, and also be able to calculate the churn rate by analyzing how many different users have stopped using the app altogether.

## Active Users:

## User Location: 

The user location is a built-in Firestore Database collection where when a user creates an account, the general location (likely based off of IP) is tracked and displayed, which would show up as a certain country or continent on the map in our analytics. Get That Bread needs this data as we need to see where certain users are from to reflect the currency that they should be able to view in the app, or if we only have American users, which would require no change.
