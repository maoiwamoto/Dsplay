class ChangeDefTitles < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string, default: "無題"
    change_column :articles, :title, :string, default: "無題"
  end
end
