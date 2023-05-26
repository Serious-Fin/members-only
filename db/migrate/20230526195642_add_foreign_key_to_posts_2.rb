class AddForeignKeyToPosts2 < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :foreign_key
  end
end
