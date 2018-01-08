class Idea < ApplicationRecord
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
  validates :title, :description, :category_id, presence: true
end