set :stage,     :production
set :rails_env, 'production'
set :deploy_to, '/var/www/zivotnamotorkach_cz'

server '81.0.240.83',
       user: 'zivotnamotorkach_cz',
       roles: %w(web app db)
