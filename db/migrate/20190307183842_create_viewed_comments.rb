class CreateViewedComments < ActiveRecord::Migration[5.1]
  def change
    create_table :viewed_comments do |t|
      t.integer :comment_id
      t.integer :user_id
      t.datetime :last_read_time

      t.timestamps
    end
  end
end
