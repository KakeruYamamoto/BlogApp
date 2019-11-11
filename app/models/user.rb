class User < ApplicationRecord
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  #class_name: 'Relationship' というオプションを記述しないとアソシエーション名と同じ名前のテーブル があるものだとみなし、そのテーブルとアソシエーションをしようとしてしまう
  #今回は下記も同様、そんなテーブルは存在しないので、テーブルに紐ずくモデル名をオプションとして記載することで、モデル名とテーブル名が違う場合でもそのアソシエーション名を期待するモデルと紐ずけてくれる
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  #上記の二つはあえて慣習的な名前ではない(モデル名と同じにすること)。それぞれを区別するため

  has_many :following, through: :active_relationships, source: :followed#フォローされた人

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :favorites, dependent: :destroy
  #has_many :favoritesは任意のUserインスタンスのidと、Favoritesテーブルにあるのuser_idの数字が一致しているものを全て取り出す
  has_many :blogs
  has_many :feeds
  validates :name, presence: true, length: { maximum: 30 }
  validates :email,presence: true, length: { maximum: 255 }, uniqueness: true,
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }#ユーザーの値がバリデーション判定される前にemail属性を強制的に小文字に変換します。
 #before_validationはコールバック
  has_secure_password#このメソはパスワードをハッシュ化する。＊要準備
  validates :password, presence: true, length: { minimum: 6 }
end



# has_secure_passwordメソッドは以下のような効果があります。
#
# セキュアにハッシュ化したパスワードを、データベース内のpassword_digestというカラムに保存する
# 2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される
# authenticateメソッドが使えるようになる (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 。
#このhas_secure_passwordメソッドを使用するためにはpassword_digestというカラムが必要だということに注意してください。

#もう一つhas_secure_passwordメソッドを使用するためにはbcryptと言うGemが必要  =>  gem 'bcrypt', '3.1.11'   =>  $ bundle install
#さらにpasswodカラムが使える。例えばrails cでhas_secure_passwordを使用前とその後を比較するとわかりやすい。




#コールバックとは
# コールバックとは、オブジェクトのライフサイクル期間における特定の瞬間に呼び出されるメソッドのことです。コールバックを利用することで、Active Recordオブジェクトが作成/保存/更新/削除/検証/データベースからの読み込み、などのイベント発生時に常に実行されるコードを書くことができます。









#
# メールアドレスの大文字と小文字は少し特別な扱いをされています。
# 例えばgmailやyahooメールなどの多くのメールサービスでは、大文字、小文字を区別しません。
# 携帯キャリアだと(softbank, au, docomoなど) 大文字が使用できない場合が多いです。
#
# なので、メールアドレスではAAA@example.comとaaa@example.comは同一のものと扱われるのです。
# よって、現在のシンプルなユニーク制約では不十分です。
#
# この問題の解決方法としてよく使われるのが、保存する前にメールアドレスの値を小文字に変換する方法です。
# ユーザの値がチェックされる時点で処理を実行したいので、before_validationというコールバックを使います。
# これを使って、ユーザーの値がバリデーション判定される前にemail属性を強制的に小文字に変換します。
#
# Userモデルを編集しましょう。
