class AddUserToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :user, foreign_key: true
    add_column :blogs, :timestamps, :string
  end
end
