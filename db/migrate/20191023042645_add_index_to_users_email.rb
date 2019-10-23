class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
     add_index :users, :email, unique: true#このような記述をすることで、今あるテーブルに新たにインデックスを追加するマイグレーションファイルを生成できます。
  end#unique: trueでデータベースレベルで重複を防ぐ。
end
#:usersが追加したいテーブル名で、:emailが、そのテーブルの中にある、インデックスを追加する対象のカラムを指定します

#add_indexメソッドはUserテーブルのemailカラムにインデックスを追加する
