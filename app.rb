require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

# DB = PG.connect({:dbname => "to_do_test"})

get("/") do
  @tasks = Task.all()
  erb(:index)
end

get("/lists/new") do
  erb(:list_form)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

post("/lists") do
  name = params.fetch("name")
  @list = List.new({:name => name, :id => nil})
  @list.save()
  @lists = List.all()
  erb(:success)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  # @lists = List.all()
  erb(:list)
end

get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

patch("/lists/:id") do
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  erb(:list)
end

delete("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @list.delete()
  @lists = List.all()
  erb(:index)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i)
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end
