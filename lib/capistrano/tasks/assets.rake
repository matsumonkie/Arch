# this is done to override the default capistrano "deploy:compile_assets"
# because the default one compile the assets on the remote server
# which cause bugs if the server doesnt have enough RAM
# so instead, let's precompile the assets locally and upload them afterwardss

namespace :deploy do

  #Rake::Task['deploy:compile_assets'].clear_actions

  desc 'Precompile assets locally and upload to servers'
  task :compile_assets do
    on roles(:all) do
      # fetch & compile
      run_locally do
        with rails_env: fetch(:rails_env) do
          execute :rake, '"bower:install[\'-f\']"'
          execute :rake, "assets:precompile"
        end
      end

      # remove remote
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute "rm -rf #{shared_path}/public/assets"
        end
      end

      # upload
      within release_path do
        with rails_env: fetch(:rails_env) do
          upload!('./public/assets/', "#{shared_path}/public/", recursive: true)
        end
      end

      # remove locale
      run_locally { execute :rake, 'assets:clobber' }
    end
  end
end
