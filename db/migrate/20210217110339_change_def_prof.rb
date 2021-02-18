class ChangeDefProf < ActiveRecord::Migration[5.2]
  def change
    change_column :profs, :name, :string, default: "name"
    change_column :profs, :pagetitle, :string, default: "MyPage"
    change_column :profs, :profile, :text, default: "Hello World!"
  end
end
