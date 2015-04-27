class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question

      t.timestamps null: false
    end
    Question.create([{ question: 'Are parent knows about lives in mumbai?' }\
    , { question: 'Are parent know about work status?' }\
    , { question: 'When money send to home?' }, { question: 'Homwtown?' }\
    , { question: 'When come here?' }\
    , { question: 'How many money send to home?' }\
    , { question: 'How your payment' }])
  end
end
