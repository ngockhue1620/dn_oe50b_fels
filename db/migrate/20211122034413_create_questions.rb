class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :type
      t.references :lession, null: false, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
