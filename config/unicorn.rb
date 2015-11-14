# workers
worker_processes 4

# path
app_path = File.expand_path(File.dirname(__FILE__) + '/..')
listen app_path + '/../../shared/sockets/unicorn.sock', backlog: 64

working_directory app_path

# pid
pid app_path + '/tmp/pids/unicorn.pid'
rack_env = ENV['RACK_ENV'] || 'production'

# log
stderr_path app_path + '/log/unicorn-error.log'
stdout_path app_path + '/log/unicorn.log'

# use correct gemfile
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end

# preload
preload_app false
