# README

[![Build Status](https://travis-ci.org/teh-username/ninja-corgi.svg?branch=master)](https://travis-ci.org/teh-username/ninja-corgi)

---
### Live Site
Live version can be found [here](http://laroberto.xyz/).

---
### Stuffs
1. `bundle exec install`
2. `bundle exec rake db:create`

---
### Running tests
To run the test suite simply execute:
`bundle exec rake test`

---

### Prod deployment pitfalls
1. [Phusion Passenger](https://www.phusionpassenger.com/) REALLY needs the 1024 MB recommended RAM. I tried with 512 MB and 1 GB and failed miserably.
2. Apache2 does not import environment variables from `~/.bashrc`. All variables must be at `/etc/apache2/envvars`.
3. Don't forget to set the following in `config/secrets.yml`:

   ```ruby
    secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
    secret_token: <%= ENV["SECRET_KEY_BASE"] %>
   ```
 ---
4. [Precompile assets before hand](http://guides.rubyonrails.org/asset_pipeline.html#in-production)
5. `sudo a2enmod expires`
6. `sudo a2enmod headers`
 
### TO-DOs
0. Moar unit tests
1. Create deploy script
2. Travis-CI
3. Login / Contact me page
4. Authy
