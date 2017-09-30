server "18.220.2.133", roles: [:web, :app, :db], primary: true
set :stage, :production
set :puma_env, fetch(:rack_env, fetch(:rails_env, "production"))
set :branch, :develop

namespace :deploy do
  desc "Make sure local git is in sync with remote"
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse acv/develop`
        puts "WARNING: HEAD is not the same as acv/develop"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  before :starting, :check_revision
end
