require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

use Rack::MethodOverride
# map the controllers to routes
map('/tasks') { run TasksController }
map('/doers') { run DoersController }
map('/') { run ApplicationController }

# use TasksController
# use DoersController
# run ApplicationController
