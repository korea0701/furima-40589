class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'は@を含む有効なメールアドレスを入力してください' }
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '姓は全角文字で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '名は全角文字で入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '姓のふりがなは全角カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '名のふりがなは全角カタカナで入力してください' }
  validates :birthday, presence: true

  has_many :items
  has_many :orders
end
