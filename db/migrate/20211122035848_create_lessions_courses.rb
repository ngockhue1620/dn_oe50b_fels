class CreateLessionsCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :lessions_courses do |t|
      t.references :course, null: false, foreign_key: true, on_delete: :cascade
      t.references :lession, null: false, foreign_key: true, on_delete: :cascade
      t.integer :time_learn

      t.timestamps
    end
  end
end
