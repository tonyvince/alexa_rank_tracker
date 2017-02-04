We want to build a Ruby on Rails application that lets users keep track their website's Alexa Rank.

Part 1:

A user can register and login to the application (using the devise gem : https://github.com/plataformatec/devise).
On the dashboard the user would have an option to enter the domain (limit of 3), and the application scrapes the rank from the alexa website. (eg: http://alexa.com/siteinfo/redpanthers.co).
The rank is displayed in dashboard.

Part 2:

At 12 PM (UTC), system checks its rank in the alexa website again. 
Then build a graph for the website with changes in rank. 
The graph is build using Highcharts.
The scraping of rank is done using the nokogiri gem and as a background job (read about ActionJob & sucker_punch).

Part 3:
Build an admin panel for to manage the application & users using the ActiveAdmin gem.

