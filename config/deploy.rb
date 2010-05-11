set :application, "percolate"
set :scm, "git"
set :repository, "git@github.com:jdollard/percolate.git"
set :branch, "production"

#keep a remote cache of the source code on the remote server, and
#deploy using that.  makes for very fast deploys
set :deploy_via, :remote_cache

set :deploy_to, "/data/#{application}/www"

set :user, "percolate"
set :use_sudo, false

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"    
  end  
end

#checkout the code locally, then copy the checked out version to the server
EXCLUDE_FROM_DEPLOY = [
  ".git", 
	"resources"
	]
	
set :copy_exclude, EXCLUDE_FROM_DEPLOY
set :copy_compression, :bz2

role :app, "www.percolatestudio.com"
role :web, "www.percolatestudio.com"
role :db,  "www.percolatestudio.com", :primary => true