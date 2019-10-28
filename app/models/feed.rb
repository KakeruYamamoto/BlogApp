class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader#imageカラムに、ImageUploaderを紐付けます。
  belongs_to :user
  validates :image, presence: true
  validates :content,  presence: true
end#ImageUploaderはuploaders/image_uploaderにあるクラス
