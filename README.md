We want to build a Ruby on Rails application that lets users keep track their website's Alexa Rank.

Part 1:

A user should be able to register and login to our application (using the devise gem : https://github.com/plataformatec/devise).
On the dashboard the user would have an option to enter the domain (limit of 3), and our application would scrape the rank from the alexa website. (eg: http://alexa.com/siteinfo/redpanthers.co).
The rank should be displayed in our dashboard.

Part 2:

At 12 PM (UTC), our system would check its rank in the alexa website again. 
Then build a graph for the website with change in rank. 
The graph should be build using Highcharts.
The scraping of rank should be done using the nokogiri gem and as a background job (read about ActionJob & sucker_punch).

Part 3:
Build an admin panel for us to manage this application and users using the ActiveAdmin gem.

// All the code should be managed using github and bonus points for writing test using RSpec or MiniTest
