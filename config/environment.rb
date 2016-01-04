require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/doers_and_tasks.db"
  )

$: << '.'

Dir["app/models/*.rb"].each {|f| require f}
