class RenameUserProfile < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_profiles, :profs
  end
end
