class DeleteProf < ActiveRecord::Migration[5.2]
  def change
    drop_table :profs
  end
end
