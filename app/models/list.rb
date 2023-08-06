class List < ApplicationRecord
  has_one_attached :image #タスクに1つの画像を紐づけるメソッド

  #バリデーション機能で入力チェック。画像、タイトル、本文が「必須」入力になるように設定。
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

end
