class RemoveEmergencyFromTasks < ActiveRecord::Migration[5.1]
  def change
      remove_column :tasks, :emergency, :boolean
  end
end
