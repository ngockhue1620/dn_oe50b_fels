class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_right
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      
      t.timestamps
    end
  end
end
