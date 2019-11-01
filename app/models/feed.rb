class Feed < ApplicationRecord
  has_many :favorites, dependent: :destroy#has_many :favoritesは、任意のBlogインスタンス(ここではFeed)のidと、Favoritesテーブルにあるのblog_id(feed_idのこと)の数字が一致しているものを全て取り出す
  #dependent: :destroy とすることで、ブログが削除されると同時に、お気に入り情報も削除される
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader#imageカラムに、ImageUploaderを紐付けます。
  #mount_uploaderは、画像アップロードの宣言をしている
#   上記の記述をすることで、feedsテーブルの中にあるimageカラムにimageUploaderという名前のアップローダ機能を追加することができます。
# アップローダ機能が追加されたカラムの中に文字列の画像パスを保存すると、アクセス先コンピュータ内にある該当の画像ファイルを出力できるようになります。
#
# アップローダ定義の意味を総括すると以下のようになります。
#
# feedモデルが関係しているのでfeedsテーブルが関係している
# mount_uploaderは、画像アップロードの宣言をしている
# :imageはfeedsテーブル内の画像パスが入っているカラム名を指している
# ImageUploaderは、ImageUploaderファイル内の設定を元にアップロードすることを意味している
  belongs_to :user
  validates :image, presence: true
  validates :content,  presence: true
end#ImageUploaderはuploaders/image_uploaderにあるクラス
