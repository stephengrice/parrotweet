# ParroTweeter

ParroTweeter is a web application made for use as a marketing tool for a business of any size. The primary feature is the ability to enter a tweet in English and have the tweet automatically reposted in the users' choice of foreign languages in order to reach an international audience. The original project was developed in less than 24 hours by Jeff Gibson, Stephen Grice, and Justin Weiss.

## StockHack
This project was developed as a part of the Innovation challenge at the inaugural StockHack 2017 hackathon, hosted at Stockton University in Galloway, New Jersey. The project was chosen as the runner-up for best Innovation project (second place) by a panel of judges. Judges determined the placement of each Innovation project based on a standard evaluation of the project and presentation.

## Problem
The owner of a business of any size will be in a constant search for ways to expand their customer base and gain access to new commercial opportunities. Social media platforms are often a go-to for reaching a new audience, but a huge limitation of this approach is the language barrier that exists between a business and scores of potential customers. If you speak only one language, how can you take full advantage of the internet and reach a customer base anywhere in the world?

## Solution
ParroTweeter provides a single, simple interface for managing tweets in multiple languages. A single tweet in English can be automatically translated and tweeted in each foreign language that is selected by the user. In this way, the user saves time and headaches, using only a single click to reach clients from a wide range of backgrounds and locations.

## Instructions
To login and use ParroTweeter, you need to have a valid Twitter account.

1. On the [home screen](http://parrotweet-stockhack.herokuapp.com), click "Sign in with Twitter." You will be redirected to an official Twitter login page, where you can login and provide ParroTweeter with appropriate permissions.

2. Once you have logged in, press the newly revealed "Your Tweets" button. This will load your dashboard.

3. On your dashboard, click "New Tweet." Enter your desired message, including hashtags. Note that hashtags will not be translated; they will be preserved as-is.

4. Click the checkbox for any language you would like your tweet to be translated to, and press "Create Tweet."

5. The Tweet will be added to your Dashboard, as well as your live Twitter profile. To view the original tweet and its translations, press "Details" on the desired tweet.

6. To view analytics concerning your language coverage, press the red "Analytics" button on your dashboard.

## Technologies Used

* **Ruby 2.3.3**

* **Ruby on Rails 5**

* **Heroku** is used as Software-as-a-Service hosting; with a simple push of the git repository, the Rails app and corresponding postgreSQL database are configured and made available to anyone.

* **Twitter Bootstrap 3** is used as the front-end framework. It was helpful in rapidly creating a mobile-first, responsive design.

* The **Google Charts API** (JavaScript) is briefly used to visualize statistics on the Analytics page.

* The **Twitter API** was an essential part of the application. The [`twitter` gem](https://github.com/sferik/twitter) by sferik and the [`omniauth-twitter` gem](https://github.com/arunagw/omniauth-twitter) by arunagw are leveraged to allow the reading, posting, and deleting of tweets for an authorized user account.

* The **[Transltr](http://transltr.org/) API** provided an extremely easy-to-use translation API. It required no authentication or API tokens to use.

## Acknowledgements
The creators of this project extend a big thanks to the faculty and students of Stockton University, especially those involved in the planning and execution of StockHack, for hosting such an innovative event. Each participant of the event was presented with an invaluable opportunity to learn technical and team-based skills that would be nearly impossible to attain in a traditional classroom setting.

A large portion of this project runs on open source code. Thus, we are endlessly grateful to the hundreds of programmers who came together to create the underlying software that made ParroTweet possible. Thank you.

Finally, [this RailsCast](https://www.youtube.com/watch?v=vFiblY5KUZE) was invaluable in connecting our application to the Twitter API. We highly recommend it to anyone attempting to solve related problems.