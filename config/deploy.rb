# config valid only for current version of Capistrano
lock '3.4.0'

APP_PATH = '/home/runner/app'

set :chruby_ruby, 'ruby-2.2.0'
set :application, 'app'
set :repo_url, 'git@github.com:app/app.git'
set :unicorn_config_path, 'config/unicorn.rb'
set :unicorn_pid, "#{APP_PATH}/current/tmp/pids/unicorn.pid"
set :sidekiq_config, -> { File.join(APP_PATH, 'current/config', 'sidekiq.yml') }

set :branch, ENV.fetch('BRANCH', 'dev')
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, APP_PATH

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, ENV.fetch('LOG', 'info')

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/mongoid.yml', 'config/secrets.yml', 'config/application.yml', 'config/sidekiq.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'public/assets', 'sockets', 'public/avatars')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :deploy, :updating do
    invoke 'deploy:compile_assets'
  end

  after :deploy, :publishing do
    invoke 'unicorn:reload'
  end
end
