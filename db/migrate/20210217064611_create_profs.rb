class CreateProfs < ActiveRecord::Migration[5.2]
  def change
    create_table :profs do |t|
      t.string :name, null: false
      t.string :pagetitle, null: false
      t.text :profile, null: false
      t.string :avator
      t.string :headerimage
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
