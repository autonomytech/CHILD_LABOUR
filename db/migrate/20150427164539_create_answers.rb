class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question, index: true
      t.references :child, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :children
  end
end
