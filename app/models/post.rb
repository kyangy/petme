class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  field :coordinates, :type => Array
  field :address
  geocoded_by :address   # can also be an IP address
  after_validation :geocode         # auto-fetch coordinates
  geocoded_by :address, :skip_index => true

  field :type, type: String
  field :breed, type: String
  field :age, type: String
  field :gender, type: String
  field :price, type: Float
  field :description, type: String

  belongs_to :user
  embeds_many :comments

  mount_uploader :image, AvatarUploader

  def date_published
    # self refers to the object thats calling this method
    self.created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
