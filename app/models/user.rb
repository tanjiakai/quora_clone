
class User < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  has_many :questions
  has_many :answers

  def self.authenticate?(email, password)
    user = User.find_by(email: email)
    user.password == password
  end

  def self.exist?(email)
    return true if User.find_by(email: email)
  end
end