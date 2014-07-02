require './config/environment.rb'

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use HousesController
use KidsController
use RootController
run HalloweenController