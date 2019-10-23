class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email,presence: true, length: { maximum: 255 }, uniqueness: true,
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end



# has_secure_passwordメソッドは以下のような効果があります。
#
# セキュアにハッシュ化したパスワードを、データベース内のpassword_digestというカラムに保存する
# 2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される
# authenticateメソッドが使えるようになる (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 。
#このhas_secure_passwordメソッドを使用するためにはpassword_digestというカラムが必要だということに注意してください。

#もう一つhas_secure_passwordメソッドを使用するためにはbcryptと言うGemが必要  =>  gem 'bcrypt', '3.1.11'   =>  $ bundle install













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
