class Task < ApplicationRecord
    #presence→必須データが入っているか？
    validates :name, presence: true
    #name の最大長は30文字
    validates :name, length: {maximum: 30}
    #上記２つは纏めて↓のようにも書ける
    #validates :name, presence: true, lentgh: {maximum: 30}

    #検証用メソッドの練習
    #検証用メソッドの名前を定義
    validate :validate_name_not_including_commma

    #プライベートメソッド
    private

    def validate_name_not_including_commma
        #&.を利用して、nameがnilの時にはfalseを返すようにする。（例外が発生しないようにする？）
        errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
    end
end
