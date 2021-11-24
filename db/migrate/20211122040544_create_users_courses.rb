class CreateUsersCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :users_courses do |t|
      t.references :courses, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
