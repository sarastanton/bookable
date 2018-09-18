# Bookable

## OVERVIEW

Bookable is a Ruby on Rails application that lets users create a list of books (including author, genre, and page count) that they either have or would like to read. Users can also track the number of pages they have read, as well as leave ratings and reviews for books they have read. Users can create an account through a traditional signup form, or sign in with an existing Goodreads account.

## INSTALLATION

Clone or download this repository and run ```bundle install``` to install the gems necessary for this application. Run ```rake db:migrate``` to create database tables and ```rake db:seed``` to load seed data into the database. Preview the application in your web browser using ```rails s```.

## GOODREADS OMNIAUTH
NOTE ON GOODREADS OMNIAUTH LOGIN: The "login with Goodreads" feature on the application's login and signup pages will NOT work out of the box. This is because a developer key is required, and I am not going to publicly post my individual developer key. If you would like to configure the application to get the Goodreads login working, you will need to perform two steps: 1) update the omniauth-goodreads2 gem to

### UPDATE GEM
At the time of this writing (September 2018), the Goodreads API requires an HTTPS connection, and the omniauth-goodreads2 gem (version 0.1.0 at the time of this writing) has not been updated to work with HTTPS. You can update your local copy of the gem as follows:

  1) After running ```bundle install``` to install the gems required for this application, run``` gem open omniauth-goodreads2``` to open the source code for the omniauth-goodreads2 gem in your text editor.

  2) Open the file lib/omniauth/strategies/goodreads2.rb and change every instance of "http" to "https". In version 0.1.0, there are 3 instances (on lines 8-10).

### CONFIGURE DEVELOPER KEY

  1) Sign up for a developer key for the Goodreads API: https://www.goodreads.com/api/keys

  2) Create a file within the root directory of the application called ".env" that contains the following two lines:

    GOODREADS_KEY=[insert key from Goodreads here]
    GOODREADS_SECRET=[insert secret from Goodreads here]

  3) Once you have updated the gem and added your .env file with your own individual developer key and secret from Goodreads, use  ```thin start --ssl ``` to preview the application in your browser with an HTTPS connection.


## CONTRIBUTING

Bug reports and pull requests are welcome on GitHub at https://github.com/sarastanton/bookable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## LICENSE

The application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## CODE OF CONDUCT

Everyone interacting in the Bookable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sarastanton/bookable/blob/master/CODE_OF_CONDUCT.md).
