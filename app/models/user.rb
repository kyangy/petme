class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  attr_reader :password

  has_many :posts

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
    @password = unencrypted_password
  	self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  		return self
  	else
  		return false
  	end
  end

  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitve: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, on: :create

end
