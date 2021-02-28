class AddAttrToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :crop_x, :integer
    add_column :posts, :crop_y, :integer
    add_column :posts, :crop_w, :integer
    add_column :posts, :crop_h, :integer
  end
end
