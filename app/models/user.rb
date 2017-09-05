class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { minimum: 3, maximum: 55 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 3 }

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user)
  end
end
