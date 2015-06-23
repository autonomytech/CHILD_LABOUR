class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :is_yes_no_answer
      t.timestamps null: false
    end
    Question.create([{ question: 'मुंबईत असल्याचे आई वडिलांना माहिती आहे का \ '\
      ,  is_yes_no_answer: true }\
    , { question: 'मुंबई मध्ये काय काम करतो माहिती आहे का \ '\
      , is_yes_no_answer: true }\
    , { question: 'काम करत असेल तर किती पैसे पाठवतो \ ' }\
    , { question: 'कोठुन आला \ ' }\
    , { question: 'कधी आणले \ ' }\
    , { question: 'पालकांना किती पैसे दिले \ ' }\
    , { question: 'कोणाच्या ताब्यातून आणले \ ' }\
    , { question: 'कसा आणला ¼ वाहन @ रेल्वे @ इतर ½ \ ' }\
    , { question: 'सोबत किती मुले होती \ ' }\
    , { question: 'कोणाकडे काम करतो \ ' }\
    , { question: 'काय काम करतो \ कामाची वेळ \ ' }\
    , { question: 'पगार किती आहे \ ' }\
    , { question: 'किती दिवस काम करण्यासाठी आला आहे \ ' }\
    , { question: 'सदर मुलास बाहेर जाऊ नये @ पळू नये म्हणून काय उपाय केले होते \ ' }\
    , { question: 'शारीरिक किंवा लैंगिक छळ करण्यात येतो काय \ ', is_yes_no_answer: true }\
    , { question: 'असल्यास कोण करतो \ ' }\
    , { question: 'कोणामार्फत मुंबई मध्ये आला त्याचे नाव व नंबर \ ' }])
  end
end
