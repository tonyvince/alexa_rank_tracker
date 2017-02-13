# Alexa Rank Tracker
<p align="center">
<a href="https://raw.githubusercontent.com/tonyvince/alexa_rank_tracker/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
Ruby on Rails application that lets users keep track their website's [Alexa](http://www.alexa.com/siteinfo) Rank.
Made with ❤️ by [Tony Vincent](tonyvince7@gmail.com).

## Getting Started

Clone the repository `git@github.com:tonyvince/alexa_rank_tracker.git`

### Prerequisite

```ruby
 $ ruby -v
 ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-linux]
 $ rails -v
 Rails 4.2.5

```


### Installing



```ruby
$ git@github.com:tonyvince/alexa_rank_tracker.git
$ cd alexa_rank_tracker
$ bundle
$ rake db:migrate
$ rake db:seed
$ rails s
$ RAILS_ENV=development bin/delayed_job start forstarting background jobs
$ rake recurring:init


```

Also mak esure you have the following environment variables set up

```
ENV['USERNAME'] # db username
ENV['PASSWORD'] # db password
ENV['EMAIL_ID'] # email for devise mails
ENV['EMAIL_PASSWORD'] # password 
```
If graphs are not showing up run `$rake highcharts:update`

## Built With

* [Devise](https://github.com/plataformatec/devise) - Authentication framework
* [delayed_job](https://github.com/collectiveidea/delayed_job_active_record) - Background processing
* [active_Admin](administration framework) - Administration framework

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

 

## Authors

* **Tony Vincent** 

## License

This project is licensed under the MIT License