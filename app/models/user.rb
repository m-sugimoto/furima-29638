class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :records
  has_many :items

  
  with_options presence: true do
    validates :nickname, presence: true, length: { maximum: 6 }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX 
    validates :firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :firstname_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/} 
    validates :birthday
  end
    

end
