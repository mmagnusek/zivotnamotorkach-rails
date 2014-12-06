set :stage,     :production
set :rails_env, 'production'
set :deploy_to, '/var/www/zivotnamotorkach-rails_com'

server 'REPLACE_ME',
       user: 'zivotnamotorkach-rails',
       roles: %w(web app db)
