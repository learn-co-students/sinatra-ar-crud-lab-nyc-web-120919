
require './config/environment'

begin
  fi_check_migration

  
  run ApplicationController
  use Rack::MethodOverride
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
