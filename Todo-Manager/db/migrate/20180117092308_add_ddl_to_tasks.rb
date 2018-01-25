class AddDdlToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :ddl, :date
  end
end
