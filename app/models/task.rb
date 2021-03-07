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

    ##アソシエーション
    belongs_to :user

    ##スコープ
    #tasks = Task.recent　→　全件を新しい順で取得
    scope :recent, -> {order(created_at: :desc)}

    ##ransack用の設定
    #検索対象にすることを許可するカラムを指定（デフォルトは全カラムを対象）
    def self.ransackable_attributes(auth_object = nil)
        %w[name created_at]
    end

    #検索対象に含める関連を指定
    #空配列を返すようにオーバーライドすることで検索条件に意図しない関連を含めないようにすることができる
    def self.ransackable_associations(auth_object = nil)
        []
    end

    #プライベートメソッド
    private

    def validate_name_not_including_commma
        #&.を利用して、nameがnilの時にはfalseを返すようにする。（例外が発生しないようにする？）
        errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
    end
end
