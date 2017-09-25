class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table(:lists) do |t|
      t.column(:name, :varchar)
      t.column(:done, :boolean)
      t.column(:tasks_id, :int)

      t.timestamps()
    end
  end
end
