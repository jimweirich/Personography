class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_format_of :email, :with => /@/
  validates_uniqueness_of :email

  validates(:password,
    presence: true,
    confirmation: true,
    length: { :minimum => 4 },
    on: :create)

  attr_accessor :password

  before_save :encrypt_password

  def encrypt_password
#    unless password.blank?
      self.password_digest = BCrypt::Password.create(password)
#    end
  end
end
