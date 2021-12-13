class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }
end
