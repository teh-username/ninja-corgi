class User < ActiveRecord::Base

  # Validations
  # Same as that of in message model
  validates :name, length: { maximum: 30 }, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

  # http://stackoverflow.com/a/336220 but ^ -> \A and $ -> \z, allows alphanumeric + underscores
  # I'll probably allow case sensitive usernames just to add entropy to whatever
  validates :username, length: { maximum: 30 }, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]*\z/ }

  validates :password, presence: true, length: { minimum: 10 }

  # make model use passwords
  has_secure_password

  # Creates a bcrypt hash of whatever
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
