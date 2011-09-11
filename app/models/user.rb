class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_format_of :email, :with => /@/
  validates_uniqueness_of :email

  validates :password, length: { :minimum => 4 }, on: :create

  has_secure_password

  attr_accessor :password

  before_validation :encrypt_password

  def encrypt_password
    unless password.blank?
      self.password_digest = BCrypt::Password.create(password)
    end
  end
end
