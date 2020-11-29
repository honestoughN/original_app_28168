class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hearts, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /@/, message: "は@を含めて入力して下さい" }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: "は半角英数字6文字以上で入力して下さい"}
  end
end
