class CreateEmployerSections < ActiveRecord::Migration
  def change
    create_table :employer_sections do |t|
      t.string :laws
      t.string :acts
      t.string :sections
      t.references :employer, index: true

      t.timestamps null: false
    end
    add_foreign_key :employer_sections, :employers
  end
end
