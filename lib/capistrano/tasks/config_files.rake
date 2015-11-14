namespace :deploy do
  desc 'Updates shared/config/*.yml files with the proper ones for environment'
  task :upload_shared_config_files do
    config_files = {}

    run_locally do
      # Order matters!
      local_config_directories = [
        "config/"
      ]

      # Environment specific files first
      local_config_directories.each do |directory|
        Dir.chdir(directory) do
          Dir.glob("*.yml") do |file_name|
            # Skip this file if we've already uploaded a env. specific one
            next if config_files.keys.include? file_name

            cksum = capture "cksum", File.join(Dir.pwd, file_name)
            config_files[file_name] = cksum
          end
        end
      end
    end

    on roles(:all) do
      config_path = File.join shared_path, "config"
      execute "mkdir -p #{config_path}"

      config_files.each do |file_name, local_cksum|
        remote_file_name = "#{config_path}/#{file_name}"

        # Get the
        lsum, lsize, lpath = local_cksum.split

        if test("[ -f #{remote_file_name} ]")
          remote_cksum = capture "cksum", remote_file_name
          rsum, rsize, rpath = remote_cksum.split

          if lsum != rsum
            upload! lpath, remote_file_name
            info "Replaced #{file_name} -> #{remote_file_name}"
          end
        else
          upload! lpath, remote_file_name
          info "Upload new #{file_name} -> #{remote_file_name}"
        end
      end
    end
  end

  before :check, :upload_shared_config_files
end
