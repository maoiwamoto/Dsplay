class ChangeNullArticle < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :body, false
  end
end
