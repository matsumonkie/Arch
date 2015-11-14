Arch
====

install:
- bundle install
- rake bower:install
- rake db:seed

setup starting script:
  
  mkdir -p ~/work/invoker && cd ~/work/invoker
  gem install invoker
  
**invoker.ini**

    [app]
    directory = /home/iori/work/app
    command = chruby-exec $(cat .ruby-version) -- bundle exec rails s -p 3000
    
    [sidekiq]
    directory = /home/iori/work/app
    command = chruby-exec $(cat .ruby-version) -- bundle exec sidekiq -C config/sidekiq.yml

start:

    invoker start ~/work/invoker/invoker.ini

nginx config:

**/etc/sites-available/app**

    server {
      listen 80;
      server_name dev.app.com;
      return 301 https://$host$request_uri;
    }
    
    server {
      listen 443 spdy;
      server_name dev.app.com;
    
      root /home/iori/work/app/public;
    
      try_files $uri/index.html $uri.html @app;
    
      location @app {
        proxy_pass http://app;
      }
    
      ssl on;
      ssl_certificate /home/iori/work/app/config/ssl/app.crt;
      ssl_certificate_key /home/iori/work/app/config/ssl/app.key;
    }
    
    upstream app {
      server 0.0.0.0:3000;
    }
    
