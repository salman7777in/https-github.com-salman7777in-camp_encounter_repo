class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: { case_insensitive: true }
  validates :country, countries_alpha2: true
  # validates :phone_number, phone: {possible: true, allow_blank: false}, uniqueness: false
  validates :phone_number, phone: { possible: true, allow_blank: true, types: [:voip, :mobile], country_specifier: -> phone { phone.country.try(:upcase) } }
  before_save :format_phone
  def format_phone
    self.phone_number = Phonelib.parse(phone_number).e164
  end
end
