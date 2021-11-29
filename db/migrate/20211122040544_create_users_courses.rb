class CreateUsersCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :users_courses do |t|
      t.references :course, null: false, foreign_key: true, on_delete: :cascade
      t.references :user, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
