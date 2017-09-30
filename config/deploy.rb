lock  "3.8.2"

set :user, "deploy"
set :local_user, "deploy"
set :application, "proj_terminal"
set :repo_url, "git@github.com:atmarkcafegit/proj_terminal.git"
set :ssh_options, {forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)}

set :pty, true
set :use_sudo , false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :linked_files, %w{config/database.yml config/secrets.yml .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :bundle_binstubs, nil
set :rvm_ruby, "2.4.0"

set :puma_role, :app
set :puma_workers, 2
set :puma_threads, [4, 16]
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :nginx_use_ssl, false

set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

namespace :puma do
  desc "Create Directories for Puma Pids and Socket"
  task :make_dirs do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/tmp/pids"
      execute "mkdir -p #{shared_path}/tmp/sockets"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      before "deploy:restart", "puma:start"
      invoke "deploy"
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end

  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
end
