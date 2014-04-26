# be sure to change these
set :user, 'root'
set :domain, 'finpln.ru'
set :application, 'finpln'

set :rvm_ruby_string, 'ruby-2.0.0-p451'
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

set :rvm_type, :user
set :rvm_path, "/usr/local/rvm"
# file paths
#set :repository, "#{user}@#{domain}:git/#{application}.git"
set :deploy_to, "/home/#{user}/#{domain}"
role :app, domain
role :web, domain
role :db, domain, :primary => true

set :default_run_options, {:pty => true}

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :repository, "git@github.com:atryom/FinPln.git"
set :ssh_options, { :forward_agent => true }
set :scm_passphrase, "Rkl3SXt"
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production
namespace :deploy do
  task :start do
    run "ssh git@github.com"
  end
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch # {current_path}/tmp/restart.txt"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd # {current_path}; rake db:seed RAILS_ENV = #{rails_env}"
  end
end
after "deploy :update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end



# Load RVM's capistrano plugin.


