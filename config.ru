require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
##Middleware
use Rack::MethodOverride

use DestinationsController
run ApplicationController
