# README
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
1. Apache2 does not import environment variables from `~/.bashrc`. All variables must be at `/etc/apache2/envvars`.
2. Don't forget to set the following in `config/secrets.yml`:
   ```ruby
    secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
    secret_token: <%= ENV["SECRET_KEY_BASE"] %>
   ```
 ---
 
### TO-DOs
1. Create deploy script
2. Travis-CI