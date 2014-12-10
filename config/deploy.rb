require "bundler/capistrano"
require "rvm/capistrano"

server "do", :web, :app, :db, primary: true

set :rvm_ruby_string, '2.1.5'
set :rvm_type, :user
set :application, "elcoding"
set :user, "ejiqpep"
set :deploy_to, "/home/sites/elcoding.com/www/"
set :deploy_via, :remote_cache
set :use_sudo, false
set :shared_children, shared_children + %w{public/uploads}

set :scm, "git"
set :repository, "https://github.com/EJIqpEP/bloghm.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"


namespace :deploy do
  %w[start stop restart].each do |command|
  	desc "#{command} unicorn server"
  	task command, roles: :app, except: {no_release: true} do
      sudo "chmod a+x #{current_path}/config/unicorn_init.sh"
      run "mkdir -p #{current_path}/tmp/sockets && mkdir -p #{current_path}/tmp/pids"
  		run "/etc/init.d/unicorn_#{application} #{command}"
  	end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  	run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/tmp/sockets && mkdir -p #{shared_path}/tmp/pids"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
