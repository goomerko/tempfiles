set :application, "TempFiles"
set :repository, "git@github.com:goomerko/tempfiles.git"



if ENV['TEMPFILES_ENV'] == 'production'
  set :deploy_to, "/var/tempfiles/deploy"
else
  set :deploy_to, "/var/tempfiles/test_deploy"
end

set :user, 'capishi'
set :use_sudo, false

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "91.121.115.178"
role :web, "91.121.115.178"
role :db, "91.121.115.178", :primary => true

namespace :deploy do
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
end