class User < ApplicationRecord
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
  attr_accessor :remember_token, :activation_token
=======
  attr_accessor :remember_token, :activation_token, :reset_token
>>>>>>> Chapter 12

  scope :load_data, ->{select("id, name, email").order created_at: :desc}

  before_save :downcase_email
  before_save :create_activation_digest

  validates :name, presence: true, length: {maximum: Settings.user.name.max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.password.min_length}, allow_nil: true

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? attribute, token
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
    digest = send "#{attribute}_digest"
=======
    digest = send("#{attribute}_digest")
>>>>>>> Chapter 12
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
=======
  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes reset_digest: User.digest(reset_token),
      reset_send_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_send_at < 2.hours.ago
  end

>>>>>>> Chapter 12
  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
