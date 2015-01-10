class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :breed, type: String
  field :age, type: String
  field :gender, type: String
  field :price, type: Float
  field :about, type: String

  belongs_to :user

  mount_uploader :image, AvatarUploader
end
