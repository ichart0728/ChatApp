class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    #add_column :'name of the table that you want to apply this method', :'name of the field that you want to add', :'type'
    add_column :articles, :user_id, :int
  end
end
