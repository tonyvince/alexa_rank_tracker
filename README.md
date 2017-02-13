# Alexa Rank Tracker
<p align="center">
  <img src="https://raw.githubusercontent.com/tonyvince/alexa_rank_tracker/master/public/logo.png", alt="logo"/>
</p>

[![Build Status](https://travis-ci.org/tonyvince/alexa_rank_tracker.svg?branch=master)](https://travis-ci.org/tonyvince/alexa_rank_tracker)
[![Code Climate](https://codeclimate.com/github/tonyvince/alexa_rank_tracker/badges/gpa.svg)](https://codeclimate.com/github/tonyvince/alexa_rank_tracker)
[![Dependency Status](https://www.versioneye.com/user/projects/58a13a3e0f3d4f003ce97ed3/badge.svg)](https://www.versioneye.com/user/projects/58a13a3e0f3d4f003ce97ed3)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://raw.githubusercontent.com/tonyvince/alexa_rank_tracker/master/LICENSE)


Ruby on Rails application that allows users to keep track their website's <a href="http://www.alexa.com/siteinfo">Alexa</a> Rank.


Made with ❤️ by <a href="mailto:tonyvince7@gmail.com">Tony Vincent</a>.



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