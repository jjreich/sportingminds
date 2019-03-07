class AddIndecesToViewedComments < ActiveRecord::Migration[5.1]
  def change
  	add_index :viewed_comments, :user_id
  	add_index :viewed_comments, :comment_id
  end
end
