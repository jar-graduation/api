require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :user, 'deploy'
set :domain, 'afstuderen'
set :app_name, 'api'
set :repository, "https://github.com/jar-graduation/#{app_name}.git"

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log']

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

task :pro do
  set :rails_env, "production"
  set :branch, "master"
  set :deploy_to, "/home/#{user}/#{app_name}/#{rails_env}"
end

task :pre do
  set :rails_env, "preproduction"
  set :branch, "development"
  set :deploy_to, "/home/#{user}/#{app_name}/#{rails_env}"
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[mkdir -p "#{deploy_to}"]
  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[-----> Be sure to edit 'shared/config/database.yml'.]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.

    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'

    queue %[cd #{deploy_to}/current]
    queue %[echo "-----> bundle exec rake db:migrate RAILS_ENV=#{rails_env}"]
    queue %[bundle exec rake db:migrate RAILS_ENV=#{rails_env}]

    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

