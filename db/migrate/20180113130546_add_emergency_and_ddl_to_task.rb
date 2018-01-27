class AddEmergencyAndDdlToTask < ActiveRecord::Migration[5.1]
  def change
      add_column :tasks, :emergency, :boolean
      add_column :tasks, :deadline, :date
  end
end
