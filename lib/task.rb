class Task < ActiveRecord::Base
  belongs_to(:list)
  validates(:description, {:presence => true, :length => {:maximum => 50}})
  before_save(:downcase_description)

  scope(:not_done, -> do
    where({:done => false})
  end)

  private

    def downcase_description
      self.description=(description().downcase())
    end



end
# belongs_to(:list)

# class Task
#   attr_reader(:description, :list_id)
#
#   def initialize(attributes)
#     @description = attributes.fetch(:description)
#     @list_id = attributes.fetch(:list_id)
#   end
#
#   def self.all
#     returned_tasks = DB.exec("SELECT * FROM tasks;")
#     tasks = []
#     returned_tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     tasks
#   end
#
#   def save
#     DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
#   end
#
#   def ==(another_task)
#     self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
#   end
#
#   def self.sort()
#     returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY description;")
#     tasks = []
#     returned_tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     tasks
#   end
# end
