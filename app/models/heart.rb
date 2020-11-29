class Heart < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :detail
    validates :category_id, numericality: { other_than: 1 }
  end
end
