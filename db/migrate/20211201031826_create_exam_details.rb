class CreateExamDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_details do |t|
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      t.integer :answer_id
      t.references :exam, null: false, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
