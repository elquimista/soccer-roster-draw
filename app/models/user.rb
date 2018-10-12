class User < ApplicationRecord
  attr_reader :password

  validates :password, presence: true

  def password=(plain_password)
    @password = plain_password
    self.password_digest = BCrypt::Password.create(plain_password) if @password.present?
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest) == password
  end

  def as_json(options = {})
    super(options.merge except: :password_digest)
  end
end
