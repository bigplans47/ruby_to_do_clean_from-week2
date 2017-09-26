require("rspec")
require("pg")
require("task")
require('spec_helper')
require('pry')

describe(Task) do

  describe(".not_done") do
    it("returns the not done tasks") do
      not_done_task1 = Task.create({:description => "gotta do it", :done => false})
      not_done_task2 = Task.create({:description => "gonna do it everyday", :done => false})
      not_done_tasks = [not_done_task1, not_done_task2]
      done_task = Task.create({:description => "done task", :done => true})
      # binding.pry
      expect(Task.not_done()).to(eq(not_done_tasks))
    end
  end

  describe("#list") do
    it("tells which list it belongs to") do
      test_list = List.create({:name => "list"})
      test_task = Task.create({:description => "task", :list_id => test_list.id})
      expect(test_task.list()).to(eq(test_list))
    end
  end

    describe("#downcase_description") do
      it("converts the name to lowercase") do
        task = Task.create({:description => "FINAGLE THE BUFFALO"})
        # task.description.downcase_description
        # binding.pry
        expect(task.description()).to(eq("finagle the buffalo"))
      end

    end
  # describe(".all") do
  #   it("is empty at first") do
  #     expect(Task.all()).to(eq([]))
  #   end
  # end

  # describe("#save") do
  #   it("adds a task to the array of saved tasks") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     test_task.save()
  #     expect(Task.all()).to(eq([test_task]))
  #   end
  # end

  # describe("#description") do
  #   it("lets you read the description out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.description()).to(eq("learn SQL"))
  #   end
  # end

  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.list_id()).to(eq(1))
  #   end
  # end

  # describe("#==") do
  #   it("is the same task if it has the same description and list ID") do
  #     task1 = Task.new({:description => "learn SQL", :list_id => 1})
  #     task2 = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(task1).to(eq(task2))
  #   end
  # end

  # describe(".sort") do
  #   it("sorts by name") do
  #     task1 = Task.new({:description => "Zebra", :list_id => 1})
  #     task2 = Task.new({:description => "Apple", :list_id => 1})
  #     task1.save()
  #     task2.save()
  #     expect(Task.sort()).to(eq([task2, task1]))
  #   end
  # end

end
