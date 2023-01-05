class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :terms, :password, :password_confirmation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :email, uniqueness: { case_insensitive: true }
  validates :country, presence: true, countries_alpha2: true

  validate :password_regex
  validates :phone_number, phone: { possible: true, allow_blank: true, types: [:voip, :mobile], country_specifier: -> phone { phone.country.try(:upcase) } }

  validate :terms_are_accepted, on: :create
  # has_Secure_password
  def skip_password_validation
    self.skip_password_validation= true if user.admin?
  end

  def first_name_with_admin
    return "#{first_name} (Super Admin)" if super_admin?
    return "#{first_name} (Admin)" if admin?
    first_name
  end

  private

  def terms_are_accepted
    return if self.terms.present? && self.terms.to_s == "true"

    self.errors.add(:terms, " not accepted")
  end

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/

    errors.add :password, 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
