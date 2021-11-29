class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.references :lession, null: false, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
