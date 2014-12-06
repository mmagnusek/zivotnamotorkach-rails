set :stage,     :staging
set :deploy_to, '/var/www/zivotnamotorkach-rails_webapps_cz'
set :rails_env, 'staging'

server 'REPLACE_ME',
        user: 'zivotnamotorkach-rails_webapps_cz',
        roles: %w(web app db)

