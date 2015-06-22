class AddSomeFieldInEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :shop_act_lnc, :string
    add_column :employers, :industry_type, :string
    add_column :employers, :is_adhar_card, :boolean
    add_column :employers, :is_voter_card, :boolean
    add_column :employers, :is_pan_card, :boolean
    add_column :employers, :adhar_card, :string
    add_column :employers, :voter_card, :string
    add_column :employers, :pan_card, :string
  end
end
