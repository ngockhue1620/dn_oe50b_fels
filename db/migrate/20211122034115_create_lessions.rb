class CreateLessions < ActiveRecord::Migration[6.1]
  def change
    create_table :lessions do |t|
      t.string :name
      t.integer :duration
      t.timestamps
    end
  end
end
