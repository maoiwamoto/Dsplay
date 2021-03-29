class ChangeNullPost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :image, false
  end
end
