class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
