== README BLOCKMARK

Built for [Bloc.io](http://bloc.io)

Simple app that allows users to bookmark URLs via email, peruse other user's bookmarks and maintain a personal index of categorized bookmarks.

##Environments 

- Rails 4.0.4
- Ruby 2.1.1

##Highligths

* Mailgun implementation to receive incoming messages and parse the sender, subject and email body to create two objects one in Categories and other in Bookmarks.

* Devise and Pundit gems for registration and authorization.

* Link_thumbnailer gem to preview links. Takes a while to load each category while it fetches each site.

##Production 

Demo here [Heroku link](http://g-blockmark.herokuapp.com/)

## NOTE
* Mails have to be sent without anyother information attached inside the body, a plain URL will work with the initial format http:// or https:// 











