class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :name

      t.timestamps null: false
    end
    Law.create([{ name: "बाल कामगार" }, { name: "पॉस्को" }\
    , { name: "महा भीक मागत" }, { name: "मुंबई शॉपचे व आस्थापना" }])
  end
end
