class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :is_yes_no_answer
      t.timestamps null: false
    end
    Question.create([{ question: "Child's parents knows, whether he/she lives in Mumbai?"\
      ,  is_yes_no_answer: true }\
    , { question: 'Whether parents knows, what he/she does in Mumbai?'\
      , is_yes_no_answer: true }\
    , { question: 'if working, then how much money sends?' }\
    , { question: 'Came from?' }\
    , { question: 'When brought?' }\
    , { question: 'How much money have been given to parents?' }\
    , { question: 'Handover from whom?' }\
    , { question: 'How brought (by vehicle/train/other)?' }\
    , { question: 'How many chidren were along with him/her?' }\
    , { question: 'Working under which person?' }\
    , { question: 'What does he/she works? Working time?' }\
    , { question: 'How much salary?' }\
    , { question: 'Comes to work for how many days?' }\
    , { question: 'Provision made to regarding child, that not to run away or not to escape?' }\
    , { question: 'Physical or sexual harassment is being conducted?', is_yes_no_answer: true }\
    , { question: 'If yes, then who does?' }\
    , { question: 'Name and address of person by whom the child came in Mumbai' }])
  end
end
