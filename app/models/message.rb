class Message < ActiveRecord::Base
  # Callbacks
  before_save {self.email.downcase!}

  # Validations

  # Name Regex source: http://stackoverflow.com/questions/2629422/rails-validating-full-name
  validates :first_name, :last_name, length: { maximum: 30 }, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

  # Email Regex source: https://www.railstutorial.org/book/modeling_users
  validates :email, length: { maximum: 255 }, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :subject, length: { maximum: 30 }, presence: true

  validates :content, length: {maximum: 255},  presence: true

end
