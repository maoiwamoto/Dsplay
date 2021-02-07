class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, :null => false
      t.text :caption

      t.timestamps
    end
  end
end
