class AddTwoColumnInChild < ActiveRecord::Migration
  def change
    add_column :children, :pet_name, :string
    add_column :children, :mother_tongue, :string
  end
end
