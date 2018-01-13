class AddNameToGroup < ActiveRecord::Migration[5.1]
  def change
      add_column :groups, :name, :string
  end
end
