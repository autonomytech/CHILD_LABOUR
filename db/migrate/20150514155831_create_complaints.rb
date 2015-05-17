class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_no
      t.string :email
      t.string :area
      t.string :subject
      t.datetime :last_seen_date
      t.string :description

      t.timestamps null: false
    end
  end
end
