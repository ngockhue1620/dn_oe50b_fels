class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.float :score
      t.references :lession, null: false, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
