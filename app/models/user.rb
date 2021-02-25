class User < ApplicationRecord
    # パスワードをハッシュ化する
    has_secure_password

    #バリデーション
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    #アソシエーション
    has_many :tasks
end
