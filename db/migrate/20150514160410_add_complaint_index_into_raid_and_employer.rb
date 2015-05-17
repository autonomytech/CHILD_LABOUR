class AddComplaintIndexIntoRaidAndEmployer < ActiveRecord::Migration
  def change
    add_column :raids, :complaint_id, :integer
    add_index :raids, :complaint_id
    add_foreign_key :raids, :complaints
    add_column :complaints, :employer_id, :integer
    add_index :complaints, :employer_id
    add_foreign_key :complaints, :employers
  end
end
