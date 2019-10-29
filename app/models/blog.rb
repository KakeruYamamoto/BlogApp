class Blog < ApplicationRecord
  belongs_to :user
#validates:titleを設定することでtitleにバリデーションを設定。そしてpresence:tureで空の登録を禁止する。
    validates :title, presence: true #presenceは他にも種類がある下記参照 presenceは空でないことがture  テキストでは空だと保存を止めたいのでpresence
    # validates :content, length:{minimum:1} #一文字以上
    # validates :content, length:{maximum:75} #75文字以下
    validates :content,length: { in: 1..140 }   #1文字以上140以下
    #validates :content, length{is:8} #8文字のみ

    #validates :login, absence: true #空であることがture
    #validates :user_name, uniqueness: true #ユニークであること（同じものが２つあってはいけない存在）
end
