class RemoveEmergencyFromTasks < ActiveRecord::Migration[5.1]
  def change
      remove_columns :tasks, :emergency, :boolean
  end
end
