class AddPagetitleToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :pagetitle, :string, null: false, default: 'myroom'
  end
end
