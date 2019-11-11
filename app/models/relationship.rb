class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
  #こちらもuserモデルに記述したアソシエーション同様関連づけるuserモデルは同じだけれども
  #フォローするものされるものを区別するために名前を慣習的でない名にしている
  
end
