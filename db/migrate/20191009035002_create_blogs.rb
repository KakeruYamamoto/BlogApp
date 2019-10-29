class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title #データ型：カラム名
      t.text :content
      
    end
  end
end
