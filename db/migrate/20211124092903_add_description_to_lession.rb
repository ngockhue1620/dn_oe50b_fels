class AddDescriptionToLession < ActiveRecord::Migration[6.1]
  def change
    add_column :lessions, :description, :string
  end
end
