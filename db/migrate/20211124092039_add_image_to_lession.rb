class AddImageToLession < ActiveRecord::Migration[6.1]
  def change
    add_column :lessions, :image, :text
  end
end
