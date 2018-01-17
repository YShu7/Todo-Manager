class RemoveDeadlineFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :deadline, :date
  end
end
