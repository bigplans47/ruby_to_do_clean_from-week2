ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("list")
require("task")



# DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
    # DB.exec("DELETE FROM lists *;")
    # DB.exec("DELETE FROM tasks *;")
  end
end
